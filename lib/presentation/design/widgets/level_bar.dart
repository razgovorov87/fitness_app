import 'package:fitness_app/presentation/design/colors.dart';
import 'package:fitness_app/presentation/design/common/interactive_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class LevelBar extends StatefulWidget {
  final void Function(int) onChanged;
  const LevelBar({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<LevelBar> createState() => _LevelBarState();
}

class _LevelBarState extends State<LevelBar> {
  late ValueNotifier<int> _currentLevelNotifier;
  late ItemScrollController scrollController;

  @override
  void initState() {
    super.initState();
    _currentLevelNotifier = ValueNotifier<int>(7);
    scrollController = ItemScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF353A50),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ValueListenableBuilder<int>(
        valueListenable: _currentLevelNotifier,
        builder: (context, currentLevel, child) => SizedBox(
          height: 70,
          child: ScrollablePositionedList.separated(
            itemScrollController: scrollController,
            padding: const EdgeInsets.all(10),
            scrollDirection: Axis.horizontal,
            initialAlignment: 0.025,
            initialScrollIndex: _currentLevelNotifier.value >= 5
                ? _currentLevelNotifier.value - 4
                : _currentLevelNotifier.value - (12 - (12 - _currentLevelNotifier.value)),
            itemBuilder: (context, index) => _levelListItem(
              index: index,
              isSelect: currentLevel == index + 1,
            ),
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemCount: 12,
          ),
        ),
      ),
    );
  }

  Widget _levelListItem({
    required int index,
    required bool isSelect,
  }) =>
      CustomInteractiveWidget(
        onTap: () {
          _currentLevelNotifier.value = index + 1;
        },
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelect ? CustomColors.primary : CustomColors.darkBackground,
          ),
          alignment: Alignment.center,
          child: Text(
            '${index + 1}',
            style: GoogleFonts.dmSans(
              fontSize: 15,
              color: isSelect ? Colors.white : CustomColors.textGray,
            ),
          ),
        ),
      );
}
