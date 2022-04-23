part of 'add_token_cubit.dart';

enum AddTokenStatus {
  initial,
  loading,
  success,
  failure,
}

class AddTokenState extends Equatable {
  const AddTokenState({
    this.contractAddress = '',
    this.tokenSymbol = '',
    this.tokenDecimal = '',
    this.status = AddTokenStatus.initial,
  });

  AddTokenState copyWith({
    final String? contractAddress,
    final String? tokenSymbol,
    final String? tokenDecimal,
    final AddTokenStatus? status,
  }) {
    return AddTokenState(
      contractAddress: contractAddress ?? this.contractAddress,
      tokenSymbol: tokenSymbol ?? this.tokenSymbol,
      tokenDecimal: tokenDecimal ?? this.tokenDecimal,
      status: status ?? this.status,
    );
  }

  final AddTokenStatus status;
  final String contractAddress;
  final String tokenSymbol;
  final String tokenDecimal;
  @override
  List<Object?> get props =>
      [status, contractAddress, tokenSymbol, tokenDecimal];
}
