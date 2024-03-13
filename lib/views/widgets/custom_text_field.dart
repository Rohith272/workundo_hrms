import 'package:flutter/material.dart';
import 'package:workundo_hrms/utils/theme.dart';

import '../../utils/colors.dart';

class CustomTextField extends StatelessWidget {
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
  const CustomTextField({
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
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
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
              color: Colors.white
          ),
          contentPadding: const EdgeInsets.only(bottom: 18, left: 2),
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
        cursorColor: Colors.white,
        obscureText: obscureText ?? false,
        keyboardType: isNumericKeyBoard
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        enabled: enabled,
        style: AppTheme.appTheme.textTheme.bodyMedium,
        validator: validator,
        onChanged: onChanged,
        focusNode: focusNode,
        onTap: onPressed,
        onFieldSubmitted: onSubmitted,
      ),
    );
  }
}
