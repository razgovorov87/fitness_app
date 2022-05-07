import 'package:fitness_app/presentation/design/colors.dart';
import 'package:fitness_app/presentation/design/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeightPage extends StatefulWidget {
  const WeightPage({Key? key}) : super(key: key);

  @override
  State<WeightPage> createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
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
            'What is your weight?',
            textAlign: TextAlign.center,
            style: GoogleFonts.sourceSansPro(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 36,
            ),
          ),
          Text(
            'Enter your weight',
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
        suffixText: 'kg',
      );
}
