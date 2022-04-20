import 'package:bip39/bip39.dart' as bip39;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'seed_phrase_state.dart';

class SeedPhraseCubit extends Cubit<SeedPhraseState> {
  SeedPhraseCubit() : super(const SeedPhraseState());

  void generateMnemonic() {
    final mnemonic = bip39.generateMnemonic();
    final seedHex = bip39.mnemonicToSeedHex(mnemonic);
    final mnemonics = mnemonic.split(' ');
    final randomMnemonics = mnemonics..reversed.toList().shuffle();

    emit(
      state.copyWith(
        mnemonics: mnemonics,
        generatedSeedHex: seedHex,
        randomMnemonics: randomMnemonics,
      ),
    );
  }
}
