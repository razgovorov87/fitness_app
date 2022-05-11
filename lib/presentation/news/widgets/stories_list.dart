import 'package:flutter/material.dart';

class StoriesList extends StatelessWidget {
  final int itemCount;
  final EdgeInsets? padding;
  final Widget Function(BuildContext, int) itemBuilder;
  const StoriesList({
    Key? key,
    this.padding,
    required this.itemCount,
    required this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: padding,
      scrollDirection: Axis.horizontal,
      itemBuilder: itemBuilder,
      separatorBuilder: (context, index) => const SizedBox(width: 15),
    );
  }
}
