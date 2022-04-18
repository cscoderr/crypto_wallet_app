import 'package:cs_ui/cs_ui.dart';
import 'package:flutter/material.dart';

class CsFlatButton extends StatelessWidget {
  const CsFlatButton({
    Key? key,
    this.text,
    this.onPressed,
    this.color = CsColors.primary,
    this.textColor = CsColors.black,
    this.fontWeight = CsFontWeight.bold,
    this.textSize = 18.0,
    this.elevation = 0.0,
    this.radius = 50,
    this.border = const BorderSide(color: CsColors.primary),
  }) : super(key: key);

  final String? text;
  final VoidCallback? onPressed;
  final Color color;
  final Color textColor;
  final double textSize;
  final double elevation;
  final BorderSide border;
  final FontWeight fontWeight;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints.tightFor(width: MediaQuery.of(context).size.width),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            text!,
            style: CsTextStyle.caption.copyWith(
              color: textColor,
              fontSize: textSize,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
