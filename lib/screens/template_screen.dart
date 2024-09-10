import 'package:flutter/material.dart';

import '../main.dart';

class TemplateScreenView extends StatelessWidget {
  const TemplateScreenView(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
        ),
        color: Colors.white,
      ),
      child: Center(
        child: Text(
          '$title',
          style: const TextStyle(
            color: appSecondaryColor,
            fontSize: 30.0,
            letterSpacing: 18.0,
          ),
        ),
      ),
      // width: windowWidth * 0.1,
    );
  }
}
