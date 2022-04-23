import 'package:web3dart/web3dart.dart';

abstract class ContractRepository {
  Future<void> initialize();

  Future<String> getTokenSymbol(String contractAddress);

  Future<String> getTokenDecimal(String contractAddress);

  Future<String> getTokenBalance(String contractAddress, String publicKey);

  Future<List> getTransactions(String contractAddress);

  Stream<EtherAmount> getEthBalance(String publicKey);

  Future<String> sendEth(
      {required String privateKey, required String to, required BigInt amount});

  void dispose();
}
