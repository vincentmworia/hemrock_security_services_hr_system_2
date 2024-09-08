import 'package:flutter/material.dart';

class AddEmployeePage extends StatelessWidget {
  const AddEmployeePage({super.key});

  // final int currentStep;
  // final Station stationName;
  // final Workpiece workpiece;

  // int get stepCurrent => 250 + (60 * currentStep);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        child: Container(
          color: Colors.white,
        ));
  }
}
