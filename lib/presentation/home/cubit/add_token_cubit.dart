import 'package:bloc/bloc.dart';
import 'package:crypto_wallet/domain/repositories/repositories.dart';
import 'package:equatable/equatable.dart';

part 'add_token_state.dart';

class AddTokenCubit extends Cubit<AddTokenState> {
  AddTokenCubit({required ContractRepository contractRepository})
      : _contractRepository = contractRepository,
        super(const AddTokenState());

  final ContractRepository _contractRepository;

  void onContractAddressChanged(String address) {
    emit(state.copyWith(contractAddress: address));

    getContractDetails();
  }

  Future<void> getContractDetails() async {
    if (state.contractAddress.length < 40) return;
    emit(
      state.copyWith(
        status: AddTokenStatus.loading,
      ),
    );
    final symbol =
        await _contractRepository.getTokenSymbol(state.contractAddress);
    final decimal =
        await _contractRepository.getTokenDecimal(state.contractAddress);

    emit(
      state.copyWith(
        status: AddTokenStatus.success,
        tokenDecimal: decimal,
        tokenSymbol: symbol,
      ),
    );
  }
}
