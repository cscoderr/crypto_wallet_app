import 'package:cs_ui/cs_ui.dart';
import 'package:flutter/material.dart';

class LoaderButton extends StatelessWidget {
  const LoaderButton({
    Key? key,
    this.text,
    this.onPressed,
    this.color = CsColors.primary,
    this.textColor = CsColors.white,
    this.textSize = 16.0,
    this.elevation = 0.0,
    this.radius = 12,
    this.padding = const EdgeInsets.all(15),
    this.border = const BorderSide(color: CsColors.primary),
    this.isLoading = false,
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
  final bool isLoading;

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
          ),
        ),
        child: Padding(
          padding: padding,
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(CsColors.primary),
                ))
              : Text(
                  text!,
                  style: CsTextStyle.caption.copyWith(
                    color: textColor,
                    fontSize: textSize,
                    fontWeight: CsFontWeight.medium,
                  ),
                ),
        ),
      ),
    );
  }
}
