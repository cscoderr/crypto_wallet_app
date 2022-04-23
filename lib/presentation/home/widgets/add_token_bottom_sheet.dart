import 'package:crypto_wallet/domain/repositories/repositories.dart';
import 'package:crypto_wallet/presentation/home/home.dart';
import 'package:cs_ui/cs_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTokenBottomSheet extends StatelessWidget {
  AddTokenBottomSheet({
    Key? key,
  }) : super(key: key);

  final _symbolController = TextEditingController();
  final _decimalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddTokenCubit(contractRepository: context.read<ContractRepository>()),
      child: Container(
        height: context.screenHeight - (context.screenHeight / 5),
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
        ),
        decoration: const BoxDecoration(
          color: CsColors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(40),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Import Tokens',
                style: CsTextStyle.headline2.copyWith(
                  fontWeight: CsFontWeight.bold,
                ),
              ),
              SizedBox(height: context.minBlockVertical * 2),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.yellow.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.dangerous_outlined,
                      color: CsColors.primary,
                    ),
                    SizedBox(width: context.minBlockHorizontal * 2),
                    Expanded(
                      child: Text(
                        '''Anyone can create a token, including creating fake versions of existing tokens.''',
                        style: CsTextStyle.overline.copyWith(
                          color: Colors.black,
                          fontWeight: CsFontWeight.regular,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: context.minBlockVertical * 3),
              BlocBuilder<AddTokenCubit, AddTokenState>(
                builder: (context, state) {
                  return InputBox(
                    hintText: 'Contract Address',
                    onChanged:
                        context.read<AddTokenCubit>().onContractAddressChanged,
                  );
                },
              ),
              SizedBox(height: context.minBlockVertical * 3),
              BlocConsumer<AddTokenCubit, AddTokenState>(
                listener: (context, state) {
                  print('enter1');
                  if (state.status == AddTokenStatus.success) {
                    print('enter2');
                    _symbolController.text = state.tokenSymbol;
                    _decimalController.text = state.tokenDecimal;
                  }
                },
                builder: (context, state) {
                  print(_symbolController.text);
                  return Column(
                    children: [
                      InputBox(
                        controller: _symbolController,
                        hintText: 'Token Symbol',
                      ),
                      SizedBox(height: context.minBlockVertical * 3),
                      InputBox(
                        controller: _decimalController,
                        hintText: 'Token Decimal',
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: context.minBlockVertical * 4),
              SolidButton(
                text: 'Add Token',
                onPressed: () {},
              ),
              SizedBox(height: context.minBlockVertical * 4),
            ],
          ),
        ),
      ),
    );
  }
}
