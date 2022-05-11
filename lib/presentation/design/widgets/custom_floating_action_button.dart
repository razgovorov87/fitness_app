import 'dart:math' as math;

import 'package:fitness_app/presentation/design/colors.dart';
import 'package:fitness_app/presentation/design/common/interactive_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_animated_icon/simple_animated_icon.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

class CustomSpeedDial extends StatefulWidget {
  const CustomSpeedDial({
    Key? key,
    required this.speedDialChildren,
    required this.isShowNotifier,
    this.labelsStyle,
    this.labelsBackgroundColor,
    this.controller,
    this.closedForegroundColor,
    this.openForegroundColor,
    this.closedBackgroundColor,
    this.openBackgroundColor,
  }) : super(key: key);

  final ValueNotifier<bool> isShowNotifier;

  /// A list of [SpeedDialChild] to display when the [SpeedDial] is open.
  final List<SpeedDialChild> speedDialChildren;

  /// Specifies the [SpeedDialChild] label text style.
  final TextStyle? labelsStyle;

  /// The background color of the labels.
  final Color? labelsBackgroundColor;

  /// An animation controller for the [SpeedDial].
  ///
  /// Provide an [AnimationController] to control the animations
  /// from outside the [SpeedDial] widget.
  final AnimationController? controller;

  /// The color of the [SpeedDial] button foreground when closed.
  ///
  /// The [SpeedDial] foreground will animate to this color when the user
  /// closes the speed dial.
  final Color? closedForegroundColor;

  /// The color of the [SpeedDial] button foreground when opened.
  ///
  /// The [SpeedDial] foreground will animate to this color when the user
  /// opens the speed dial.
  final Color? openForegroundColor;

  /// The color of the [SpeedDial] button background when closed.
  ///
  /// The [SpeedDial] background will animate to this color when the user
  /// closes the speed dial.
  final Color? closedBackgroundColor;

  /// The color of the [SpeedDial] button background when open.
  ///
  /// The [SpeedDial] background will animate to this color when the user
  /// opens the speed dial.
  final Color? openBackgroundColor;

  @override
  State<StatefulWidget> createState() {
    return _SpeedDialState();
  }
}

class _SpeedDialState extends State<CustomSpeedDial> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _backgroundColorAnimation;
  late Animation<Color?> _foregroundColorAnimation;
  final List<Animation<double>> _speedDialChildAnimations = <Animation<double>>[];

  @override
  void initState() {
    _animationController =
        widget.controller ?? AnimationController(vsync: this, duration: const Duration(milliseconds: 250));
    _animationController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    _backgroundColorAnimation = ColorTween(
      begin: widget.closedBackgroundColor,
      end: widget.openBackgroundColor,
    ).animate(_animationController);

    _foregroundColorAnimation = ColorTween(
      begin: widget.closedForegroundColor,
      end: widget.openForegroundColor,
    ).animate(_animationController);

    final double fractionOfOneSpeedDialChild = 1.0 / widget.speedDialChildren.length;
    for (int speedDialChildIndex = 0; speedDialChildIndex < widget.speedDialChildren.length; ++speedDialChildIndex) {
      final List<TweenSequenceItem<double>> tweenSequenceItems = <TweenSequenceItem<double>>[];

      final double firstWeight = fractionOfOneSpeedDialChild * speedDialChildIndex;
      if (firstWeight > 0.0) {
        tweenSequenceItems.add(TweenSequenceItem<double>(
          tween: ConstantTween<double>(0.0),
          weight: firstWeight,
        ));
      }

      tweenSequenceItems.add(TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        weight: fractionOfOneSpeedDialChild,
      ));

      final double lastWeight =
          fractionOfOneSpeedDialChild * (widget.speedDialChildren.length - 1 - speedDialChildIndex);
      if (lastWeight > 0.0) {
        tweenSequenceItems.add(TweenSequenceItem<double>(tween: ConstantTween<double>(1.0), weight: lastWeight));
      }

      _speedDialChildAnimations.insert(0, TweenSequence<double>(tweenSequenceItems).animate(_animationController));
    }

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int speedDialChildAnimationIndex = 0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        AnimatedOpacity(
          duration: const Duration(milliseconds: 250),
          opacity: !_animationController.isDismissed == true ? 1 : 0,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              _arrow(),
              _body(speedDialChildAnimationIndex),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 10),
          child: SizedBox(
            height: 50,
            child: FloatingActionButton(
              child: SimpleAnimatedIcon(
                startIcon: Icons.add,
                endIcon: Icons.close,
                progress: _animationController,
              ),
              foregroundColor: _foregroundColorAnimation.value,
              backgroundColor: CustomColors.primary,
              onPressed: () {
                if (_animationController.isDismissed) {
                  _animationController.forward();
                  widget.isShowNotifier.value = true;
                } else {
                  _animationController.reverse();
                  widget.isShowNotifier.value = false;
                }
              },
            ),
          ),
        )
      ],
    );
  }

  Widget _body(int speedDialChildAnimationIndex) => Container(
        width: 150,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color: const Color(0xFF23252f),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.speedDialChildren.map<Widget>((SpeedDialChild speedDialChild) {
            final Widget speedDialChildWidget = Opacity(
              opacity: _speedDialChildAnimations[speedDialChildAnimationIndex].value,
              child: CustomInteractiveWidget(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          speedDialChild.label!,
                          style: GoogleFonts.quicksand(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      speedDialChild.child,
                      // if (speedDialChild.label != null)
                      //   Card(
                      //     elevation: 6.0,
                      //     color: widget.labelsBackgroundColor ?? Colors.white,
                      //     semanticContainer: true,
                      //     clipBehavior: Clip.antiAliasWithSaveLayer,
                      //     child: InkWell(
                      //       onTap: () => _onTap(speedDialChild),
                      //       child: Padding(
                      //         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      //         child: Text(
                      //           speedDialChild.label!,
                      //           style: widget.labelsStyle,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                    ],
                  ),
                ),
              ),
            );
            speedDialChildAnimationIndex++;
            return speedDialChildWidget;
          }).toList(),
        ),
      );

  Widget _arrow() => Positioned(
        bottom: -10,
        left: 0,
        right: 0,
        child: Center(
          child: Transform.rotate(
            angle: -math.pi / 4,
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                ),
                color: Color(0xFF23252f),
              ),
            ),
          ),
        ),
      );

  void _onTap(SpeedDialChild speedDialChild) {
    if (speedDialChild.closeSpeedDialOnPressed) {
      _animationController.reverse();
    }
    speedDialChild.onPressed.call();
  }
}
