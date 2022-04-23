import 'package:bloc/bloc.dart';
import 'package:crypto_wallet/domain/repositories/repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:web3dart/web3dart.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
      {required PhraseRepository phraseRepository,
      required ContractRepository contractRepository})
      : _phraseRepository = phraseRepository,
        _contractRepository = contractRepository,
        super(const HomeState()) {
    emit(
      state.copyWith(
        ethBalance: EtherAmount.zero(),
      ),
    );
  }

  final PhraseRepository _phraseRepository;
  final ContractRepository _contractRepository;

  Future<void> getEthBalance(String publicKey) async {}

  @override
  Future<void> close() {
    _contractRepository.dispose();
    return super.close();
  }
}
