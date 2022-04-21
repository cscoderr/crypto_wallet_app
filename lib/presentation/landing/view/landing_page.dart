import 'package:crypto_wallet/app/app.dart';
import 'package:cs_ui/cs_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/svg/logo.svg',
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(height: context.minBlockVertical * 2),
                    Text(
                      'CSWallet',
                      style: CsTextStyle.headline2.copyWith(
                        fontWeight: CsFontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: context.minBlockVertical * 5),
              SolidButton(
                text: 'Create a new Wallet',
                onPressed: () => context.push(WalletPages.seedPhrase),
              ),
              SizedBox(height: context.minBlockVertical * 2),
              SolidButton(
                text: 'I already have a wallet',
                color: CsColors.secondary,
                textColor: CsColors.white,
                onPressed: () => context.push(WalletPages.home),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
