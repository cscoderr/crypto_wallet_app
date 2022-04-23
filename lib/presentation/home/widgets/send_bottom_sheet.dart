import 'package:cs_ui/cs_ui.dart';
import 'package:flutter/material.dart';

class SendBottomSheet extends StatelessWidget {
  const SendBottomSheet({Key? key}) : super(key: key);

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
        children: [
          Align(
            child: Text(
              'Send',
              style: CsTextStyle.headline2.copyWith(
                fontWeight: CsFontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: context.minBlockVertical * 2),
          const InputBox(
            hintText: 'Search, public address (0x), ENS',
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: SolidButton(
                  text: 'Cancel',
                  color: Colors.white,
                  textColor: CsColors.primary,
                  border: const BorderSide(color: CsColors.primary),
                  onPressed: () {},
                ),
              ),
              SizedBox(width: context.minBlockHorizontal * 5),
              Expanded(
                child: SolidButton(
                  text: 'Next',
                  onPressed: () {},
                ),
              ),
            ],
          ),
          SizedBox(height: context.minBlockVertical * 4),
        ],
      ),
    );
  }
}
