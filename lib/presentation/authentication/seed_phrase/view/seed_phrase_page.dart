import 'package:crypto_wallet/app/app_router.dart';
import 'package:crypto_wallet/presentation/authentication/seed_phrase/cubit/seed_phrase_cubit.dart';
import 'package:cs_ui/cs_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeedPhrasePage extends StatefulWidget {
  const SeedPhrasePage({Key? key}) : super(key: key);

  @override
  State<SeedPhrasePage> createState() => _SeedPhrasePageState();
}

class _SeedPhrasePageState extends State<SeedPhrasePage> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      context.read<SeedPhraseCubit>().generateMnemonic();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            children: [
              Text(
                'Secret Recovery Phrase',
                style: CsTextStyle.headline1.copyWith(
                  fontSize: 45,
                ),
              ),
              SizedBox(height: context.minBlockVertical * 4),
              Text(
                '''Your Secret Recovery Phrase makes it easy to back up and restore your account.''',
                style: CsTextStyle.overline.copyWith(),
              ),
              SizedBox(height: context.minBlockVertical),
              Text(
                '''WARNING: Never disclose your Secret Recovery Phrase. Anyone with this phrase can take your Ether forever.''',
                style: CsTextStyle.overline.copyWith(),
              ),
              SizedBox(height: context.minBlockVertical * 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: CsColors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: BlocBuilder<SeedPhraseCubit, SeedPhraseState>(
                  builder: (context, state) {
                    return Wrap(
                      spacing: 10,
                      children: List.generate(
                        state.mnemonics.length,
                        (index) => Text(
                          state.mnemonics[index],
                          style: CsTextStyle.overline.copyWith(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: context.minBlockVertical * 4),
              BlocBuilder<SeedPhraseCubit, SeedPhraseState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      Expanded(
                        child: SolidButton(
                          text: 'Copy',
                          color: CsColors.background,
                          onPressed: () {
                            Clipboard.setData(
                              ClipboardData(
                                text: state.mnemonics.join(' '),
                              ),
                            );
                            context.showSuccessMessage(
                              'Phrase copied successfully',
                            );
                          },
                        ),
                      ),
                      SizedBox(width: context.minBlockHorizontal * 5),
                      Expanded(
                        child: SolidButton(
                          text: 'Next',
                          onPressed: () =>
                              context.push(WalletPages.confirmSeedPhrase),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
