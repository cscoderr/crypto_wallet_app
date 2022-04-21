import 'package:crypto_wallet/app/app_router.dart';
import 'package:crypto_wallet/presentation/authentication/seed_phrase/seed_phrase.dart';
import 'package:cs_ui/cs_ui.dart';
import 'package:dotted_border/dotted_border.dart';
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CsColors.background,
        centerTitle: true,
        title: Text(
          'Your Recovery Phrase',
          style: CsTextStyle.overline.copyWith(
            fontSize: 20,
            fontWeight: CsFontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () => context.back(),
          icon: const Icon(
            Icons.navigate_before,
            color: CsColors.black,
            size: 40,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20)
              .add(const EdgeInsets.only(bottom: 20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.minBlockVertical * 4),
              Text(
                '''Write down these 12 words in the correct order and keep them in a safe place''',
                style: CsTextStyle.overline.copyWith(),
              ),
              SizedBox(height: context.minBlockVertical * 3),
              DottedBorder(
                borderType: BorderType.RRect,
                dashPattern: const [10, 5],
                color: CsColors.black.withOpacity(0.4),
                radius: const Radius.circular(10),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    child: BlocBuilder<SeedPhraseCubit, SeedPhraseState>(
                      builder: (context, state) {
                        return Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: state.mnemonics
                              .asMap()
                              .map(
                                (key, text) => MapEntry(
                                  key,
                                  MnemonicsChip(
                                    text: text,
                                    index: key + 1,
                                  ),
                                ),
                              )
                              .values
                              .toList(),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: context.minBlockVertical * 2),
              BlocBuilder<SeedPhraseCubit, SeedPhraseState>(
                builder: (context, state) {
                  //autumn horn own build mandate course fee maximum arrange pipe narrow tonight
                  return GestureDetector(
                    onTap: () {
                      Clipboard.setData(
                        ClipboardData(text: state.mnemonics.join(' ')),
                      );
                      context.showSuccessMessage('Copied Successfully');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.copy,
                          color: CsColors.primary,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Copy to clipboard',
                          style: CsTextStyle.overline.copyWith(
                            color: CsColors.primary,
                            fontWeight: CsFontWeight.semiBold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.redAccent.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.dangerous_outlined,
                      color: Colors.red,
                    ),
                    SizedBox(width: context.minBlockHorizontal * 2),
                    Expanded(
                      child: Text(
                        '''Keep your recovery phrase in a safe place and don't share it with anyone!''',
                        style: CsTextStyle.overline.copyWith(
                          color: Colors.red,
                          fontWeight: CsFontWeight.semiBold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: context.minBlockVertical * 3),
              SolidButton(
                text: 'Continue',
                onPressed: () {
                  context.read<SeedPhraseCubit>().clearSelectedMnemonics();

                  context.push(WalletPages.confirmSeedPhrase);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
