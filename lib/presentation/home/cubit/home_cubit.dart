import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:crypto_wallet/domain/repositories/phrase_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:web3dart/web3dart.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required PhraseRepository phraseRepository})
      : _phraseRepository = phraseRepository,
        super(const HomeState()) {
    emit(
      state.copyWith(
        ethBalance: EtherAmount.zero(),
      ),
    );
  }

  final PhraseRepository _phraseRepository;

  final String apiUrl =
      'https://eth-ropsten.alchemyapi.io/v2/1uET-dNg2TNtF1-mV1BZbcN8XVQZHVt8';
  final httpClient = http.Client();
  late final Web3Client _web3client;
  late final Credentials _credentials;
  late final DeployedContract _contract;
  late final String _publicAddress;
  late final EthereumAddress _ethereumAddress;

  // Contract RPC API
  ContractEvent _transferEvent() => _contract.event('Transfer');
  ContractFunction _balanceFunction() => _contract.function('balanceOf');
  ContractFunction _tokenSymbol() => _contract.function('symbol');
  ContractFunction _tokenDecimals() => _contract.function('decimals');
  ContractFunction _sendFunction() => _contract.function('transfer');

  Future<void> initialiseClient() async {
    _web3client = Web3Client(
      apiUrl,
      http.Client(),
    );
  }

  Future<void> initialiseContract(String contractAddress) async {
    // Initialise Deployed Contract
    final abiString = await rootBundle.loadString('assets/abi/abi.json');
    final abi = ContractAbi.fromJson(abiString, 'CSToken');
    _contract = DeployedContract(abi, EthereumAddress.fromHex(contractAddress));
  }

  Future<void> getTokenBalance(
    String publicKey,
  ) async {
    final ethAddress = EthPrivateKey.fromHex(publicKey);
    final response = await _web3client.call(
      contract: _contract,
      function: _balanceFunction(),
      params: <dynamic>[ethAddress],
    );
    print(response.first);
  }

  Future<void> getTokenSymbol() async {
    final response = await _web3client.call(
      contract: _contract,
      function: _tokenSymbol(),
      params: <dynamic>[],
    );
    print(response.first);
  }

  Future<void> getTokenDecimals() async {
    final response = await _web3client.call(
      contract: _contract,
      function: _tokenDecimals(),
      params: <dynamic>[],
    );
    print(response.first);
  }

  Future<void> getEthBalance(
    String publicKey,
  ) async {
    final ethAddress = EthereumAddress.fromHex(publicKey);
    final response = await _web3client.getBalance(ethAddress);
    print(response);
    emit(
      state.copyWith(
        ethBalance: response,
      ),
    );
  }

  Future<void> sendEth(
    String privateKey,
  ) async {
    final ethAddress = await _phraseRepository.generatePublicKey(
      privateKey,
    );
    final Credentials creadentials = EthPrivateKey.fromHex(privateKey);
    final toAddress =
        EthereumAddress.fromHex('0x31f8C0C84bB05c0d274f153B79188cF399BfaCA1');
    final amount = BigInt.from(1 * pow(10, 12));
    final transaction = Transaction(
      from: ethAddress,
      to: toAddress,
      value: EtherAmount.inWei(amount),
    );
    final response = await _web3client
        .sendTransaction(creadentials, transaction, chainId: 3);
    print(response);
  }

  @override
  Future<void> close() {
    _web3client.dispose();
    return super.close();
  }
}
