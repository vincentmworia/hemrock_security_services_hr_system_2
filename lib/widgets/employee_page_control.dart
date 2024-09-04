import 'package:flutter/material.dart';

import '../../screens/main_screen.dart';
import '../screens/detailed_view/employees_page.dart';
import '../widgets/grid_list_switch.dart';
import '../main.dart';
import './search_box.dart';
import './select_drop_down.dart';

class EmployeePageControl extends StatelessWidget {
  const EmployeePageControl({
    super.key,
    required this.deviceWidth,
    required this.view,
    required this.switchDisplayStyle,
    required this.switchSort,
    required this.sort,
    required this.addEmployeeBn,
  });

  final double deviceWidth;
  final ViewData view;
  final SortOrder sort;
  final void Function(PageDisplay) addEmployeeBn;
  final void Function(ViewData) switchDisplayStyle;
  final void Function(SortOrder) switchSort;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, top: 10.0, bottom: 10.0, right: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  elevation: 5.0,
                  fixedSize: const Size(200, 50),
                  backgroundColor: appSecondaryColor),
              icon: const Icon(
                Icons.add,
                color: appPrimaryColor,
              ),
              onPressed: () => addEmployeeBn(PageDisplay.addEmployee),
              label: const Text(
                'Add New Employee',
                style: TextStyle(
                  color: appPrimaryColor,
                ),
              )),
          const Text(
            'Staff Members',
            style: TextStyle(
              fontSize: 30.0,
              color: appPrimaryColor,
              fontWeight: FontWeight.w700,
              letterSpacing: 3.0,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  GridListSwitch(
                    deviceWidth: deviceWidth,
                    title: 'Grid',
                    active: view == ViewData.grid,
                    currentView: ViewData.grid,
                    switchDisplayStyle: switchDisplayStyle,
                  ),
                  GridListSwitch(
                    deviceWidth: deviceWidth,
                    title: 'List',
                    active: view == ViewData.list,
                    currentView: ViewData.grid,
                    switchDisplayStyle: switchDisplayStyle,
                  ),
                ],
              ),
              if (deviceWidth > 1200) const SearchBox(),
              if (deviceWidth > 1300) const SelectDropDown(),
              const SizedBox(
                width: 10.0,
              ),
              IconButton(
                onPressed: () => switchSort(
                    sort == SortOrder.ascending ? SortOrder.descending : SortOrder.ascending),
                icon: Icon(
                  sort == SortOrder.ascending
                      ? Icons.arrow_upward_sharp
                      : Icons.arrow_downward,
                  size: 30.0,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
