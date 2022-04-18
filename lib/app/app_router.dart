import 'dart:io';

import 'package:crypto_wallet/presentation/create_wallet/create_wallet.dart';
import 'package:crypto_wallet/presentation/landing/landing.dart';
import 'package:cs_ui/cs_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WalletPages {
  static const String landing = '/';
  static const String auth = '/auth';
}

class AppRouter {
  static Route<dynamic> onRouteGenerate(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case WalletPages.landing:
        return platformPageRoute<dynamic>(builder: (_) => const LandingPage());
      case WalletPages.auth:
        return platformPageRoute<dynamic>(
            builder: (_) => const CreateWalletPage());
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
