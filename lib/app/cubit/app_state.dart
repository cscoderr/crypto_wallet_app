part of 'app_cubit.dart';

class AppState extends Equatable {
  const AppState({
    this.wallet = const WalletModel(),
    this.authStatus = AuthStatus.unknown,
  });

  AppState copyWith({
    final WalletModel? wallet,
    final AuthStatus? authStatus,
  }) =>
      AppState(
        wallet: wallet ?? this.wallet,
        authStatus: authStatus ?? this.authStatus,
      );

  final WalletModel wallet;
  final AuthStatus authStatus;

  @override
  List<Object?> get props => [wallet, authStatus];
}
