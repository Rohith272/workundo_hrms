import 'package:flutter/material.dart';
import 'package:workundo_hrms/utils/theme.dart';

import '../../utils/colors.dart';

class CustomSearchField extends StatelessWidget {
  final FocusNode? focusNode;
  final String hintText;
  final String label;
  final bool isNumericKeyBoard;
  final bool isObscure;
  final bool enabled;
  final IconButton? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final InputBorder? inputBorder;
  final TextEditingController textEditingController;
  final EdgeInsets? padding;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final Function()? onPressed;
  const CustomSearchField({
    required this.hintText,
    required this.textEditingController,
    this.inputBorder,
    this.padding,
    this.label = "",
    this.validator,
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText,
    this.isNumericKeyBoard = false,
    this.isObscure = false,
    this.enabled = true,
    this.focusNode,
    this.onPressed,
    this.onSubmitted,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5),
      height: 45,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.43),
          border: Border.all(
              color: loginBorderGrey,
              width: 1
          )
      ),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          label: Text(
            label,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          alignLabelWithHint: true,
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          hintText: hintText,
          prefixIcon: prefixIcon,
          hintStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              fontFamily: 'Rubik',
              color: Colors.black
          ),
          contentPadding: const EdgeInsets.only(bottom: 8, left: 2),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          errorStyle: TextStyle(
            color: Theme.of(context).errorColor,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
        cursorColor: Colors.black,
        obscureText: obscureText ?? false,
        keyboardType: isNumericKeyBoard
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        enabled: enabled,
        style: TextStyle(fontSize: 16.0,fontWeight:FontWeight.normal, color: Colors.black,fontFamily: "Clash"),
        validator: validator,
        onChanged: onChanged,
        focusNode: focusNode,
        onTap: onPressed,
        onFieldSubmitted: onSubmitted,
      ),
    );
  }
}
