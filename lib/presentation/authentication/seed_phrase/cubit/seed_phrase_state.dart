part of 'seed_phrase_cubit.dart';

enum SeedPhraseStatus {
  initial,
  loading,
  failure,
  success,
}

class SeedPhraseState extends Equatable {
  const SeedPhraseState({
    this.mnemonics = const [],
    this.randomMnemonics = const [],
    this.confirmMnemonics = const [],
    this.errorMessage = '',
    this.isMnemonicsValid = false,
    this.status = SeedPhraseStatus.initial,
  });

  SeedPhraseState copyWith({
    List<String>? mnemonics,
    String? generatedSeedHex,
    String? confirmSeedHex,
    List<String>? randomMnemonics,
    List<String>? confirmMnemonics,
    String? generatedSeedEntropy,
    SeedPhraseStatus? status,
    bool? isMnemonicsValid,
    String? confirmEntropy,
    String? errorMessage,
  }) {
    return SeedPhraseState(
      mnemonics: mnemonics ?? this.mnemonics,
      randomMnemonics: randomMnemonics ?? this.randomMnemonics,
      confirmMnemonics: confirmMnemonics ?? this.confirmMnemonics,
      status: status ?? this.status,
      isMnemonicsValid: isMnemonicsValid ?? this.isMnemonicsValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  final List<String> mnemonics;
  final List<String> randomMnemonics;
  final List<String> confirmMnemonics;
  final SeedPhraseStatus status;
  final String errorMessage;
  final bool isMnemonicsValid;

  @override
  List<Object?> get props => [
        mnemonics,
        randomMnemonics,
        status,
        confirmMnemonics,
        isMnemonicsValid,
        errorMessage,
      ];
}
