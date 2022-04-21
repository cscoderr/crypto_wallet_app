import 'package:crypto_wallet/domain/models/wallet_model.dart';
import 'package:web3dart/web3dart.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
  unknown,
}

abstract class PhraseRepository {
  Future<String> generatePrivatekey(String mnemonics);

  Future<EthereumAddress> generatePublicKey(String privateKeyHex);

  String getMnemonics();

  Future<void> saveData(WalletModel data, String password);

  Future<WalletModel?> retrieveData(String password);

  Stream<AuthStatus> get status;
}
