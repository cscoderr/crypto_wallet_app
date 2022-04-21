part of 'create_pin_cubit.dart';

enum CreatePinStatus {
  initial,
  failure,
  success,
}

class CreatePinState extends Equatable {
  const CreatePinState({
    this.password = '',
    this.confirmPassword = '',
    this.isValid = false,
    this.status = CreatePinStatus.initial,
    this.walletModel = const WalletModel(),
  });

  CreatePinState copyWith({
    final CreatePinStatus? status,
    final String? password,
    final String? confirmPassword,
    final bool? isValid,
    final WalletModel? walletModel,
  }) =>
      CreatePinState(
        status: status ?? this.status,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        password: password ?? this.password,
        isValid: isValid ?? this.isValid,
        walletModel: walletModel ?? this.walletModel,
      );

  final CreatePinStatus status;
  final String password;
  final String confirmPassword;
  final bool isValid;
  final WalletModel walletModel;
  @override
  List<Object?> get props => [
        status,
        password,
        confirmPassword,
        isValid,
        walletModel,
      ];
}
