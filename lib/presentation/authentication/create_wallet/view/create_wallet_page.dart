import 'package:cs_ui/cs_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CreateWalletPage extends StatelessWidget {
  const CreateWalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/svg/logo.svg',
                width: 100,
                height: 100,
              ),
              SizedBox(height: context.minBlockVertical * 5),
              SolidButton(
                text: 'Create a new Wallet',
                onPressed: () {},
              ),
              SizedBox(height: context.minBlockVertical),
              TextButton(
                onPressed: () {},
                child: Text(
                  'I already have a wallet',
                  style: CsTextStyle.caption.copyWith(
                    color: CsColors.primary,
                    fontSize: 14,
                    fontWeight: CsFontWeight.medium,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
