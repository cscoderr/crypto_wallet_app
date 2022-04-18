import 'package:cs_ui/cs_ui.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.wallet_membership),
            Text(
              'Crypto Wallet',
              style: CsTextStyle.headline1.copyWith(
                color: CsColors.primary,
                fontSize: 45,
                fontWeight: CsFontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
