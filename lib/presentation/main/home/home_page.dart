import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:fitness_app/presentation/design/colors.dart';
import 'package:fitness_app/presentation/design/common/interactive_widget.dart';
import 'package:fitness_app/presentation/design/widgets/connect_your_device_card.dart';
import 'package:fitness_app/presentation/design/widgets/level_bar.dart';
import 'package:fitness_app/presentation/design/widgets/workout_card.dart';
import 'package:fitness_app/presentation/main/workout/widgets/workout_list.dart';
import 'package:fitness_app/presentation/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  final PageController pageController;
  const HomePage({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _userHeader(),
          _content(),
        ],
      ),
    );
  }

  Widget _content() => Expanded(
        child: Container(
          padding: const EdgeInsets.only(
            top: 0,
            left: 0,
            right: 0,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            color: CustomColors.darkBackground,
          ),
          child: FadingEdgeScrollView.fromSingleChildScrollView(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        "Let's continue your fitness challenge.",
                        style: GoogleFonts.sourceSansPro(
                          fontSize: 15,
                          color: CustomColors.textGray,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: LevelBar(
                        onChanged: (newLevel) {},
                      ),
                    ),
                    const SizedBox(height: 20),
                    const WorkoutCard(
                      title: "Today's workout",
                      subtitle: "12 Exercises",
                      showStartButton: true,
                      bgImagePath: 'assets/images/today_workout.png',
                    ),
                    const SizedBox(height: 20),
                    const WorkoutCard(
                      title: "Quads & Deltoids",
                      subtitle: "7 Exercises completed",
                      bgImagePath: 'assets/images/workout1.png',
                      chip: 'Previous Workout',
                      showRightChevron: true,
                    ),
                    const SizedBox(height: 20),
                    const ConnectYourDeviceAppCard(),
                    const SizedBox(height: 20),
                    const SizedBox(
                      height: 130,
                      child: WorkoutList(),
                    ),
                    SizedBox(height: MediaQuery.of(context).viewPadding.bottom + 100),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Widget _userHeader() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello',
                  style: GoogleFonts.sourceSansPro(
                    fontSize: 26,
                    color: CustomColors.textGray,
                  ),
                ),
                Text(
                  'Jonh Smith 👋',
                  style: GoogleFonts.sourceSansPro(
                    fontSize: 28,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            CustomInteractiveWidget(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ));
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset('assets/images/avatar.png'),
              ),
            ),
          ],
        ),
      );
}
