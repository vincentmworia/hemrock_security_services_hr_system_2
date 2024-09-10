import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hrsystem/main.dart';

import 'package:http/http.dart' as http;
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
  final List<Map<String, dynamic>> allEmployees = [];

  var _isLoading = false;

  ViewData _view = ViewData.asGrid;

  String? _searchedText = '';
  String _currentCategory = SelectDropDown.defaultCategory;

  SortOrder _sort = SortOrder.ascending;

  // Widget _displayEmployees(ViewData v) {
  //   // setState(() {
  //   //   _isLoading = true;
  //   // });
  //
  //   return;
  //
  //
  // }

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
                      padding: const EdgeInsets.only(
                          left: 30.0, right: 30.0, top: 10.0, bottom: 5.0),
                      child: EmployeePageGridView(
                        sortOrder: _sort,
                        currentCategory: _currentCategory,
                        searchData: _searchedText?.toLowerCase() ?? '',
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
