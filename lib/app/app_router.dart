// ignore_for_file: cast_nullable_to_non_nullable

import 'dart:io';

import 'package:crypto_wallet/presentation/authentication/authentication.dart';
import 'package:crypto_wallet/presentation/home/home.dart';
import 'package:crypto_wallet/presentation/landing/view/splash_page.dart';
import 'package:cs_ui/cs_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WalletPages {
  static const String splash = '/';
  static const String createPin = '/auth/create/pin';
  static const String authLanding = '/auth/landing';
  static const String createWallet = '/auth/create/wallet';
  static const String consent = '/auth/consent';
  static const String seedPhrase = '/auth/seedPhrase';
  static const String home = '/home';
  static const String confirmSeedPhrase = '/auth/confirmSeedPhrase';
}

class AppRouter {
  static Route<dynamic> onRouteGenerate(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case WalletPages.splash:
        return platformPageRoute<dynamic>(builder: (_) => const SplashPage());
      case WalletPages.createWallet:
        return platformPageRoute<dynamic>(
          builder: (_) => const CreateWalletPage(),
        );
      case WalletPages.authLanding:
        return platformPageRoute<dynamic>(
          builder: (_) => const AuthLandingPage(),
        );
      case WalletPages.createPin:
        return platformPageRoute<dynamic>(
          builder: (_) => CreatePinPage(mnemonics: args as String),
          fullscreenDialog: true,
        );
      case WalletPages.consent:
        return platformPageRoute<dynamic>(
          builder: (_) => const ConsentPage(),
        );
      case WalletPages.seedPhrase:
        return platformPageRoute<dynamic>(
          builder: (_) => const SeedPhrasePage(),
        );
      case WalletPages.home:
        return platformPageRoute<dynamic>(
          builder: (_) => HomePage(),
        );
      case WalletPages.confirmSeedPhrase:
        return platformPageRoute<dynamic>(
          builder: (_) => const ConfirmSeedPage(),
        );
      default:
        return platformPageRoute<dynamic>(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'Oops you lost your ways',
                style: CsTextStyle.bodyText1,
              ),
            ),
          ),
        );
    }
  }

  static PageRoute<T> platformPageRoute<T>({
    required WidgetBuilder builder,
    RouteSettings? settings,
    bool fullscreenDialog = false,
    String? iosTitle,
  }) {
    if (Platform.isAndroid) {
      return MaterialPageRoute<T>(
        builder: builder,
        settings: settings,
        fullscreenDialog: fullscreenDialog,
      );
    } else {
      return CupertinoPageRoute<T>(
        builder: builder,
        settings: settings,
        fullscreenDialog: fullscreenDialog,
        title: iosTitle,
      );
    }
  }
}

extension AppRouteX on BuildContext {
  void replace(String routeName) =>
      Navigator.pushReplacementNamed(this, routeName);
  void popAll(String routeName) =>
      Navigator.pushNamedAndRemoveUntil(this, routeName, (route) => false);
  Future<void> pushAndClear(Widget page) =>
      Navigator.of(this).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => page),
        (route) => false,
      );
  void push(String routeName, {Object? args}) =>
      Navigator.pushNamed(this, routeName, arguments: args);
  void offAndGo(String routeName, {Object? args}) =>
      Navigator.popAndPushNamed(this, routeName, arguments: args);
}
