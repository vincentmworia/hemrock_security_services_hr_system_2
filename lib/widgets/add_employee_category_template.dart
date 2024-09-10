import 'package:flutter/material.dart';

import '../main.dart';

class AddEmployeeCategoryTemplate extends StatelessWidget {
  const AddEmployeeCategoryTemplate(
      {super.key,
      required this.maxWidth,
      required this.title,
      required this.child});

  final double maxWidth;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        elevation: 5,
        color: Colors.white.withOpacity(0.95),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          height: 450,
          width: maxWidth * 0.475,
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
                  mainAxisAlignment: MainAxisAlignment.end,
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
                    const Icon(Icons.check_box),
                    // Icon(Icons.indeterminate_check_box),
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
