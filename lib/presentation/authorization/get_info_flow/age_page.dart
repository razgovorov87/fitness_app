import 'package:fitness_app/presentation/design/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class AgePage extends StatefulWidget {
  const AgePage({Key? key}) : super(key: key);

  @override
  State<AgePage> createState() => _AgePageState();
}

class _AgePageState extends State<AgePage> {
  final _ageNotifier = ValueNotifier<int>(22);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "What's your age?",
            textAlign: TextAlign.center,
            style: GoogleFonts.sourceSansPro(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 36,
            ),
          ),
          Text(
            'Select your age',
            textAlign: TextAlign.center,
            style: GoogleFonts.sourceSansPro(
              color: CustomColors.textGray,
            ),
          ),
          Expanded(
            child: _ageCarousel(),
          ),
        ],
      ),
    );
  }

  Widget _ageCarousel() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100),
      child: Stack(
        children: [
          Align(
            child: Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                color: Color(0xFF353A50),
                shape: BoxShape.circle,
              ),
            ),
          ),
          WheelChooser.integer(
            onValueChanged: (value) {
              HapticFeedback.selectionClick();
            },
            selectTextStyle: GoogleFonts.sourceSansPro(
              fontSize: 16,
              color: Colors.white,
            ),
            unSelectTextStyle: GoogleFonts.sourceSansPro(
              fontSize: 16,
              color: Colors.white.withOpacity(0.2),
            ),
            maxValue: 100,
            minValue: 10,
            perspective: 0.006,
            initValue: _ageNotifier.value,
            itemSize: 60,
          ),
        ],
      ),
    );
  }
}
