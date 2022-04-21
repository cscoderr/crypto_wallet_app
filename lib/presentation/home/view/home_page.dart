import 'package:crypto_wallet/app/app.dart';
import 'package:cs_ui/cs_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final app = context.watch<AppCubit>().state;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: CircleAvatar(),
              ),
              Text(
                '3.978 ETH',
                style: CsTextStyle.headline1.copyWith(
                  fontSize: 40,
                ),
              ),
              SizedBox(height: context.minBlockVertical),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  color: CsColors.primary.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  app.wallet.publicKey ?? '',
                  style: CsTextStyle.overline.copyWith(
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: context.minBlockVertical * 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  ActionCircle(
                    icon: Icons.call_made,
                    text: 'Send',
                  ),
                  ActionCircle(
                    icon: Icons.call_received,
                    text: 'Receive',
                  ),
                  ActionCircle(
                    icon: Icons.swap_horiz,
                    text: 'Swap',
                  ),
                ],
              ),
              SizedBox(height: context.minBlockVertical * 5),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: CsColors.grey.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(10),
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
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 20);
                  },
                  itemCount: 10,
                ),
              ),
            ],
          ),
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
  }) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          child: Icon(
            icon,
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
    );
  }
}
