import 'package:fitness_app/presentation/design/colors.dart';
import 'package:fitness_app/presentation/design/common/interactive_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomNavigationBar extends StatefulWidget {
  final PageController pageController;
  final ValueNotifier<int> currentIndexNotifier;
  const CustomNavigationBar({
    Key? key,
    required this.pageController,
    required this.currentIndexNotifier,
  }) : super(key: key);

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: widget.currentIndexNotifier,
      builder: (context, _selectedIndex, child) => Container(
        height: 70,
        decoration: BoxDecoration(
          color: CustomColors.newDarkBackground,
          border: Border(
            top: BorderSide(
              color: Colors.grey.withOpacity(0.2),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _menuItem(
              icon: Typicons.home,
              label: 'Home',
              isSelect: _selectedIndex == 0,
              index: 0,
            ),
            _menuItem(
              icon: FontAwesome5.search,
              label: 'Search',
              isSelect: _selectedIndex == 1,
              index: 1,
            ),
            const SizedBox(width: 70),
            _menuItem(
              icon: FontAwesome5.bell,
              label: 'Notification',
              isSelect: _selectedIndex == 2,
              index: 2,
            ),
            _menuItem(
              icon: Typicons.user,
              label: 'Profile',
              isSelect: _selectedIndex == 3,
              index: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuItem({
    required IconData icon,
    required String label,
    required bool isSelect,
    required int index,
  }) =>
      Expanded(
        child: CustomInteractiveWidget(
          onTap: () {
            widget.pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
            );
            widget.currentIndexNotifier.value = index;
          },
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: Column(
              key: ValueKey(isSelect),
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: isSelect ? CustomColors.primary : Colors.white.withOpacity(0.5),
                ),
                const SizedBox(height: 3),
                Text(
                  label,
                  style: GoogleFonts.quicksand(
                    color: isSelect ? CustomColors.primary : Colors.white.withOpacity(0.5),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
