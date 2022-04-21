import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_wallet/domain/models/wallet_model.dart';
import 'package:crypto_wallet/domain/repositories/phrase_repository.dart';
import 'package:equatable/equatable.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({required PhraseRepository phraseRepository})
      : _phraseRepository = phraseRepository,
        super(const AppState()) {
    _streamSubscription = _phraseRepository.status.listen(
      updateAuthStatus,
    );
  }

  late final StreamSubscription _streamSubscription;

  final PhraseRepository _phraseRepository;

  void updateWalletModel(WalletModel walletModel) {
    emit(state.copyWith(wallet: walletModel));
  }

  void updateAuthStatus(AuthStatus status) {
    emit(
      state.copyWith(
        authStatus: status,
      ),
    );
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
