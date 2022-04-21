import 'package:cs_ui/cs_ui.dart';
import 'package:flutter/material.dart';

class SolidButton extends StatelessWidget {
  const SolidButton({
    Key? key,
    this.text,
    this.onPressed,
    this.color = CsColors.primary,
    this.textColor = CsColors.black,
    this.textSize = 16.0,
    this.elevation = 0.0,
    this.radius = 50,
    this.padding = const EdgeInsets.all(20),
    this.border = const BorderSide(color: Colors.transparent),
  }) : super(key: key);

  final String? text;
  final VoidCallback? onPressed;
  final Color color;
  final Color textColor;
  final double textSize;
  final double elevation;
  final BorderSide border;
  final double radius;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints.tightFor(width: MediaQuery.of(context).size.width),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: border,
          ),
        ),
        child: Padding(
          padding: padding,
          child: Text(
            text!.toUpperCase(),
            style: CsTextStyle.button.copyWith(
              color: textColor,
              // fontSize: textSize,
              fontWeight: CsFontWeight.semiBold,
            ),
          ),
        ),
      ),
    );
  }
}
