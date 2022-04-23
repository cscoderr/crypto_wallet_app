import 'package:cs_ui/cs_ui.dart';
import 'package:flutter/material.dart';

class SwapBottomSheet extends StatelessWidget {
  const SwapBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight - (context.screenHeight / 3),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            child: Text(
              'Swap',
              style: CsTextStyle.headline2.copyWith(
                fontWeight: CsFontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: context.minBlockVertical * 2),
          const Text('Swap from'),
          const InputBox(
            hintText: 'Search, public address (0x), ENS',
          ),
          SizedBox(height: context.minBlockVertical * 2),
          const Text('Swap to'),
          const InputBox(
            hintText: 'Search, public address (0x), ENS',
          ),
          const Spacer(),
          SolidButton(
            text: 'Review',
            onPressed: () {},
          ),
          SizedBox(height: context.minBlockVertical * 4),
        ],
      ),
    );
  }
}
