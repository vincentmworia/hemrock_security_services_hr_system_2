import 'package:flutter/material.dart';

import '../main.dart';

class EmployeePageGridView extends StatelessWidget {
  const EmployeePageGridView(this.items, {super.key});

  final List items;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 130.0,
          mainAxisSpacing: 50.0,
          crossAxisSpacing: 50.0),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(

            gradient:   LinearGradient(
              colors: [
                appPrimaryColor,
                appSecondaryColor2.withOpacity(0.85)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Text(
            (items[index] < 10)
                ? 'HHS00${items[index] + 1}'
                : 'HHS0${items[index] + 1}',
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        );
      },
    );
  }
}
