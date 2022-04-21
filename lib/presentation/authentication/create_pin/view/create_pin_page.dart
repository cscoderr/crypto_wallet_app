import 'package:crypto_wallet/app/app.dart';
import 'package:crypto_wallet/domain/repositories/repositories.dart';
import 'package:crypto_wallet/presentation/authentication/create_pin/create_pin.dart';
import 'package:cs_ui/cs_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePinPage extends StatelessWidget {
  const CreatePinPage({Key? key, required this.mnemonics}) : super(key: key);

  final String mnemonics;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreatePinCubit(
        phraseRepository: context.read<PhraseRepository>(),
      ),
      child: CreatePinView(mnemonics: mnemonics),
    );
  }
}

class CreatePinView extends StatelessWidget {
  const CreatePinView({Key? key, required this.mnemonics}) : super(key: key);

  final String mnemonics;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CsColors.background,
        centerTitle: true,
        title: Text(
          'Create your password',
          style: CsTextStyle.overline.copyWith(
            fontSize: 20,
            fontWeight: CsFontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () => context.back(),
          icon: const Icon(
            Icons.navigate_before,
            color: CsColors.black,
            size: 40,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: BlocListener<CreatePinCubit, CreatePinState>(
            listenWhen: (previous, current) =>
                previous.status != current.status,
            listener: (context, state) {
              if (state.status == CreatePinStatus.failure) {
                context.showErrorMessage('Oops an error occur, Try again');
              } else if (state.status == CreatePinStatus.success) {
                context.read<AppCubit>().updateWalletModel(state.walletModel);
                context.push(
                  WalletPages.home,
                );
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '''To protect the security of your wallet please register a minimum of 8 passcode''',
                  style: CsTextStyle.overline.copyWith(),
                ),
                SizedBox(height: context.minBlockVertical * 7),
                Text(
                  'Enter your new password',
                  style: CsTextStyle.overline.copyWith(),
                ),
                SizedBox(height: context.minBlockVertical),
                InputBox(
                  hintText: 'Minimum of 8 characters',
                  onChanged: context.read<CreatePinCubit>().onPasswordChanged,
                  isPassword: true,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Password is required';
                    }

                    if (value!.length < 8) {
                      return 'Password too short';
                    }
                    return null;
                  },
                ),
                SizedBox(height: context.minBlockVertical * 5),
                Text(
                  'Confirm password',
                  style: CsTextStyle.overline.copyWith(),
                ),
                SizedBox(height: context.minBlockVertical),
                BlocBuilder<CreatePinCubit, CreatePinState>(
                  builder: (context, state) {
                    return InputBox(
                      hintText: 'Minimum of 8 characters',
                      isPassword: true,
                      onChanged: context
                          .read<CreatePinCubit>()
                          .onConfirmPasswordChanged,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Confirm Password is required';
                        }

                        if (value!.length < 8) {
                          return 'Password too short';
                        }

                        if (value != state.password) {
                          return 'Password does not match';
                        }
                        return null;
                      },
                    );
                  },
                ),
                const Spacer(),
                BlocBuilder<CreatePinCubit, CreatePinState>(
                  builder: (context, state) {
                    return SolidButton(
                      text: 'Create Wallet',
                      onPressed: state.isValid
                          ? () => context.read<CreatePinCubit>().getUserKeys(
                                mnemonics,
                                state.password,
                              )
                          : null,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
