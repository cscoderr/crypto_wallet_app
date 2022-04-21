import 'package:cs_ui/cs_ui.dart';
import 'package:flutter/material.dart';

class MnemonicsChip extends StatelessWidget {
  const MnemonicsChip({
    Key? key,
    required this.text,
    this.onTap,
    this.index,
    this.isSelected = false,
  }) : super(key: key);

  final String text;
  final VoidCallback? onTap;
  final bool isSelected;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: CsColors.primary.withOpacity(0.5),
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: CsColors.primary),
          color: isSelected
              ? CsColors.primary.withOpacity(0.7)
              : CsColors.background,
        ),
        child: (index != null)
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    index.toString(),
                    style: CsTextStyle.caption.copyWith(
                      fontSize: 16,
                      fontWeight: CsFontWeight.bold,
                      color: CsColors.black.withOpacity(0.6),
                    ),
                  ),
                  SizedBox(
                    width: context.minBlockHorizontal * 2,
                  ),
                  Text(
                    text,
                    style: CsTextStyle.caption.copyWith(
                      fontSize: 18,
                      fontWeight: CsFontWeight.semiBold,
                    ),
                  ),
                ],
              )
            : Text(
                text,
                style: CsTextStyle.caption.copyWith(
                  fontSize: 18,
                  fontWeight: CsFontWeight.semiBold,
                  color: isSelected ? Colors.transparent : CsColors.black,
                ),
              ),
      ),
    );
  }
}
