import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_token_state.dart';

class AddTokenCubit extends Cubit<AddTokenState> {
  AddTokenCubit() : super(const AddTokenState());
}
