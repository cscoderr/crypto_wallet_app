import 'package:cs_ui/cs_ui.dart';
import 'package:flutter/material.dart';

class SelectBox<T> extends StatelessWidget {
  const SelectBox({
    Key? key,
    @required this.items,
    this.validator,
    this.radius = 12.0,
    this.value,
    this.onChanged,
    this.icon,
    this.focusNode,
    this.borderSide = const BorderSide(color: Color(0xFFF5F5F5)),
  }) : super(key: key);

  final List<DropdownMenuItem<T>>? items;
  final FormFieldValidator<dynamic>? validator;
  final double radius;
  final dynamic value;
  final ValueSetter<T?>? onChanged;
  final BorderSide borderSide;
  final Widget? icon;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value as T,
      items: items,
      isExpanded: true,
      focusNode: focusNode,
      validator: validator,
      decoration: InputDecoration(
        hintStyle: CsTextStyle.overline.copyWith(
          color: CsColors.primaryText.withOpacity(0.7),
          fontWeight: CsFontWeight.medium,
        ),
        filled: true,
        fillColor: const Color(0xFFF5F5F5),
        prefixIcon: icon,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            radius,
          ),
          borderSide: borderSide,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            radius,
          ),
          borderSide: borderSide,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            radius,
          ),
          borderSide: borderSide,
        ),
        contentPadding: const EdgeInsets.only(
          left: 10,
          bottom: 15,
          top: 15,
          right: 10,
        ),
      ),
      onChanged: onChanged,
      dropdownColor: CsColors.white,
      style: CsTextStyle.caption.copyWith(
        color: CsColors.black,
      ),
      iconEnabledColor: CsColors.black,
      icon: const Icon(
        Icons.keyboard_arrow_down,
        size: 25,
        color: CsColors.black,
      ),
    );
  }
}
