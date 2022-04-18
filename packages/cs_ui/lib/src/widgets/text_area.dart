import 'package:cs_ui/cs_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextArea extends StatelessWidget {
  const TextArea(
      {Key? key,
      this.controller,
      this.validator,
      this.hintText,
      this.labelText,
      this.errorText,
      this.icon,
      this.leadingIcon,
      this.leadingColor = CsColors.primaryText,
      this.fillColor = CsColors.background,
      this.maxLength,
      this.maxLines = 4,
      this.inputFormat,
      this.inputType,
      this.isPassword = false,
      this.raduis = 10.0,
      this.isSuffixCustomIcon = false,
      this.suffixCustomIcon,
      this.borderSide = const BorderSide(color: Color(0xFFF6F6F6)),
      this.iconSize = 24.0,
      this.isWritable = true,
      this.enablePrefix = true,
      this.onChanged,
      this.onIconClick})
      : super(key: key);

  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final String? hintText;
  final String? labelText;
  final String? errorText;
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
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isWritable,
      validator: validator,
      inputFormatters: inputFormat,
      onChanged: onChanged,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: inputType,
      maxLength: maxLength,
      maxLines: maxLines,
      obscureText: isPassword,
      style: CsTextStyle.overline.copyWith(
        color: CsColors.primaryText,
        fontSize: 18,
      ),
      decoration: InputDecoration(
        hintStyle: CsTextStyle.overline.copyWith(
          color: CsColors.primaryText.withOpacity(0.7),
          fontWeight: CsFontWeight.medium,
        ),
        hintText: hintText,
        labelText: labelText,
        labelStyle: CsTextStyle.overline.copyWith(
          color: CsColors.primaryText,
          fontSize: 18,
        ),
        // counterText: '',
        fillColor: fillColor,
        filled: true,
        errorText: errorText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            raduis,
          ),
          borderSide: borderSide,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            raduis,
          ),
          borderSide: borderSide,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            raduis,
          ),
          borderSide: borderSide,
        ),
        contentPadding: const EdgeInsets.only(
          // left: 20,
          bottom: 20,
          top: 20,
        ),
        prefix: const Padding(
          padding: EdgeInsets.only(
            left: 20,
          ),
          child: Text(''),
        ),
        suffixIcon: GestureDetector(
          onTap: onIconClick,
          child: Icon(
            icon,
            color: CsColors.primaryIcon,
          ),
        ),
      ),
    );
  }
}
