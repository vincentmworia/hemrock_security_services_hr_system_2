import 'package:flutter/material.dart';
import 'package:hrsystem/screens/detailed_view/employees_page.dart';

import '../main.dart';

class GridListSwitch extends StatelessWidget {
  const GridListSwitch({
    super.key,
    required this.deviceWidth,
    required this.title,
    required this.active,
    required this.currentView,
    required this.switchDisplayStyle,
  });

  final String title;
  final bool active;
  final double deviceWidth;
  final ViewData currentView;
  final void Function(ViewData) switchDisplayStyle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        switchDisplayStyle(title == 'Grid' ? ViewData.grid : ViewData.list);
      },
      child: Container(
        width: deviceWidth * 0.05,
        height: 45,
        decoration: BoxDecoration(
          color: appPrimaryColor.withOpacity(active ? 1.0 : 0),
          border: Border.all(
            width: 2.0,
            color: active ? appPrimaryColor : appPrimaryColor.withOpacity(0.5),
          ),
          borderRadius: title == 'Grid'
              ? const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0))
              : const BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0)),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: active
                    ? appSecondaryColor
                    : appPrimaryColor.withOpacity(0.2),
                fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
