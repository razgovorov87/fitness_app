import 'dart:math';

import 'package:fitness_app/presentation/design/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutHeaderDelegate implements SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;

  WorkoutHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
  });
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final _zeroToMax = max(0.0, shrinkOffset) / maxExtent;

    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/workout1.png',
          fit: BoxFit.cover,
        ),
        _gradient(),
        _headerContent(),
        _appBar(context, _zeroToMax),
        _addButton(context, _zeroToMax),
        _backButton(context),
      ],
    );
  }

  Widget _headerContent() => Positioned(
        left: 24,
        right: 24,
        bottom: 60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Quads & Deltoids',
              textAlign: TextAlign.start,
              style: GoogleFonts.sourceSansPro(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              '7 Exercises',
              style: GoogleFonts.dmSans(
                color: CustomColors.textGray,
              ),
            ),
            const SizedBox(height: 18),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: CustomColors.primary.withOpacity(0.4),
              ),
              child: Text(
                'Medium Quaility',
                style: GoogleFonts.dmSans(
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      );

  Widget _backButton(BuildContext context) => Positioned(
        top: ((minExtent + 1 - MediaQuery.of(context).viewPadding.top) / 2) - 5,
        left: 16,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.of(context).maybePop();
            },
            borderRadius: BorderRadius.circular(12),
            child: Container(
              alignment: Alignment.center,
              width: 50,
              height: 50,
              child: const Icon(
                FontAwesome5.arrow_left,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      );

  Widget _addButton(
    BuildContext context,
    double _zeroToMax,
  ) =>
      Positioned(
        bottom: _buttonPosition(_zeroToMax, MediaQuery.of(context).viewPadding.top),
        right: 24,
        child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: CustomColors.primary,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            )),
      );

  Widget _gradient() => Container(
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
      );

  Widget _appBar(
    BuildContext context,
    double _zeroToMax,
  ) =>
      Positioned(
        bottom: -1,
        left: 0,
        right: 0,
        child: Container(
          height: (minExtent + 1) * _zeroToMax > 30 ? (minExtent + 1) * _zeroToMax : 30,
          decoration: BoxDecoration(
            color: CustomColors.darkBackground,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25 * (1 - _zeroToMax)),
              topRight: Radius.circular(25 * (1 - _zeroToMax)),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Align(
                  child: _zeroToMax > 0.78
                      ? Opacity(
                          opacity: (_zeroToMax - 0.78) / (1 - 0.78),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Quads & Deltoids',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.sourceSansPro(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                '7 Exercises',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.dmSans(
                                  color: CustomColors.textGray,
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          ),
        ),
      );

  double _buttonPosition(double offset, double topPadding) {
    return offset > 0.7 ? ((minExtent + 1 - topPadding) / 2) - 25 : 5;
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration => null;

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration? get stretchConfiguration => null;

  @override
  TickerProvider? get vsync => null;
}
