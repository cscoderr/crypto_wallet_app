import 'package:crypto_wallet/app/app_router.dart';
import 'package:crypto_wallet/presentation/authentication/authentication.dart';
import 'package:cs_ui/cs_ui.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmSeedPage extends StatelessWidget {
  const ConfirmSeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CsColors.background,
        centerTitle: true,
        title: Text(
          'Check your recovery phrase',
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: BlocListener<SeedPhraseCubit, SeedPhraseState>(
            listenWhen: (previous, current) =>
                previous.status != current.status,
            listener: (context, state) {
              if (state.status == SeedPhraseStatus.failure) {
                context.showErrorMessage(state.errorMessage);
              }
            },
            child: Column(
              children: [
                Text(
                  '''Tap on the words to put them next to each other in the correct order''',
                  style: CsTextStyle.overline.copyWith(),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: context.minBlockVertical * 4),
                        BlocBuilder<SeedPhraseCubit, SeedPhraseState>(
                          builder: (context, state) {
                            return DottedBorder(
                              borderType: BorderType.RRect,
                              dashPattern: const [10, 5],
                              color: CsColors.black.withOpacity(0.4),
                              radius: const Radius.circular(10),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                                child: Container(
                                  width: double.infinity,
                                  constraints: const BoxConstraints(
                                    minHeight: 80,
                                  ),
                                  padding: const EdgeInsets.all(20),
                                  child: BlocBuilder<SeedPhraseCubit,
                                      SeedPhraseState>(
                                    builder: (context, state) {
                                      return Wrap(
                                        spacing: 10,
                                        runSpacing: 10,
                                        children: state.confirmMnemonics
                                            .asMap()
                                            .map(
                                              (key, text) => MapEntry(
                                                key,
                                                MnemonicsChip(
                                                  text: text,
                                                  index: key + 1,
                                                  onTap: () => context
                                                      .read<SeedPhraseCubit>()
                                                      .addSelectedMnemonics(
                                                        text,
                                                      ),
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
                            );
                          },
                        ),
                        SizedBox(height: context.minBlockVertical * 4),
                        BlocBuilder<SeedPhraseCubit, SeedPhraseState>(
                          builder: (context, state) {
                            return Wrap(
                              runSpacing: 10,
                              spacing: 10,
                              // verticalDirection: VerticalDirection.up,
                              children: state.randomMnemonics
                                  .map(
                                    (text) => MnemonicsChip(
                                      onTap: () => context
                                          .read<SeedPhraseCubit>()
                                          .addSelectedMnemonics(text),
                                      isSelected:
                                          state.confirmMnemonics.contains(text),
                                      text: text,
                                    ),
                                  )
                                  .toList(),
                            );
                          },
                        ),
                        SizedBox(height: context.minBlockVertical * 2),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: context.minBlockVertical),
                BlocBuilder<SeedPhraseCubit, SeedPhraseState>(
                  builder: (context, state) {
                    return AbsorbPointer(
                      absorbing: !state.isMnemonicsValid,
                      child: Opacity(
                        opacity: state.isMnemonicsValid ? 1.0 : 0.5,
                        child: SolidButton(
                          text: 'Continue',
                          onPressed: () => context.push(
                            WalletPages.createPin,
                            args: state.mnemonics.join(' '),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
