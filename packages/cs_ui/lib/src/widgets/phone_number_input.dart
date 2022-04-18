import 'package:cs_ui/cs_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PhoneNumberInput extends StatelessWidget {
  const PhoneNumberInput({
    this.controller,
    this.validator,
    this.hintText,
    this.labelText,
    this.icon,
    this.leadingIcon,
    this.leadingColor = CsColors.primary,
    this.fillColor = CsColors.white,
    this.maxLength,
    this.maxLines = 1,
    this.inputFormat,
    this.inputType,
    this.onChanged,
    this.isPassword = false,
    this.raduis = 10.0,
    this.isSuffixCustomIcon = false,
    this.suffixCustomIcon,
    this.errorText,
    this.borderSide = const BorderSide(color: Color(0xFFE5EFFF)),
    this.iconSize = 24.0,
    this.isWritable = true,
    this.enablePrefix = true,
    this.countryCode = '+234',
    this.onIconClick,
  });

  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final String? hintText;
  final String? labelText;
  final IconData? icon;
  final IconData? leadingIcon;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormat;
  final TextInputType? inputType;
  final bool isPassword;
  final double raduis;
  final BorderSide borderSide;
  final double iconSize;
  final bool isWritable;
  final VoidCallback? onIconClick;
  final Color leadingColor;
  final Color fillColor;
  final int maxLines;
  final bool enablePrefix;
  final bool isSuffixCustomIcon;
  final String? suffixCustomIcon;
  final String? errorText;
  final String? countryCode;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: CsColors.primaryBorder,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(raduis),
              bottomLeft: Radius.circular(raduis),
            ),
          ),
          child: Row(
            textDirection: TextDirection.ltr,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border(
                        right: borderSide,
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          countryCode!,
                          style: CsTextStyle.caption,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Flexible(
                child: TextFormField(
                  enabled: isWritable,
                  // validator: validator,
                  inputFormatters: inputFormat,
                  controller: controller,
                  onChanged: onChanged,
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  maxLines: maxLines,
                  style: CsTextStyle.caption.copyWith(
                    color: CsColors.black,
                  ),
                  decoration: InputDecoration(
                    hintStyle: CsTextStyle.caption.copyWith(
                      color: const Color(0xFFDEDEDE),
                    ),
                    hintText: hintText,
                    counterText: '',
                    // labelText: labelText,
                    labelStyle:
                        CsTextStyle.caption.copyWith(color: CsColors.secondary),
                    // counterText: '',
                    fillColor: fillColor,
                    filled: true,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(
                      left: 10, bottom: 5, top: 15,
                      //right: 25.0,
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(
                        right: 5,
                        top: isSuffixCustomIcon ? 15.0 : 0.0,
                        bottom: isSuffixCustomIcon ? 15.0 : 0.0,
                      ),
                      child: GestureDetector(
                        onTap: onIconClick,
                        child: isSuffixCustomIcon
                            ? SvgPicture.asset(
                                suffixCustomIcon!,
                                color: const Color(0xFFACACAC),
                                height: 2,
                                width: 2,
                              )
                            : Icon(
                                icon,
                                color: CsColors.primary,
                                size: iconSize,
                              ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
            top: 5,
          ),
          child: Text(
            errorText ?? '',
            style: CsTextStyle.caption.copyWith(
              color: const Color(0xFFD42531),
              fontSize: 12,
              fontWeight: CsFontWeight.regular,
            ),
          ),
        ),
      ],
    );
  }
}
