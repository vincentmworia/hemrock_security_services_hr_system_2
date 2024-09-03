import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class EmployeesPage extends StatelessWidget {
  const EmployeesPage({super.key});

  static List<String> items = List.generate(100, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(20.0)),
        child: LayoutBuilder(builder: (context, constraintsMainFrame) {
          return Column(
            children: <Widget>[
              Container(
                height: constraintsMainFrame.maxHeight * 0.2,
                width: constraintsMainFrame.maxWidth,
                color: Colors.white,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Row(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: constraints.maxHeight * 0.5,
                              width: constraints.maxWidth * 0.5,
                              // todo Note the title
                            ),
                            Container(
                              height: constraints.maxHeight * 0.5,
                              width: constraints.maxWidth * 0.5,
                              // todo Note the button

                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: constraints.maxHeight * 0.5,
                              width: constraints.maxWidth * 0.5,
                              color: Colors.yellow,
                            ),
                            Container(
                              height: constraints.maxHeight * 0.5,
                              width: constraints.maxWidth * 0.5,
                              color: Colors.brown,
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200.0,
                              mainAxisSpacing: 50.0,
                              crossAxisSpacing: 50.0),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: appSecondaryColor2,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text(
                            items[index],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          );
        }));
  }
}
