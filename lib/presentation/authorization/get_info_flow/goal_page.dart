import 'package:fitness_app/presentation/design/colors.dart';
import 'package:fitness_app/presentation/design/common/interactive_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class GoalPage extends StatefulWidget {
  const GoalPage({Key? key}) : super(key: key);

  @override
  State<GoalPage> createState() => _GoalPageState();
}

class _GoalPageState extends State<GoalPage> {
  final _goalNotifier = ValueNotifier<int>(1);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'What is your fitness goal?',
            textAlign: TextAlign.center,
            style: GoogleFonts.sourceSansPro(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 36,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Select your goal',
            textAlign: TextAlign.center,
            style: GoogleFonts.sourceSansPro(
              color: CustomColors.textGray,
            ),
          ),
          const SizedBox(height: 20),
          _goalsList(),
        ],
      ),
    );
  }

  Widget _goalsList() {
    final list = [
      'Lose Fat',
      'Get Stronger',
      'Build Muscle',
      'Improve Endurance',
      'Improve Flexibility',
    ];

    return ValueListenableBuilder<int>(
      valueListenable: _goalNotifier,
      builder: (context, value, child) => ListView.separated(
        itemBuilder: (context, index) => _goalItem(
          index: index,
          text: list[index],
          isSelect: value == index,
        ),
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: list.length,
        shrinkWrap: true,
      ),
    );
  }

  Widget _goalItem({
    required int index,
    required String text,
    required bool isSelect,
  }) {
    return CustomInteractiveWidget(
      onTap: () {
        _goalNotifier.value = index;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        decoration: BoxDecoration(
          color: isSelect ? Colors.white : const Color(0xFF353A50),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: GoogleFonts.sourceSansPro(
                  fontSize: 16,
                  color: isSelect ? Colors.black : Colors.white,
                ),
              ),
            ),
            if (isSelect) SvgPicture.asset('assets/icons/goal_select.svg'),
          ],
        ),
      ),
    );
  }
}
