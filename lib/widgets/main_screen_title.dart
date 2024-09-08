import 'package:flutter/material.dart';
import 'package:hrsystem/screens/main_screen.dart';

import '../main.dart';

class MainScreenTitle extends StatelessWidget {
  const MainScreenTitle({
    super.key,
    required this.leftPaneWidth,
    required this.windowWidth,
    required this.windowHeight,
    required this.animationContainerDuration,
    required this.extendPane,
    required this.windowIconPressed,
    required this.extendPaneFactor,
    required this.switchCurrentPage,
    required this.currentPage,
  });

  final double leftPaneWidth;
  final double windowWidth;
  final double windowHeight;
  final Duration animationContainerDuration;
  final void Function() windowIconPressed;
  final void Function(PageDisplay) switchCurrentPage;
  final bool extendPane;
  final double extendPaneFactor;
  final PageDisplay currentPage;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          AnimatedContainer(
            width:
                extendPane ? leftPaneWidth * extendPaneFactor : leftPaneWidth,
            duration: animationContainerDuration,
            child: IconButton(
              icon: Icon(
                (extendPane || (currentPage == PageDisplay.addEmployee))
                    ? Icons.arrow_back
                    : Icons.menu,
                size: 30,
                color: extendPane ? appBrightSecondaryColor : appSecondaryColor,
              ),
              onPressed: (currentPage == PageDisplay.addEmployee)
                  ? () {
                switchCurrentPage(PageDisplay.employees);
              }
                  : windowIconPressed,
              // splashColor: appSecondaryColor.withOpacity(0.3),
              // highlightColor: appSecondaryColor.withOpacity(0.3),
            ),
          ),
          Expanded(
              child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 5.0,
              bottom: 5.0,
            ),
            child: Row(
              mainAxisAlignment: (windowWidth > 800 && windowHeight > 500)
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (windowWidth > 800 && windowHeight > 500)
                  const Text(
                    'Hemrock Security Services',
                    style: TextStyle(
                      fontSize: 25.0,
                      color: appSecondaryColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 7.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                if (windowWidth > 300 && windowHeight > 250)
                  Image.asset(
                    logoImage,
                    width: windowWidth * 0.1,
                    height: windowHeight * 0.1,
                    fit: BoxFit.contain,
                  ),
              ],
            ),
          )),
        ],
      );
}
