import 'package:crypto_wallet/domain/repositories/repositories.dart';
import 'package:web3dart/web3dart.dart';

class ContractRepositoryImpl extends ContractRepository {
  @override
  Future<EtherAmount> getEthBalance(String publicKey) {
    // TODO: implement getEthBalance
    throw UnimplementedError();
  }

  @override
  Future<String> getTokenBalance(String contractAddress, String publicKey) {
    // TODO: implement getTokenBalance
    throw UnimplementedError();
  }

  @override
  Future<String> getTokenDecimal(String contractAddress) {
    // TODO: implement getTokenDecimal
    throw UnimplementedError();
  }

  @override
  Future<String> getTokenSymbol(String contractAddress) {
    // TODO: implement getTokenSymbol
    throw UnimplementedError();
  }

  @override
  Future<void> initialize() {
    // TODO: implement initialize
    throw UnimplementedError();
  }

  @override
  Future<String> sendEth(String privateKey) {
    // TODO: implement sendEth
    throw UnimplementedError();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
