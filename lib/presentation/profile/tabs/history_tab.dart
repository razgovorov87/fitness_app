import 'package:fitness_app/domain/model/user_history.dart';
import 'package:fitness_app/presentation/design/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryTab extends StatelessWidget {
  HistoryTab({Key? key}) : super(key: key);

  final historyList = <UserHistory>[
    UserHistory(
      date: DateTime(2020, 8, 12),
      title: 'Quads & Deltoids',
      subtitle: '27 exercises completed',
    ),
    UserHistory(
      date: DateTime(2020, 3, 14),
      title: 'Quads & Deltoids',
      subtitle: '27 exercises completed',
    ),
    UserHistory(
      date: DateTime(2020, 6, 26),
      title: 'Quads & Deltoids',
      subtitle: '27 exercises completed',
    ),
    UserHistory(
      date: DateTime(2020, 1, 12),
      title: 'Quads & Deltoids',
      subtitle: '27 exercises completed',
    ),
    UserHistory(
      date: DateTime(2020, 8, 16),
      title: 'Quads & Deltoids',
      subtitle: '27 exercises completed',
    ),
  ];

  final months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  @override
  Widget build(BuildContext context) {
    historyList.sort((a, b) => b.date.compareTo(a.date));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          ...historyList.map((e) => _histroryItem(e)),
        ],
      ),
    );
  }

  Widget _histroryItem(UserHistory history) => Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color(0xFF353A50),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: CustomColors.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    history.date.day.toString(),
                    style: GoogleFonts.dmSans(
                      fontSize: 19,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    months[history.date.month].toUpperCase(),
                    style: GoogleFonts.dmSans(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  history.title,
                  style: GoogleFonts.sourceSansPro(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  history.subtitle,
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
