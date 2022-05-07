import 'package:fitness_app/presentation/design/colors.dart';
import 'package:fitness_app/presentation/design/common/workout_header_delegate.dart';
import 'package:fitness_app/presentation/design/solid_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutItemPage extends StatefulWidget {
  const WorkoutItemPage({Key? key}) : super(key: key);

  @override
  State<WorkoutItemPage> createState() => _WorkoutItemPageState();
}

class _WorkoutItemPageState extends State<WorkoutItemPage> {
  final scrollController = ScrollController();
  final exercisesList = <String>[
    'Pull up',
    'Dumbbell rows',
    'Squats',
    'Single-leg deadlifts',
    'Squats',
    'Dumbbell rows',
    'Single-leg deadlifts',
    'Pull up',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.darkBackground,
      body: Stack(
        children: [
          CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                delegate: WorkoutHeaderDelegate(
                  minHeight: 70 + MediaQuery.of(context).viewPadding.top,
                  maxHeight: 300,
                ),
              ),
              SliverToBoxAdapter(
                child: _body(),
              ),
            ],
          ),
          _gradient(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 30, left: 60, right: 60),
              height: 60,
              child: _startButton(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _gradient() => IgnorePointer(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [
                CustomColors.darkBackground.withOpacity(0.9),
                CustomColors.darkBackground.withOpacity(0.3),
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0, 0.3, 0.5],
            ),
          ),
        ),
      );

  Widget _body() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Exercises',
              textAlign: TextAlign.start,
              style: GoogleFonts.sourceSansPro(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 20),
            ListView.separated(
              controller: scrollController,
              padding: const EdgeInsets.only(bottom: 130),
              itemCount: exercisesList.length,
              itemBuilder: (context, index) => _exerciesItem(index),
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              shrinkWrap: true,
            ),
          ],
        ),
      );

  Widget _startButton() => SolidButton(
        onTap: () {},
        child: Text(
          'Start workout'.toUpperCase(),
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      );

  Widget _exerciesItem(int index) => Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.07),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  exercisesList[index],
                  textAlign: TextAlign.start,
                  style: GoogleFonts.sourceSansPro(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SvgPicture.asset('assets/icons/light-menu.svg'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '5 sets',
                  style: GoogleFonts.dmSans(
                    color: CustomColors.textGray,
                  ),
                ),
                Text(
                  '10-12 reps',
                  style: GoogleFonts.dmSans(
                    color: CustomColors.textGray,
                  ),
                ),
                Text(
                  '50 sec rest',
                  style: GoogleFonts.dmSans(
                    color: CustomColors.textGray,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
