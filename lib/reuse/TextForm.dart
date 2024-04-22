import 'package:Taco/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class ReusableTextFormField extends StatelessWidget {
  final String labelText;
  final String? Function(String?) validator;
  final Function(String)? onChanged;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData? prefixIcon;
  final IconData? mySuffix;
  // final Color? fillColor;
  final Color? borderColor;
  final VoidCallback? onPressed;
  // final Function ?onTap;
  final bool isButtonpress;
  final bool readOnly;

  const ReusableTextFormField({
    Key? key,
    required this.labelText,
    required this.validator,
    required this.textController,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    // this.fillColor,
    this.borderColor,
    this.mySuffix,
    this.onPressed,
    this.onChanged,
    // this.onTap,
    this.isButtonpress = false,
    this.readOnly=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      onChanged: onChanged,
      controller: textController,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.fromLTRB(10, 26, 10, 10),
        hintText: labelText,
        hintStyle: const TextStyle(fontWeight: FontWeight.normal),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 25, right: 10),
          child: prefixIcon != null
              ? Icon(
                  prefixIcon,
                  size: 30,
                )
              : null,
        ),

        filled: true,
        fillColor: appTheme.gray5099,

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(45.0),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(45.0),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(45.0),
          borderSide: BorderSide(
            color: appTheme.gray5099,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(45.0),
          borderSide: BorderSide(color: PrimaryColors().indigo400),
        ),
        suffixIcon: mySuffix != null
            ? IconButton(
                onPressed: onPressed,
                icon: Icon(
                  mySuffix,
                  color: appTheme.indigo400,
                  size: 23,
                ))
            : null,
        // suffixIcon: mySuffix!=null?TextButton.icon(onPressed: onPressed, icon: Icon(mySuffix,color: appTheme.indigo400,), label:Text(suffixLabel ?? '',style: TextStyle(
        //   color: appTheme.indigo400
        // ),)):null
      ),
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscureText,
    );
  }
}
