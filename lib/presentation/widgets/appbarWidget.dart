// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MainAppbar extends StatelessWidget {
  final String? title;
  const MainAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      elevation: 0,
      centerTitle: true,
      title: Text(
        title.toString(),
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
