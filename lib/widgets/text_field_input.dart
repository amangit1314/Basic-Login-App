import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  final VoidCallback? onChanged;
  final IconData? prefixIcon;
  final IconData? sufixIcon;
  final VoidCallback? onPressed;
  final Color? iconColor;
  //final Border border;
  final EdgeInsetsGeometry? contentPadding;

  const TextFieldInput({
    Key? key,
    required this.textEditingController,
    this.isPass = false,
    required this.hintText,
    required this.textInputType,
    this.onChanged,
    this.prefixIcon,
    this.sufixIcon,
    this.iconColor,
    this.contentPadding = const EdgeInsets.all(8),
    this.onPressed,
    //required this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context, color: Colors.black54),
      borderRadius: BorderRadius.circular(12.0),
    );

    return TextField(
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          color: Colors.black,
        ),
      ),
      controller: textEditingController,
      onChanged: (value) {
        onChanged?.call();
      },
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefixIcon,
          color: iconColor,
        ),
        hintStyle: GoogleFonts.poppins(
          textStyle: TextStyle(
            color: Colors.black54,
            fontSize: 13.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            sufixIcon,
            color: iconColor,
          ),
          onPressed: () => onPressed?.call(),
        ),
        hintText: hintText,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding: contentPadding,
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
