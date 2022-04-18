import 'dart:async';

import 'package:crypto_wallet/app/app.dart';
import 'package:cs_ui/cs_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(const Duration(seconds: 2), () {
      context.replace(WalletPages.auth);
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
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
