import 'dart:io';

import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  final String? text;
  final File? image;
  const CustomCircleAvatar({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: image != null ? null : Colors.black12,
      backgroundImage: image != null ? Image.file(image!).image : null,
      child: Center(
        child: Text(
          text ?? "",
          style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ),
      radius: 54,
    );
  }
}
