import 'package:flutter/material.dart';

import '../main.dart';

class AddEmployeeCategoryTemplate extends StatelessWidget {
  const AddEmployeeCategoryTemplate(
      {super.key,
      required this.maxWidth,
      required this.title,
      required this.child,
      required this.containerHeight,
      required this.isReady});

  final double containerHeight;
  final double maxWidth;
  final String title;
  final Widget child;
  final int isReady;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        elevation: 10,
        color: Colors.white.withOpacity(0.9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          height: containerHeight,
          width: 1000,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      // todo differentHere
                      title,
                      style: const TextStyle(
                        fontSize: 24.0,
                        color: appPrimaryColor,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 3.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    // todo differentHere
                    if (isReady > 0)
                      Icon(
                        Icons.check_box,
                        color: isReady == 1
                            ? appSecondaryColor
                            : appSecondaryColor2,
                      ),
                    if (isReady == 0)
                      const Icon(
                        Icons.indeterminate_check_box,
                        color: appPrimaryColor,
                      ),
                  ],
                ),
              ),
              const Divider(
                color: appPrimaryColor,
                height: 1,
              ),
              Expanded(
                // todo differentHere
                child: child,
              )
            ],
          ),
        ),
      ),
    );
  }
}
