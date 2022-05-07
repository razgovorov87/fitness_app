import 'package:fitness_app/presentation/design/colors.dart';
import 'package:fitness_app/presentation/design/common/interactive_widget.dart';
import 'package:flutter/material.dart';

class SolidButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  const SolidButton({
    Key? key,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInteractiveWidget(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: CustomColors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
    );
  }
}
