import 'package:bloc/bloc.dart';
import 'package:crypto_wallet/domain/models/wallet_model.dart';
import 'package:crypto_wallet/domain/repositories/phrase_repository.dart';
import 'package:equatable/equatable.dart';

part 'create_pin_state.dart';

class CreatePinCubit extends Cubit<CreatePinState> {
  CreatePinCubit({required PhraseRepository phraseRepository})
      : _phraseRepository = phraseRepository,
        super(const CreatePinState());

  final PhraseRepository _phraseRepository;

  Future<void> getUserKeys(String mnemonics, String password) async {
    try {
      final privateKey = await _phraseRepository.generatePrivatekey(mnemonics);
      final publicKey = await _phraseRepository.generatePublicKey(privateKey);
      final data = WalletModel(
        privateKey: privateKey,
        publicKey: publicKey.toString(),
      );
      await _phraseRepository.saveData(data, password);
      emit(state.copyWith(status: CreatePinStatus.success, walletModel: data));
    } on Exception {
      emit(state.copyWith(status: CreatePinStatus.failure));
    }
  }

  void onPasswordChanged(String password) {
    emit(state.copyWith(password: password));
    isPinValid();
  }

  void onConfirmPasswordChanged(String password) {
    emit(state.copyWith(confirmPassword: password));
    isPinValid();
  }

  void isPinValid() {
    if (state.password.isNotEmpty &&
        state.confirmPassword.isNotEmpty &&
        state.password.length >= 8 &&
        state.confirmPassword.length >= 8 &&
        state.password == state.confirmPassword) {
      emit(state.copyWith(isValid: true, status: CreatePinStatus.initial));
    } else {
      emit(state.copyWith(isValid: false, status: CreatePinStatus.initial));
    }
  }
}
