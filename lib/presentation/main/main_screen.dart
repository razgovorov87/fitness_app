import 'package:fitness_app/presentation/design/widgets/custom_bottom_navigation_bar.dart';
import 'package:fitness_app/presentation/design/widgets/custom_floating_action_button.dart';
import 'package:fitness_app/presentation/main/home/home_page.dart';
import 'package:fitness_app/presentation/main/settings/settings_page.dart';
import 'package:fitness_app/presentation/news/news_page.dart';
import 'package:fitness_app/presentation/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

class MainScreen extends StatefulWidget {
  final int initialRouteIndex;
  const MainScreen({
    Key? key,
    required this.initialRouteIndex,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late ValueNotifier<int> _currentIndexNotifier;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _currentIndexNotifier = ValueNotifier<int>(widget.initialRouteIndex);
    _pageController = PageController(initialPage: widget.initialRouteIndex);
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 250));
  }

  @override
  Widget build(BuildContext context) {
    final isAddMenuShow = ValueNotifier<bool>(false);

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CustomNavigationBar(
        pageController: _pageController,
        currentIndexNotifier: _currentIndexNotifier,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomSpeedDial(
        controller: _animationController,
        isShowNotifier: isAddMenuShow,
        speedDialChildren: [
          SpeedDialChild(
            onPressed: () {},
            backgroundColor: Colors.red,
            label: 'Post',
            child: const Icon(
              Linecons.pencil,
              color: Colors.white,
              size: 20,
            ),
          ),
          SpeedDialChild(
            onPressed: () {},
            label: 'Story',
            child: const Icon(
              Linecons.user,
              color: Colors.white,
              size: 20,
            ),
          ),
          SpeedDialChild(
            onPressed: () {},
            label: 'Live',
            child: const Icon(
              Linecons.videocam,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFF353A50),
      body: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (index) {
              _currentIndexNotifier.value = index;
            },
            children: [
              const NewsPage(),
              HomePage(pageController: _pageController),
              const SettingsPage(),
              const ProfilePage(),
            ],
          ),
          ValueListenableBuilder<bool>(
            valueListenable: isAddMenuShow,
            builder: (context, isOpen, child) => Align(
              child: IgnorePointer(
                ignoring: isOpen == false,
                child: GestureDetector(
                  onTap: () {
                    isAddMenuShow.value = false;
                    _animationController.reverse();
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    color: isOpen ? Colors.black.withOpacity(0.7) : Colors.transparent,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
