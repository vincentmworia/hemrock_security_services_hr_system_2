import 'package:flutter/material.dart';

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
  });

  final double leftPaneWidth;
  final double windowWidth;
  final double windowHeight;
  final Duration animationContainerDuration;
  final void Function() windowIconPressed;
  final bool extendPane;
  final double extendPaneFactor;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          AnimatedContainer(
            width:
                extendPane ? leftPaneWidth * extendPaneFactor : leftPaneWidth,
            duration: animationContainerDuration,
            child: IconButton(
              icon: Icon(
                extendPane ? Icons.arrow_back : Icons.menu,
                size: 30,
                color: extendPane ? appBrightSecondaryColor : appSecondaryColor,
              ),
              onPressed: windowIconPressed,
              splashColor: appSecondaryColor2.withOpacity(0.3),
              highlightColor: appSecondaryColor2.withOpacity(0.3),
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
                      fontSize: 30.0,
                      color: appSecondaryColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 7.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                if(windowWidth > 300 && windowHeight > 250)
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
