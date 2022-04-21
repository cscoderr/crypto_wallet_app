import 'package:cs_ui/cs_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// {@template input_box}
/// InputBox similar to textfield
/// {@endtemplate}
class InputBox extends StatelessWidget {
  ///@macro TextBox Constructor
  const InputBox(
      {Key? key,
      // this.controller,
      this.validator,
      this.hintText,
      this.labelText,
      this.errorText,
      this.icon,
      this.leadingIcon,
      this.leadingColor = CsColors.primaryText,
      this.fillColor = CsColors.background,
      this.maxLength,
      this.inputFormat,
      this.inputType,
      this.isPassword = false,
      this.raduis = 10.0,
      this.borderSide = const BorderSide(color: CsColors.grey),
      this.iconSize = 24.0,
      this.isWritable = true,
      this.enablePrefix = true,
      this.onChanged,
      this.value = '',
      this.onFieldSubmitted,
      this.focus,
      this.onIconClick})
      : super(key: key);

  ///@macro TextEditingController fields
  // final TextEditingController? controller;

  ///@macro Validator fields
  final FormFieldValidator<String>? validator;

  ///@macro HintText
  final String? hintText;

  ///@macro Label Text
  final String? labelText;

  ///@macro Error Text
  final String? errorText;

  ///@macro Icon
  final IconData? icon;

  ///@macro Leading Icon
  final IconData? leadingIcon;

  ///@macro Max Length
  final int? maxLength;

  ///@macro InputForm
  final List<TextInputFormatter>? inputFormat;

  ///@macro Input Type
  final TextInputType? inputType;

  ///@macro IsPassword either true/false
  final bool isPassword;

  ///@macro InputBox Border Raduis
  final double raduis;

  ///@macro BorderSide
  final BorderSide borderSide;

  ///@macro Icon Size
  final double iconSize;

  ///@macro Iswritable true/false
  final bool isWritable;

  ///@macro onIconClick
  final VoidCallback? onIconClick;

  ///@macro LeadingIcon Color
  final Color leadingColor;

  ///@macro TextBox Background Color
  final Color fillColor;

  ///@macro Enable Prefix Icon true/false
  final bool enablePrefix;

  final String value;

  ///@macro OnChange function
  final ValueChanged<String>? onChanged;

  ///@macro onFieldSubmitted field submitted function
  final ValueChanged<String>? onFieldSubmitted;

  ///@macro TextBox Focus
  final FocusNode? focus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isWritable,
      validator: validator,
      inputFormatters: inputFormat,
      onChanged: onChanged,
      initialValue: value,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: inputType,
      maxLength: maxLength,
      focusNode: focus,
      onFieldSubmitted: onFieldSubmitted,
      obscureText: isPassword,
      style: CsTextStyle.overline.copyWith(
        color: CsColors.primaryText,
      ),
      decoration: InputDecoration(
        hintStyle: CsTextStyle.overline.copyWith(
          color: CsColors.primaryText.withOpacity(0.4),
          fontWeight: CsFontWeight.medium,
        ),
        counterText: '',
        hintText: hintText,
        labelText: labelText,
        labelStyle: CsTextStyle.overline.copyWith(
          color: CsColors.primaryText,
          fontSize: 18,
        ),
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
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: GestureDetector(
            onTap: onIconClick,
            child: Icon(
              icon,
              color: CsColors.black,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
