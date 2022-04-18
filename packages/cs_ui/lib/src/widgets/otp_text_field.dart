import 'dart:async';

import 'package:cs_ui/cs_ui.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpTextField extends StatelessWidget {
  const OtpTextField({
    Key? key,
    this.length = 4,
    this.onCompleted,
    this.onChanged,
    this.controller,
    this.errorController,
    this.validator,
  }) : super(key: key);

  final ValueSetter<String>? onCompleted;
  final FormFieldValidator<String>? validator;
  final ValueSetter<String>? onChanged;
  final TextEditingController? controller;
  final StreamController<ErrorAnimationType>? errorController;
  final int length;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: length,
      validator: validator,
      animationType: AnimationType.fade,
      backgroundColor: const Color(0xFF222222),
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(10),
        fieldHeight: 60,
        fieldWidth: 64,
        activeFillColor: CsColors.white,
        inactiveFillColor: Colors.red,
        activeColor: CsColors.white,
        inactiveColor: CsColors.white,
        selectedColor: CsColors.white,
      ),
      cursorColor: Colors.black,
      textStyle: const TextStyle(
        color: CsColors.black,
      ),
      animationDuration: const Duration(milliseconds: 300),
      errorAnimationController: errorController,
      controller: controller,
      boxShadows: const [
        BoxShadow(
          color: CsColors.white,
        ),
      ],
      keyboardType: TextInputType.number,
      onCompleted: onCompleted,
      onChanged: onChanged ?? (_) {},
      beforeTextPaste: (text) {
        return false;
      },
    );
  }
}
