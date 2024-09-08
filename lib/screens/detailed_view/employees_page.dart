import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hrsystem/providers/employees_provider.dart';
import 'package:hrsystem/widgets/employee_page_list_view.dart';
import 'package:provider/provider.dart';

import '../../widgets/employee_page_control.dart';
import '../../widgets/employee_page_grid_view.dart';
import '../../widgets/select_drop_down.dart';
import '../main_screen.dart';
import '../template_screen.dart';

enum ViewData {
  asGrid,
  asList,
}

enum SortOrder {
  ascending,
  descending,
}

enum SortCategory {
  payroll,
  surname,
  otherNames,
}

class EmployeesPage extends StatefulWidget {
  const EmployeesPage({super.key, required this.switchCurrentPage});

  final void Function(PageDisplay) switchCurrentPage;

  @override
  State<EmployeesPage> createState() => _EmployeesPageState();
}

class _EmployeesPageState extends State<EmployeesPage> {
  static List<int> items = List.generate(2, (index) => index);

  ViewData _view = ViewData.asGrid;

  String? _searchedText = '';
  String _currentCategory = SelectDropDown.defaultCategory;

  SortOrder _sort = SortOrder.ascending;

  Widget _displayEmployees(ViewData v) {
    return Consumer<EmployeesHandler>(
        builder: (BuildContext context, item, Widget? child) {
      item.getAllEmployees();
      final allEmployeesData = item.allEmployees;

      switch (v) {
        case ViewData.asGrid:
          return EmployeePageGridView(allEmployeesData);

        case ViewData.asList:
          return TemplateScreenView('List View');
          // return EmployeePageListView(allEmployeesData);
        default:
          return EmployeePageGridView(allEmployeesData);
      }
    });
  }

  void _switchDisplayStyle(ViewData v) {
    setState(() {
      _view = v;
    });
  }

  void _switchSorting(SortOrder s) {
    setState(() {
      _sort = s;
    });
  }

  void _updateSearchedText(String text) {
    setState(() {
      _searchedText = text;
      if (kDebugMode) {
        print(_searchedText);
      }
    });
  }

  void _switchCurrentSearchCategory(String text) {
    setState(() {
      _currentCategory = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final deviceHeight = mediaQuery.size.height - mediaQuery.padding.top;
    final deviceWidth = mediaQuery.size.width;

    return ClipRRect(
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(20.0)),
      child: Container(
        color: Colors.white,
        child: (deviceWidth < 1250 || deviceHeight < 500)
            ? const Center()
            : Column(
                children: <Widget>[
                  EmployeePageControl(
                    deviceWidth: deviceWidth,
                    view: _view,
                    switchDisplayStyle: _switchDisplayStyle,
                    sort: _sort,
                    switchSort: _switchSorting,
                    switchCurrentPage: widget.switchCurrentPage,
                    updateSearchedText: _updateSearchedText,
                    searchCategory: _currentCategory,
                    switchCurrentSearchCategory: _switchCurrentSearchCategory,
                  ),
                  const Divider(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: _displayEmployees(_view),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
