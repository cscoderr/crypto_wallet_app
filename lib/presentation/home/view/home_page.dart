import 'dart:math';

import 'package:crypto_wallet/app/app.dart';
import 'package:crypto_wallet/domain/repositories/phrase_repository.dart';
import 'package:crypto_wallet/presentation/home/home.dart';
import 'package:cs_ui/cs_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final app = context.watch<AppCubit>().state;
    return BlocProvider(
      create: (context) =>
          HomeCubit(phraseRepository: context.read<PhraseRepository>())
            ..initialiseClient()
            ..initialiseContract('0xA9994FE94f94d453ad50498e2655F55334159952')
            ..getEthBalance(app.wallet.publicKey ?? ''),
      child: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final home = context.read<HomeCubit>().state;
    final app = context.watch<AppCubit>().state;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CsColors.background,
        centerTitle: true,
        title: Text(
          'Wallet 1',
          style: CsTextStyle.overline.copyWith(
            fontSize: 20,
            fontWeight: CsFontWeight.bold,
          ),
        ),
        leading: const Padding(
          padding: EdgeInsets.all(8),
          child: CircleAvatar(),
        ),
        actions: [
          InkResponse(
            onTap: () {
              showAddTokenBottomSheet(context);
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 10),
              child: CircleAvatar(
                backgroundColor: CsColors.secondary,
                child: Icon(
                  Icons.add,
                  color: CsColors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: context.minBlockVertical * 3),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return Text(
                  _convertToEth(state.ethBalance!.getInWei),
                  style: CsTextStyle.headline1.copyWith(
                    fontSize: 40,
                  ),
                );
              },
            ),
            SizedBox(height: context.minBlockVertical * 2),
            InkWell(
              onTap: () {
                Clipboard.setData(
                  ClipboardData(text: app.wallet.publicKey ?? ''),
                );

                //0x2b93f6bfe8382da6c1ddf2cbf9c7edafab71fdc3
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  color: CsColors.grey.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _getShortAddress(app.wallet.publicKey),
                      style: CsTextStyle.overline.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(width: context.minBlockHorizontal),
                    const Icon(Icons.copy),
                  ],
                ),
              ),
            ),
            SizedBox(height: context.minBlockVertical * 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ActionCircle(
                  icon: Icons.call_made,
                  text: 'Send',
                  onTap: () {
                    context.read<HomeCubit>().sendEth(
                          app.wallet.privateKey ?? '',
                        );
                  },
                ),
                ActionCircle(
                  icon: Icons.call_received,
                  text: 'Receive',
                  onTap: () {
                    context.read<HomeCubit>().getTokenSymbol();
                  },
                ),
                ActionCircle(
                  icon: Icons.swap_horiz,
                  text: 'Swap',
                  onTap: () {
                    context.read<HomeCubit>().getTokenDecimals();
                  },
                ),
              ],
            ),
            SizedBox(height: context.minBlockVertical * 5),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                color: CsColors.grey.withOpacity(0.3),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: CsColors.secondary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Assets',
                        style: CsTextStyle.overline.copyWith(
                          color: CsColors.white,
                          fontWeight: CsFontWeight.semiBold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Activity',
                        style: CsTextStyle.overline.copyWith(
                          fontWeight: CsFontWeight.semiBold,
                          color: CsColors.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: context.minBlockVertical * 2),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(),
                        SizedBox(width: context.minBlockVertical * 2),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'BTC',
                              style: CsTextStyle.overline.copyWith(
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              '12,000',
                              style: CsTextStyle.overline.copyWith(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.navigate_next,
                          size: 30,
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 20);
                },
                itemCount: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getShortAddress(String? mainAddress) {
    if (mainAddress == null) return '';
    final address =
        '${mainAddress.substring(0, 5)}...${mainAddress.substring(mainAddress.length - 4)}';
    return address;
  }

  String _convertToEth(BigInt wei) {
    final eth = (wei / BigInt.from(1 * pow(10, 18))).toStringAsFixed(2);
    return '$eth ETH';
  }

  void showAddTokenBottomSheet(BuildContext context) {
    _scaffoldKey.currentState!.showBottomSheet<dynamic>(
      (_) {
        return WillPopScope(
          onWillPop: () async => false,
          child: const AddTokenBottomSheet(),
        );
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40),
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 5,
      clipBehavior: Clip.hardEdge,
    );
  }
}

class AddTokenBottomSheet extends StatelessWidget {
  const AddTokenBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
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
            const InputBox(
              hintText: 'Contract Address',
            ),
            SizedBox(height: context.minBlockVertical * 3),
            const InputBox(
              hintText: 'Token Symbol',
            ),
            SizedBox(height: context.minBlockVertical * 3),
            const InputBox(
              hintText: 'Token Decimal',
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
    );
  }
}

class ActionCircle extends StatelessWidget {
  const ActionCircle({
    Key? key,
    required this.icon,
    required this.text,
    this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: CsColors.primary,
            radius: 30,
            child: Icon(
              icon,
              color: CsColors.white,
              size: 30,
            ),
          ),
          Text(
            text,
            style: CsTextStyle.overline.copyWith(
              fontSize: 18,
              fontWeight: CsFontWeight.medium,
            ),
          ),
        ],
      ),
    );
  }
}
