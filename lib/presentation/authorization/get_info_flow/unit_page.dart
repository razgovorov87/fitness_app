import 'package:fitness_app/domain/enum/unit.dart';
import 'package:fitness_app/presentation/design/colors.dart';
import 'package:fitness_app/presentation/design/common/interactive_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UnitPage extends StatefulWidget {
  const UnitPage({Key? key}) : super(key: key);

  @override
  State<UnitPage> createState() => _UnitPageState();
}

class _UnitPageState extends State<UnitPage> {
  final _unitNotifier = ValueNotifier<Unit>(Unit.kg);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Unites of measurement',
            textAlign: TextAlign.center,
            style: GoogleFonts.sourceSansPro(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 36,
            ),
          ),
          Text(
            'Select units',
            textAlign: TextAlign.center,
            style: GoogleFonts.sourceSansPro(
              color: CustomColors.textGray,
            ),
          ),
          const SizedBox(height: 40),
          _unitSwitch(),
        ],
      ),
    );
  }

  Widget _unitSwitch() => ValueListenableBuilder<Unit>(
        valueListenable: _unitNotifier,
        builder: (context, currentUnit, child) => Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _unitItem(
              unit: Unit.kg,
              isSelect: currentUnit == Unit.kg,
            ),
            const SizedBox(width: 20),
            _unitItem(
              unit: Unit.lbs,
              isSelect: currentUnit == Unit.lbs,
            ),
          ],
        ),
      );

  Widget _unitItem({
    required Unit unit,
    required bool isSelect,
  }) {
    final text = unit == Unit.kg ? 'Kg' : 'Lbs';

    return CustomInteractiveWidget(
      onTap: () {
        _unitNotifier.value = unit;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        decoration: BoxDecoration(
          color: isSelect ? Colors.white : Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: GoogleFonts.sourceSansPro(
            fontSize: 16,
            color: isSelect ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
