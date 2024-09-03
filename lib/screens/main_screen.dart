import 'package:flutter/material.dart';

import '../main.dart';
import '../widgets/left_pane_navigation.dart';
import '../widgets/main_screen_title.dart';
import './detailed_view/employees_page.dart';
import './detailed_view/home_page.dart';
import './detailed_view/payroll_page.dart';
import './detailed_view/profile_page.dart';

enum PageDisplay {
  home,
  employees,
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

  void _paneButtonPressed(PageDisplay activePg) {
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
        return const EmployeesPage();
      case PageDisplay.payroll:
        return const PayrollPage();
      case PageDisplay.profile:
        return const ProfilePage();
      default:
        return const HomePage();
    }
  }

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
            ),
            Expanded(
              child: Row(
                children: [
                  LeftPaneNavigation(
                      extendPane: _extendPane,
                      extendPaneFactor: extendPaneFactor,
                      leftPaneWidth: leftPaneWidth,
                      animationContainerMilliseconds:
                          animationContainerMilliseconds,
                      windowHeight: windowHeight,
                      activePage: _currentPage,
                      activatePage: _paneButtonPressed),
                  Expanded(
                    child: _currentPageToDisplay(_currentPage),
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
