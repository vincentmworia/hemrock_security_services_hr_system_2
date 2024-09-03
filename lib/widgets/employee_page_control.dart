import 'package:flutter/material.dart';

import '../main.dart';
import './search_box.dart';

class EmployeePageControl extends StatelessWidget {
  const EmployeePageControl(this.deviceWidth, {super.key});

  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    print(deviceWidth);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 20.0),
      child: Row(
        children: [
          const Text(
            'Company Employees',
            style: TextStyle(
              fontSize: 30.0,
              color: appSecondaryColor2,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Switch(value: false, onChanged: (state) {}),
                if(deviceWidth>1100)
                const SearchBox(),
                // todo sorting search
                ElevatedButton.icon(
                    icon: const Icon(Icons.add),
                    onPressed: () {},
                    label: const Text('Add New Employee')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
