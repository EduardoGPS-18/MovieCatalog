import 'package:flutter/material.dart';

class TitleDetail extends StatelessWidget {
  final String title;
  final EdgeInsetsGeometry margin;
  const TitleDetail({
    Key? key,
    required this.title,
    required this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16),
      alignment: Alignment.topLeft,
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 24),
      ),
      margin: margin,
    );
  }
}
