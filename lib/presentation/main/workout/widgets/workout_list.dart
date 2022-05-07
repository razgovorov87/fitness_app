import 'package:fitness_app/domain/model/workout.dart';
import 'package:fitness_app/presentation/design/widgets/workout_card.dart';
import 'package:flutter/material.dart';

class WorkoutList extends StatefulWidget {
  const WorkoutList({Key? key}) : super(key: key);

  @override
  State<WorkoutList> createState() => _WorkoutListState();
}

class _WorkoutListState extends State<WorkoutList> {
  final list = <Workout>[
    Workout(
      bgImagePath: 'assets/images/workout2.png',
      title: 'Push up Routing',
      subtitle: '12 Exercises',
      chip: 'Medium Difficulty',
    ),
    Workout(
      bgImagePath: 'assets/images/today_workout.png',
      title: 'Push up Routing',
      subtitle: '14 Exercises',
      chip: 'Hard Difficulty',
    ),
    Workout(
      bgImagePath: 'assets/images/workout1.png',
      title: 'Push up Routing',
      subtitle: '7 Exercises',
      chip: 'Easy Difficulty',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 3,
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => WorkoutCard(
        bgImagePath: list[index].bgImagePath,
        title: list[index].title,
        subtitle: list[index].subtitle,
        chip: list[index].chip,
        margin: EdgeInsets.zero,
        showRightChevron: true,
        width: MediaQuery.of(context).size.width - 80,
      ),
      separatorBuilder: (context, index) => const SizedBox(width: 14),
    );
  }
}
