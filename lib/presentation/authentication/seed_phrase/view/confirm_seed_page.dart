import 'package:crypto_wallet/presentation/authentication/seed_phrase/cubit/seed_phrase_cubit.dart';
import 'package:cs_ui/cs_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmSeedPage extends StatelessWidget {
  const ConfirmSeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            children: [
              Text(
                'Confirm your Secret Recovery Phrase',
                style: CsTextStyle.headline1.copyWith(
                  fontSize: 45,
                ),
              ),
              SizedBox(height: context.minBlockVertical * 4),
              Expanded(
                child: BlocBuilder<SeedPhraseCubit, SeedPhraseState>(
                  builder: (context, state) {
                    return Wrap(
                      runSpacing: 30,
                      // verticalDirection: VerticalDirection.up,
                      children: List.generate(
                        state.mnemonics.length,
                        (index) => FilterChip(
                          backgroundColor: CsColors.background,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: CsColors.primary),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          label: Text(
                            state.randomMnemonics[index],
                            style: CsTextStyle.caption.copyWith(
                              fontSize: 18,
                            ),
                          ),
                          onSelected: (value) {},
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
