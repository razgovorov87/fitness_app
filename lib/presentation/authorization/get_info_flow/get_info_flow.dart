import 'package:fitness_app/presentation/authorization/get_info_flow/age_page.dart';
import 'package:fitness_app/presentation/authorization/get_info_flow/gender_page.dart';
import 'package:fitness_app/presentation/authorization/get_info_flow/goal_page.dart';
import 'package:fitness_app/presentation/authorization/get_info_flow/height_page.dart';
import 'package:fitness_app/presentation/authorization/get_info_flow/unit_page.dart';
import 'package:fitness_app/presentation/authorization/get_info_flow/weight_page.dart';
import 'package:fitness_app/presentation/design/colors.dart';
import 'package:fitness_app/presentation/design/solid_button.dart';
import 'package:fitness_app/presentation/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class GetInfoFlow extends StatefulWidget {
  const GetInfoFlow({Key? key}) : super(key: key);

  @override
  State<GetInfoFlow> createState() => _GetInfoFlowState();
}

class _GetInfoFlowState extends State<GetInfoFlow> {
  final _currentPageNotifier = ValueNotifier<int>(0);
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: CustomColors.darkBackground,
      body: Stack(
        children: [
          _body(),
          Align(
            alignment: Alignment.bottomCenter,
            child: _nextButton(),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: _indicator(),
          ),
        ],
      ),
    );
  }

  Widget _nextButton() => ValueListenableBuilder<int>(
        valueListenable: _currentPageNotifier,
        builder: (contex, currentPage, child) => Container(
          height: 80,
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
          child: SolidButton(
            onTap: () {
              if (currentPage != 5) {
                _pageController.animateToPage(
                  currentPage + 1,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                );
              } else {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MainScreen(initialRouteIndex: 0),
                ));
              }
            },
            child: Text(
              currentPage != 5 ? 'Continue'.toUpperCase() : 'Finish'.toUpperCase(),
              style: GoogleFonts.dmSans(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      );

  Widget _indicator() => Stack(
        children: [
          Container(
            height: 10,
            width: double.infinity,
            color: Colors.white.withOpacity(0.1),
          ),
          ValueListenableBuilder<int>(
            valueListenable: _currentPageNotifier,
            builder: (context, currentPage, child) {
              final k = (currentPage + 1) / 6;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 10,
                width: MediaQuery.of(context).size.width * k,
                decoration: BoxDecoration(
                  color: CustomColors.primary,
                  borderRadius: BorderRadius.only(
                    topRight: k != 1 ? const Radius.circular(5) : const Radius.circular(0),
                    bottomRight: k != 1 ? const Radius.circular(5) : const Radius.circular(0),
                  ),
                ),
              );
            },
          ),
        ],
      );

  Widget _body() => PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (page) {
          _currentPageNotifier.value = page;
        },
        children: const [
          GenderPage(),
          AgePage(),
          UnitPage(),
          WeightPage(),
          HeightPage(),
          GoalPage(),
        ],
      );

  PreferredSizeWidget _appBar() => AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: ValueListenableBuilder<int>(
          valueListenable: _currentPageNotifier,
          builder: (context, currentPage, child) => IconButton(
            onPressed: currentPage != 0
                ? () {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                    );
                  }
                : () {},
            splashRadius: 18,
            icon: const Icon(
              FontAwesome5.arrow_left,
              size: 16,
            ),
          ),
        ),
      );
}
