part of 'auth_landing_cubit.dart';

enum AuthLandingStatus {
  initial,
  failure,
  loading,
  success,
}

class AuthLandingState extends Equatable {
  const AuthLandingState({
    this.password = '',
    this.errorMessage = '',
    this.isValid = false,
    this.walletModel = const WalletModel(),
    this.status = AuthLandingStatus.initial,
  });

  AuthLandingState copyWith({
    final String? password,
    final AuthLandingStatus? status,
    final bool? isValid,
    final WalletModel? walletModel,
    final String? errorMessage,
  }) =>
      AuthLandingState(
        password: password ?? this.password,
        status: status ?? this.status,
        isValid: isValid ?? this.isValid,
        walletModel: walletModel ?? this.walletModel,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  final String password;
  final bool isValid;
  final String errorMessage;
  final WalletModel walletModel;
  final AuthLandingStatus status;

  @override
  List<Object?> get props =>
      [password, walletModel, status, isValid, errorMessage];
}
