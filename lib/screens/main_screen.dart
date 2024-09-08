import 'package:flutter/material.dart';
import 'package:hrsystem/dummy_data.dart';
import 'package:hrsystem/providers/employees_provider.dart';
import 'package:hrsystem/screens/template_screen.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../widgets/left_pane_navigation.dart';
import '../widgets/main_screen_title.dart';
import './detailed_view/employees_page.dart';
import './detailed_view/home_page.dart';
import './detailed_view/payroll_page.dart';
import './detailed_view/profile_page.dart';
import 'detailed_view/add_employee_page.dart';

enum PageDisplay {
  home,
  employees,
  addEmployee,
  payroll,
  profile,
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static const animationContainerMilliseconds = Duration(milliseconds: 300);
  static const extendPaneFactor = 2.5;

  var _extendPane = false;
  var _currentPage = PageDisplay.employees;

  void windowIconPressed() {
    setState(() {
      _extendPane = !_extendPane;
    });
  }



  void _switchCurrentPage(PageDisplay activePg) {
    setState(() {
      _currentPage = activePg;
      _extendPane = false;
    });
  }

  Widget _currentPageToDisplay(PageDisplay pg) {
    switch (pg) {
      case PageDisplay.home:
        return const HomePage();
      case PageDisplay.employees:
        return EmployeesPage(switchCurrentPage: _switchCurrentPage);
      case PageDisplay.addEmployee:
        return const AddEmployeePage();
      case PageDisplay.payroll:
        return const PayrollPage();
      case PageDisplay.profile:
        return const ProfilePage();
      default:
        return const HomePage();
    }
  }

  void _testApi() {}

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final windowWidth = mediaQuery.size.width;
    final windowHeight = (mediaQuery.size.height - mediaQuery.padding.top);

    final leftPaneWidth = (windowWidth < 1500 ? 1500 : windowWidth) * 0.05;

    return Scaffold(
      backgroundColor: appPrimaryColor,
      body: SizedBox(
        width: windowWidth,
        height: windowHeight,
        child: Column(
          children: [
            MainScreenTitle(
              leftPaneWidth: leftPaneWidth,
              windowHeight: windowHeight,
              animationContainerDuration: animationContainerMilliseconds,
              extendPane: _extendPane,
              windowIconPressed: windowIconPressed,
              windowWidth: windowWidth,
              extendPaneFactor: extendPaneFactor,
              switchCurrentPage: _switchCurrentPage,
              currentPage: _currentPage,
            ),
            Expanded(
              child: Row(
                children: [
                  if (!(_currentPage == PageDisplay.addEmployee))
                    LeftPaneNavigation(
                        extendPane: _extendPane,
                        extendPaneFactor: extendPaneFactor,
                        leftPaneWidth: leftPaneWidth,
                        animationContainerMilliseconds:
                            animationContainerMilliseconds,
                        windowHeight: windowHeight,
                        activePage: _currentPage,
                        activatePage: _switchCurrentPage),
                  Expanded(
                    child: ChangeNotifierProvider(
                        create: (context) => EmployeesHandler(),
                        child: _currentPageToDisplay(_currentPage)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
