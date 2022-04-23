import 'package:cs_ui/cs_ui.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
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
