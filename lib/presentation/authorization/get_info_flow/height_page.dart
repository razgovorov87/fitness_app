import 'package:fitness_app/presentation/design/colors.dart';
import 'package:fitness_app/presentation/design/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeightPage extends StatefulWidget {
  const HeightPage({Key? key}) : super(key: key);

  @override
  State<HeightPage> createState() => _HeightPageState();
}

class _HeightPageState extends State<HeightPage> {
  final _weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'What is your height?',
            textAlign: TextAlign.center,
            style: GoogleFonts.sourceSansPro(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 36,
            ),
          ),
          Text(
            'Enter your height',
            textAlign: TextAlign.center,
            style: GoogleFonts.sourceSansPro(
              color: CustomColors.textGray,
            ),
          ),
          const SizedBox(height: 40),
          _weightField(),
        ],
      ),
    );
  }

  Widget _weightField() => CustomTextFormField(
        controller: _weightController,
        suffixText: 'cm',
      );
}
