import 'package:cs_ui/cs_ui.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

typedef IntlPhone = PhoneNumber;

class IntlPhoneTextField extends StatelessWidget {
  const IntlPhoneTextField({
    Key? key,
    this.initialValue,
    this.onInputChanged,
    this.onSaved,
    this.controller,
    this.validator,
    this.hintText,
    this.borderSide = const BorderSide(color: Color(0xFFF6F6F6)),
    this.value,
  }) : super(key: key);

  final PhoneNumber? initialValue;

  final ValueChanged<IntlPhone>? onInputChanged;

  final ValueChanged<IntlPhone>? onSaved;

  final TextEditingController? controller;

  final String? value;

  final FormFieldValidator<String>? validator;

  final String? hintText;

  final BorderSide borderSide;

  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      textFieldController: controller,
      onInputChanged: onInputChanged,
      validator: validator,
      formatInput: false,
      selectorConfig: const SelectorConfig(
        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
        setSelectorButtonAsPrefixIcon: true,
        leadingPadding: 10,
      ),
      // locale: 'ng',
      textStyle: const TextStyle(
        color: CsColors.black,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      autoValidateMode: AutovalidateMode.onUserInteraction,
      selectorTextStyle: const TextStyle(color: Colors.black),
      initialValue: initialValue,
      maxLength: 12,
      inputDecoration: InputDecoration(
        hintStyle: CsTextStyle.overline.copyWith(
          color: const Color(0xFF9EA1A7),
          fontWeight: CsFontWeight.medium,
        ),
        hintText: hintText,
        // labelText: labelText,
        labelStyle: const TextStyle(
          color: CsColors.black,
        ),

        counterText: '',
        fillColor: CsColors.background,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            8,
          ),
          borderSide: borderSide,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            8,
          ),
          borderSide: borderSide,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            8,
          ),
          borderSide: borderSide,
        ),
        contentPadding: const EdgeInsets.only(
          left: 20,
          bottom: 20,
          top: 20,
          // right: 25,
        ),
      ),
      onSaved: onSaved,
    );
  }
}
