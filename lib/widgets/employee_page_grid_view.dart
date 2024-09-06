import 'package:flutter/material.dart';
import 'package:hrsystem/dummy_data.dart';
import 'package:hrsystem/providers/employees_provider.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class EmployeePageGridView extends StatelessWidget {
  const EmployeePageGridView({super.key});

  // final List items;

  @override
  Widget build(BuildContext context) {
    return Consumer<EmployeesHandler>(
      builder: (BuildContext context, item, Widget? child) {
        List<Map<String, dynamic>> mapToList =
            dataInDatabase.entries.map((entry) {
          return {entry.key: entry.value};
        }).toList();

        // todo Convert to list or handle the map as it is?
        print(mapToList);
        return GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 130.0,
              mainAxisSpacing: 50.0,
              crossAxisSpacing: 50.0),
          itemCount: mapToList.length,
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
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
                mapToList[index].keys.first,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            );
          },
        );
      },
    );
  }
}
