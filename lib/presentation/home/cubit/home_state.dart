part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.ethBalance,
  });

  HomeState copyWith({
    EtherAmount? ethBalance,
  }) {
    return HomeState(
      ethBalance: ethBalance ?? this.ethBalance,
    );
  }

  final EtherAmount? ethBalance;
  @override
  List<Object?> get props => [ethBalance];
}
