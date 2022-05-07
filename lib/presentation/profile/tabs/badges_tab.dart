import 'package:fitness_app/domain/model/user_badge.dart';
import 'package:fitness_app/presentation/design/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BadgesTab extends StatelessWidget {
  BadgesTab({Key? key}) : super(key: key);

  final badges = <UserBadge>[
    UserBadge(
      title: 'Best workout',
      subtitle: '27 exercises completed',
      iconPath: 'assets/icons/best_workout.svg',
      date: '10/08/2020',
      time: '17:24',
    ),
    UserBadge(
      title: 'Workout of the week',
      subtitle: '727 exercises completed',
      iconPath: 'assets/icons/gym_bycicle.svg',
      date: '07/08/2020',
      time: '12:11',
    ),
    UserBadge(
      title: '99 days',
      subtitle: '188 exercises completed',
      iconPath: 'assets/icons/gym_weight.svg',
      date: '01/06/2020',
      time: '18:23',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...badges.map((e) => _badgeItem(e)),
        ],
      ),
    );
  }

  Widget _badgeItem(UserBadge badge) => Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        decoration: BoxDecoration(
          color: const Color(0xFF353A50),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(badge.iconPath),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  badge.title,
                  style: GoogleFonts.sourceSansPro(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  badge.subtitle,
                  style: GoogleFonts.dmSans(
                    color: CustomColors.textGray,
                  ), 
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      badge.date,
                      style: GoogleFonts.dmSans(
                        color: CustomColors.textGray,
                      ),
                    ),
                    const SizedBox(width: 30),
                    Text(
                      badge.time,
                      style: GoogleFonts.dmSans(
                        color: CustomColors.textGray,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
}
