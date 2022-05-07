import 'package:fitness_app/presentation/design/widgets/custom_bottom_navigation_bar.dart';
import 'package:fitness_app/presentation/main/home/home_page.dart';
import 'package:fitness_app/presentation/main/settings/settings_page.dart';
import 'package:fitness_app/presentation/main/workout/workout_page.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final int initialRouteIndex;
  const MainScreen({
    Key? key,
    required this.initialRouteIndex,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController _pageController;
  late ValueNotifier<int> _currentIndexNotifier;

  @override
  void initState() {
    super.initState();
    _currentIndexNotifier = ValueNotifier<int>(widget.initialRouteIndex);
    _pageController = PageController(initialPage: widget.initialRouteIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CustomNavigationBar(
        pageController: _pageController,
        currentIndexNotifier: _currentIndexNotifier,
      ),
      backgroundColor: const Color(0xFF353A50),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) {
          _currentIndexNotifier.value = index;
        },
        children: [
          HomePage(pageController: _pageController),
          const WorkoutPage(),
          const SettingsPage(),
        ],
      ),
    );
  }
}
