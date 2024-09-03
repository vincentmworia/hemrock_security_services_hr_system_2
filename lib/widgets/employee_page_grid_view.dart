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
          maxCrossAxisExtent: 150.0,
          mainAxisSpacing: 50.0,
          crossAxisSpacing: 50.0),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: appSecondaryColor2.withOpacity(0.8),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text(
            items[index],
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        );
      },
    );
  }
}
