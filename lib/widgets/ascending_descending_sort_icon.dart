import 'package:flutter/material.dart';
import 'package:hrsystem/main.dart';

import '../screens/detailed_view/employees_page.dart';

class AscendingDescendingSortIcon extends StatelessWidget {
  const AscendingDescendingSortIcon(
      {super.key, required this.sort, required this.switchSort});

  final SortOrder sort;
  final void Function(SortOrder) switchSort;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: IconButton(
        onPressed: () => switchSort(sort == SortOrder.ascending
            ? SortOrder.descending
            : SortOrder.ascending),
        icon: Icon(
          sort == SortOrder.ascending
              ? Icons.arrow_upward_sharp
              : Icons.arrow_downward,
          size: 30.0,
          color: appSecondaryColor2,
        ),
      ),
    );
  }
}
