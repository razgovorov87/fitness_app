import 'package:fitness_app/presentation/design/colors.dart';
import 'package:fitness_app/presentation/design/common/interactive_widget.dart';
import 'package:fitness_app/presentation/main/workout/workout_item_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutCard extends StatefulWidget {
  final String bgImagePath;
  final String title;
  final String subtitle;
  final String? chip;
  final bool showRightChevron;
  final bool showStartButton;
  final EdgeInsets margin;
  final double? width;
  const WorkoutCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.bgImagePath,
    this.showStartButton = false,
    this.showRightChevron = false,
    this.margin = const EdgeInsets.symmetric(horizontal: 24),
    this.chip,
    this.width,
  }) : super(key: key);

  @override
  State<WorkoutCard> createState() => _WorkoutCardState();
}

class _WorkoutCardState extends State<WorkoutCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.showRightChevron
          ? () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const WorkoutItemPage(),
              ));
            }
          : () {},
      child: Container(
        height: 130,
        width: widget.width ?? MediaQuery.of(context).size.width - widget.margin.right * 2,
        margin: widget.showStartButton ? widget.margin + const EdgeInsets.only(bottom: 20) : widget.margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 3),
              blurRadius: 10,
              color: Colors.black.withOpacity(0.3),
            ),
          ],
        ),
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            _bgImage(),
            _gradient(),
            _body(),
            if (widget.showRightChevron) _chevron(),
            if (widget.showStartButton) _startButton(),
          ],
        ),
      ),
    );
  }

  Widget _chevron() => const Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.only(right: 10),
          child: Icon(
            Icons.chevron_right_rounded,
            color: Colors.white,
            size: 30,
          ),
        ),
      );

  Widget _body() => Positioned(
        top: 0,
        right: 0,
        bottom: 18,
        left: 25,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              widget.title,
              style: GoogleFonts.sourceSansPro(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              widget.subtitle,
              style: GoogleFonts.dmSans(
                color: CustomColors.textGray,
              ),
            ),
            const SizedBox(height: 10),
            if (widget.chip != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: CustomColors.primary.withOpacity(0.4),
                ),
                child: Text(
                  widget.chip!,
                  style: GoogleFonts.dmSans(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      );

  Widget _startButton() => Positioned(
        bottom: -20,
        right: 24,
        child: CustomInteractiveWidget(
          onTap: () {},
          child: Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            decoration: BoxDecoration(
              color: CustomColors.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: Text(
              'Start'.toUpperCase(),
              style: GoogleFonts.dmSans(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ),
      );

  Widget _bgImage() => ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          widget.bgImagePath,
          fit: BoxFit.cover,
        ),
      );

  Widget _gradient() => Positioned(
        top: 0,
        left: 0,
        right: 0,
        bottom: 0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(0.7),
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
      );
}
