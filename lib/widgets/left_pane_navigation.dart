import 'package:flutter/material.dart';

import '../screens/main_screen.dart';
import '../widgets/left_pane_icon_button.dart';

class LeftPaneNavigation extends StatefulWidget {
  const LeftPaneNavigation(
      {super.key,
      required this.extendPane,
      required this.extendPaneFactor,
      required this.leftPaneWidth,
      required this.animationContainerMilliseconds,
      required this.windowHeight,
      required this.activePage,
      required this.activatePage});

  final bool extendPane;
  final double extendPaneFactor;
  final double leftPaneWidth;
  final double windowHeight;
  final Duration animationContainerMilliseconds;
  final PageDisplay activePage;
  final void Function(PageDisplay) activatePage;

  @override
  State<LeftPaneNavigation> createState() => _LeftPaneNavigationState();
}

class _LeftPaneNavigationState extends State<LeftPaneNavigation> {
  var _visibleWidgets = true;
  static var _lockTransition = false;

  void _pTrigLogic() {
    if ((_visibleWidgets) && (widget.extendPane) && (!_lockTransition)) {
      setState(() {
        _visibleWidgets = false;
      });

      Future.delayed(const Duration(milliseconds: 300)).then((value) {
        setState(() {
          _visibleWidgets = true;
        });
      });
      _lockTransition = true;
    }
    if (_lockTransition && !widget.extendPane) {
      _lockTransition = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    _pTrigLogic();
    return AnimatedContainer(
      width: widget.extendPane
          ? widget.leftPaneWidth * widget.extendPaneFactor
          : widget.leftPaneWidth,
      height: widget.windowHeight * 0.9,
      duration: widget.animationContainerMilliseconds,
      child: Visibility(
        visible: _visibleWidgets,
        child: SingleChildScrollView(
          // physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LeftPaneIconButton(
                icon: Icons.home,
                titleText: 'Home',
                buttonActive: widget.activePage == PageDisplay.home,
                extendPane: widget.extendPane,
                buttonPage: PageDisplay.home,
                activatePage: widget.activatePage,
              ),
              LeftPaneIconButton(
                icon: Icons.people,
                titleText: 'Staff',
                buttonActive: widget.activePage == PageDisplay.employees,
                extendPane: widget.extendPane,
                buttonPage: PageDisplay.employees,
                activatePage: widget.activatePage,
              ),
              LeftPaneIconButton(
                icon: Icons.money,
                titleText: 'Payroll',
                buttonActive: widget.activePage == PageDisplay.payroll,
                buttonPage: PageDisplay.payroll,
                activatePage: widget.activatePage,
                extendPane: widget.extendPane,
              ),
              LeftPaneIconButton(
                icon: Icons.lock,
                titleText: 'Profile',
                buttonActive: widget.activePage == PageDisplay.profile,
                extendPane: widget.extendPane,
                buttonPage: PageDisplay.profile,
                activatePage: widget.activatePage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
