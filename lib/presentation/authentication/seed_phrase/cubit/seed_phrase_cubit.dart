import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:crypto_wallet/domain/repositories/phrase_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'seed_phrase_state.dart';

class SeedPhraseCubit extends Cubit<SeedPhraseState> {
  SeedPhraseCubit({required PhraseRepository phraseRepository})
      : _phraseRepository = phraseRepository,
        super(const SeedPhraseState());

  final PhraseRepository _phraseRepository;

  void generateMnemonic() {
    final mnemonic = _phraseRepository.getMnemonics();
    final mnemonics = mnemonic.toList;
    final randomMnemonics = [...mnemonics]..shuffle(Random.secure());

    emit(
      state.copyWith(
        mnemonics: mnemonics,
        randomMnemonics: randomMnemonics,
      ),
    );
  }

  void addSelectedMnemonics(String text) {
    final currentSelectedMnemonics = <String>[];
    for (final mnemonic in state.confirmMnemonics) {
      currentSelectedMnemonics.add(mnemonic);
    }
    if (state.confirmMnemonics.contains(text)) {
      currentSelectedMnemonics.remove(text);
    } else {
      currentSelectedMnemonics.add(text);
    }
    emit(
      state.copyWith(
        confirmMnemonics: currentSelectedMnemonics,
        isMnemonicsValid: false,
        status: SeedPhraseStatus.initial,
      ),
    );
    validateMnemonics();
  }

  void clearSelectedMnemonics() {
    emit(
      state.copyWith(
        confirmMnemonics: [],
        isMnemonicsValid: false,
        status: SeedPhraseStatus.initial,
      ),
    );
  }

  void validateMnemonics() {
    if (state.confirmMnemonics.length != 12) return;
    if (listEquals(state.mnemonics, state.confirmMnemonics)) {
      emit(
        state.copyWith(
          status: SeedPhraseStatus.success,
          isMnemonicsValid: true,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: SeedPhraseStatus.failure,
          errorMessage: 'Invalid Mnemonics',
          isMnemonicsValid: false,
        ),
      );
    }
  }
}
//shaft outdoor kingdom romance priority tooth delay harsh walk candy curious viable

extension on String {
  List<String> get toList => split(' ').toList();
}
