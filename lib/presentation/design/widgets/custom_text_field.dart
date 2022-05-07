import 'package:fitness_app/presentation/design/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool autocorrect;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? suffixText;
  const CustomTextFormField({
    Key? key,
    required this.controller,
    this.hintText,
    this.autocorrect = true,
    this.obscureText = false,
    this.keyboardType,
    this.suffixText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFF353A50),
      ),
      child: suffixText != null
          ? Row(
              children: [
                Expanded(
                  child: _field(),
                ),
                Text(
                  suffixText!,
                  style: GoogleFonts.sourceSansPro(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
              ],
            )
          : _field(),
    );
  }

  Widget _field() => TextFormField(
        keyboardType: keyboardType,
        obscureText: obscureText,
        autocorrect: autocorrect,
        cursorColor: Colors.white,
        style: GoogleFonts.sourceSansPro(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: GoogleFonts.sourceSansPro(
            color: CustomColors.textGray,
          ),
        ),
      );
}
