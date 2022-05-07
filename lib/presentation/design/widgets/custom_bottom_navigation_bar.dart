import 'package:fitness_app/presentation/design/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

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
        margin: const EdgeInsets.only(left: 24, right: 24, bottom: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SalomonBottomBar(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          itemPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          selectedColorOpacity: 0,
          currentIndex: _selectedIndex,
          onTap: (index) {
            widget.pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          items: [
            SalomonBottomBarItem(
              icon: SvgPicture.asset('assets/icons/home.svg'),
              activeIcon: SvgPicture.asset(
                'assets/icons/home.svg',
                color: CustomColors.primary,
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  'Home'.toUpperCase(),
                  style: GoogleFonts.dmSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
            ),
            SalomonBottomBarItem(
              icon: SvgPicture.asset('assets/icons/gym.svg'),
              activeIcon: SvgPicture.asset(
                'assets/icons/gym.svg',
                color: CustomColors.primary,
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  'Workout'.toUpperCase(),
                  style: GoogleFonts.dmSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
            ),
            SalomonBottomBarItem(
              icon: SvgPicture.asset('assets/icons/cog.svg'),
              activeIcon: SvgPicture.asset(
                'assets/icons/cog.svg',
                color: CustomColors.primary,
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  'Settings'.toUpperCase(),
                  style: GoogleFonts.dmSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
