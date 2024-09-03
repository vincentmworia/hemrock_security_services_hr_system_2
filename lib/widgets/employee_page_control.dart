import 'package:flutter/material.dart';

import '../main.dart';
import './search_box.dart';

class EmployeePageControl extends StatelessWidget {
  const EmployeePageControl(this.deviceWidth, {super.key});

  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, top: 10.0,right: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                elevation: 3.0,
                fixedSize: const Size(200, 50),
                // backgroundColor: appPrimaryColor.withOpacity(0.9),
              ),
              icon: const Icon(
                Icons.add,
                // color: appSecondaryColor,
              ),
              onPressed: () {},
              label: const Text(
                'Add New Employee',
                style: TextStyle(
                  // color: appSecondaryColor,
                ),
              )),

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

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              Switch(value: false, onChanged: (state) {}),

              if (deviceWidth > 1100) const SearchBox(),
              if (deviceWidth > 1300)
                Center(
                  child: DropdownButton(
                      value: 'One',
                      items: <String>['One', 'Two', 'Three', 'Four']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (val) {
                        print(val.toString());
                      }),
                ),
              // todo sorting search
            ],
          ),
        ],
      ),
    );
  }
}
