import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:fitness_app/presentation/design/colors.dart';
import 'package:fitness_app/presentation/design/common/interactive_widget.dart';
import 'package:fitness_app/presentation/profile/tabs/badges_tab.dart';
import 'package:fitness_app/presentation/profile/tabs/history_tab.dart';
import 'package:fitness_app/presentation/profile/tabs/stats_tab.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final scrollController = ScrollController();
  final pageController = PageController();
  final _currentTabNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.darkBackground,
      body: _body(),
    );
  }

  Widget _body() => SafeArea(
        child: Column(
          children: [
            _header(),
            _userBlock(),
            Expanded(
              child: _userStats(),
            ),
          ],
        ),
      );
  Widget _userStats() => SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            _statsContainer(),
            const SizedBox(height: 20),
            _switchs(),
            const SizedBox(height: 15),
            ExpandablePageView(
              controller: pageController,
              onPageChanged: (index) {
                _currentTabNotifier.value = index;
              },
              children: [
                BadgesTab(),
                HistoryTab(),
                const StatsTab(),
              ],
            ),
          ],
        ),
      );

  Widget _switchs() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ValueListenableBuilder(
          valueListenable: _currentTabNotifier,
          builder: (context, currentTab, child) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _viewSwitch(
                index: 0,
                text: 'Badges',
                isSelect: currentTab == 0,
              ),
              const SizedBox(width: 14),
              _viewSwitch(
                index: 1,
                text: 'History',
                isSelect: currentTab == 1,
              ),
              const SizedBox(width: 14),
              _viewSwitch(
                index: 2,
                text: 'Stats',
                isSelect: currentTab == 2,
              ),
            ],
          ),
        ),
      );

  Widget _viewSwitch({
    required int index,
    required String text,
    required bool isSelect,
  }) =>
      Expanded(
        child: CustomInteractiveWidget(
          onTap: () {
            _currentTabNotifier.value = index;
            pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              color: isSelect ? CustomColors.primary.withOpacity(0.10) : const Color(0xFF353A50),
              borderRadius: BorderRadius.circular(10),
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Text(
                text.toUpperCase(),
                key: ValueKey(isSelect),
                textAlign: TextAlign.center,
                style: GoogleFonts.dmSans(
                  color: isSelect ? CustomColors.primary : Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      );

  Widget _statsContainer() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        decoration: BoxDecoration(
          color: CustomColors.primary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  '178 cm',
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Height',
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            _statsDivider(),
            Column(
              children: [
                Text(
                  '24',
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Years old',
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            _statsDivider(),
            Column(
              children: [
                Text(
                  '78 kg',
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Weight',
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  Widget _statsDivider() => Container(
        height: 40,
        width: 1,
        color: Colors.white.withOpacity(0.15),
      );

  Widget _userBlock() => Container(
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
          children: [
            ClipOval(
              child: Image.asset(
                'assets/images/avatar.png',
                width: 130,
                height: 130,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Jonh Smith',
              style: GoogleFonts.sourceSansPro(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            Text(
              'Member since June 2020',
              style: GoogleFonts.sourceSansPro(
                fontSize: 16,
                color: CustomColors.textGray,
              ),
            ),
          ],
        ),
      );

  Widget _header() => Container(
        padding: const EdgeInsets.only(top: 12, right: 24, bottom: 10, left: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomInteractiveWidget(
              onTap: () {},
              child: const Icon(
                FontAwesome5.arrow_left,
                color: Colors.white,
                size: 20,
              ),
            ),
            CustomInteractiveWidget(
              onTap: () {
                // userSettings
              },
              child: const Icon(
                FontAwesome5.cog,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
      );
}
