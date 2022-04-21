import 'dart:async';
import 'dart:convert';

import 'package:bip39/bip39.dart' as bip39;
import 'package:crypto_wallet/domain/models/wallet_model.dart';
import 'package:crypto_wallet/domain/repositories/phrase_repository.dart';
import 'package:ed25519_hd_key/ed25519_hd_key.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hex/hex.dart';
import 'package:web3dart/web3dart.dart';

class IncorrectPasswordException implements Exception {}

class PhraseRepositoryImpl extends PhraseRepository {
  PhraseRepositoryImpl({FlutterSecureStorage? storage})
      : _storage = storage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _storage;

  @override
  Stream<AuthStatus> get status async* {
    final data = await _storage.read(key: 'data');
    final ivData = await _storage.read(key: 'iv');
    final salt = await _storage.read(key: 'salt');
    if (data != null && ivData != null && salt != null) {
      yield AuthStatus.authenticated;
    } else {
      yield AuthStatus.unauthenticated;
    }
  }

  @override
  Future<String> generatePrivatekey(String mnemonics) async {
    final seedBytes = bip39.mnemonicToSeed(mnemonics);
    final masterKey = await ED25519_HD_KEY.getMasterKeyFromSeed(seedBytes);
    final privateKeyHex = HEX.encode(masterKey.key);
    return privateKeyHex;
  }

  @override
  Future<EthereumAddress> generatePublicKey(String privateKeyHex) async {
    final privateKey = EthPrivateKey.fromHex(privateKeyHex);
    final publicAddress = await privateKey.extractAddress();
    return publicAddress;
  }

  @override
  String getMnemonics() => bip39.generateMnemonic();

  @override
  Future<void> saveData(WalletModel data, String password) async {
    final salt = IV.fromSecureRandom(16);
    final secretKey = Key.fromUtf8(password).stretch(16, salt: salt.bytes);
    final jsonData = json.encode(data.toJson());
    final iv = IV.fromSecureRandom(16);
    final encrypter = Encrypter(AES(secretKey, mode: AESMode.cbc));

    final encrypted = encrypter.encrypt(jsonData, iv: iv);
    await _storage.write(key: 'data', value: encrypted.base64);
    await _storage.write(key: 'iv', value: iv.base64);
    await _storage.write(key: 'salt', value: salt.base64);
  }

  @override
  Future<WalletModel?> retrieveData(String password) async {
    try {
      final data = await _storage.read(key: 'data');
      final iv = await _storage.read(key: 'iv');
      final salt = await _storage.read(key: 'salt');
      if (data == null || iv == null || salt == null) return null;
      final secretKey =
          Key.fromUtf8(password).stretch(16, salt: IV.fromBase64(salt).bytes);
      final encrypter = Encrypter(AES(secretKey, mode: AESMode.cbc));

      final encrypted = encrypter.decrypt(
        Encrypted.fromBase64(data),
        iv: IV.fromBase64(iv),
      );
      final jsonData = jsonDecode(encrypted) as Map<String, dynamic>;
      return WalletModel.fromJson(jsonData);
    } catch (e) {
      throw IncorrectPasswordException();
    }
  }
}
