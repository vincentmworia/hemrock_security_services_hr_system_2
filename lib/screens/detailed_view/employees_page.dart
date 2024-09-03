import 'package:flutter/material.dart';

import '../../widgets/employee_page_control.dart';
import '../../widgets/employee_page_grid_view.dart';

class EmployeesPage extends StatelessWidget {
  const EmployeesPage({super.key});

  static List<String> items = List.generate(30, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final deviceHeight = mediaQuery.size.height - mediaQuery.padding.top;
    final deviceWidth = mediaQuery.size.width;

    return ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(20.0)),
        child: Container(
          color: Colors.white,
          child: (deviceWidth < 1000 || deviceHeight < 500)
              ? const Center()
              : Column(
                  children: <Widget>[
                    EmployeePageControl(deviceWidth),
                    const Divider(),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: EmployeePageGridView(items),
                      ),
                    )
                  ],
                ),
        ));
  }
}
