part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetEthBalanceEvent extends HomeEvent {
  const GetEthBalanceEvent(this.publicKey);

  final String publicKey;

  @override
  List<Object> get props => [publicKey];
}
