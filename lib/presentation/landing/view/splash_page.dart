import 'package:crypto_wallet/app/app.dart';
import 'package:crypto_wallet/domain/repositories/repositories.dart';
import 'package:crypto_wallet/presentation/authentication/landing/landing.dart';
import 'package:crypto_wallet/presentation/landing/view/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        if (state.authStatus == AuthStatus.authenticated) {
          return const AuthLandingPage();
        } else if (state.authStatus == AuthStatus.unauthenticated) {
          return const LandingPage();
        } else {
          return const LandingPage();
        }
      },
    );
  }
}
