import 'package:bloc/bloc.dart';
import 'package:crypto_wallet/data/repositories/repositories.dart';
import 'package:crypto_wallet/domain/models/wallet_model.dart';
import 'package:crypto_wallet/domain/repositories/phrase_repository.dart';
import 'package:equatable/equatable.dart';

part 'auth_landing_state.dart';

class AuthLandingCubit extends Cubit<AuthLandingState> {
  AuthLandingCubit({required PhraseRepository phraseRepository})
      : _phraseRepository = phraseRepository,
        super(const AuthLandingState());

  final PhraseRepository _phraseRepository;

  void onPasswordChanged(String password) {
    emit(state.copyWith(password: password));
    isValid();
  }

  void isValid() {
    if (state.password.isNotEmpty && state.password.length >= 8) {
      emit(state.copyWith(isValid: true));
    } else {
      emit(state.copyWith(isValid: false));
    }
  }

  Future<void> onSubmitted() async {
    try {
      final response = await _phraseRepository.retrieveData(state.password);
      if (response != null) {
        emit(
          state.copyWith(
            status: AuthLandingStatus.success,
            walletModel: response,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: AuthLandingStatus.failure,
            errorMessage: 'Oops an error occur, Try again',
          ),
        );
      }
    } on IncorrectPasswordException {
      emit(
        state.copyWith(
          status: AuthLandingStatus.failure,
          errorMessage: 'Incorrect password',
        ),
      );
    } on Exception {
      emit(
        state.copyWith(
          status: AuthLandingStatus.failure,
          errorMessage: 'Oops an error occur, Try again',
        ),
      );
    }
  }
}
