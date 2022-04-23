import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_wallet/domain/repositories/repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:web3dart/web3dart.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required ContractRepository contractRepository})
      : _contractRepository = contractRepository,
        super(const HomeState()) {
    on<GetEthBalanceEvent>(_onGetEthBalance);
  }

  final ContractRepository _contractRepository;

  Future<void> _onGetEthBalance(
    GetEthBalanceEvent event,
    Emitter<HomeState> emit,
  ) async {
    await emit.forEach(
      _contractRepository.getEthBalance(event.publicKey),
      onData: (EtherAmount data) => state.copyWith(ethBalance: data),
    );
  }
}
