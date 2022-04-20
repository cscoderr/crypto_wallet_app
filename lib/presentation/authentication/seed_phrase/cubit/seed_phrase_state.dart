part of 'seed_phrase_cubit.dart';

class SeedPhraseState extends Equatable {
  const SeedPhraseState({
    this.mnemonics = const [],
    this.randomMnemonics = const [],
    this.confirmMnemonics = const [],
    this.generatedSeedHex = '',
    this.confirmSeedHex = '',
  });

  SeedPhraseState copyWith({
    List<String>? mnemonics,
    String? generatedSeedHex,
    String? confirmSeedHex,
    List<String>? randomMnemonics,
    List<String>? confirmMnemonics,
  }) {
    return SeedPhraseState(
      mnemonics: mnemonics ?? this.mnemonics,
      randomMnemonics: randomMnemonics ?? this.randomMnemonics,
      confirmMnemonics: confirmMnemonics ?? this.confirmMnemonics,
      confirmSeedHex: confirmSeedHex ?? this.confirmSeedHex,
      generatedSeedHex: generatedSeedHex ?? this.generatedSeedHex,
    );
  }

  final List<String> mnemonics;
  final List<String> randomMnemonics;
  final String generatedSeedHex;
  final String confirmSeedHex;
  final List<String> confirmMnemonics;

  @override
  List<Object?> get props => [
        mnemonics,
        randomMnemonics,
        generatedSeedHex,
        confirmSeedHex,
        confirmMnemonics,
      ];
}
