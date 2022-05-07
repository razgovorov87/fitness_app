import 'package:fitness_app/domain/enum/gender.dart';
import 'package:fitness_app/presentation/design/colors.dart';
import 'package:fitness_app/presentation/design/common/interactive_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class GenderPage extends StatefulWidget {
  const GenderPage({Key? key}) : super(key: key);

  @override
  State<GenderPage> createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  final _genderNotifier = ValueNotifier<Gender>(Gender.male);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Male or Female?',
            textAlign: TextAlign.center,
            style: GoogleFonts.sourceSansPro(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 36,
            ),
          ),
          Text(
            'Select your gender',
            textAlign: TextAlign.center,
            style: GoogleFonts.sourceSansPro(
              color: CustomColors.textGray,
            ),
          ),
          const SizedBox(height: 40),
          _genderSwitch(),
        ],
      ),
    );
  }

  Widget _genderSwitch() => ValueListenableBuilder<Gender>(
        valueListenable: _genderNotifier,
        builder: (context, currentGender, child) => Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _genderItem(
              gender: Gender.male,
              isSelect: currentGender == Gender.male,
            ),
            const SizedBox(width: 20),
            _genderItem(
              gender: Gender.female,
              isSelect: currentGender == Gender.female,
            ),
          ],
        ),
      );

  Widget _genderItem({
    required Gender gender,
    required bool isSelect,
  }) {
    final icon = gender == Gender.male ? 'male' : 'female';

    return CustomInteractiveWidget(
      onTap: () {
        _genderNotifier.value = gender;
      },
      child: Container(
        width: 80,
        height: 80,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelect ? Colors.white : const Color(0xFF353A50),
        ),
        child: SvgPicture.asset(
          'assets/icons/$icon.svg',
          color: isSelect ? CustomColors.primary : Colors.white,
        ),
      ),
    );
  }
}
