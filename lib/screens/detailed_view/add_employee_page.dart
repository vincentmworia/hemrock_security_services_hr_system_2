import 'package:flutter/material.dart';
import 'package:hrsystem/widgets/add_employee_category_template.dart';
import 'package:hrsystem/widgets/add_employee_personal_data.dart';

import '../../main.dart';
import '../../widgets/custom_input_field.dart';

class AddEmployeePage extends StatelessWidget {
  const AddEmployeePage({super.key});

  // final int currentStep;
  // final Station stationName;
  // final Workpiece workpiece;

  // int get stepCurrent => 250 + (60 * currentStep);
  static const _spacing = SizedBox(width: 20);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        child: Container(
          color: Colors.white.withOpacity(0.5),
          // color: appSecondaryColor2.withOpacity(0.5),
          padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                logoImage,
                // width: windowWidth * 0.1,
                // height: windowHeight * 0.1,
                fit: BoxFit.contain,
              ),
              // Container(width: double.infinity,height: double.infinity,color: Colors.white.withOpacity(0.5),),
              LayoutBuilder(builder: (context, cons) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Wrap(
                        children: [
                          AddEmployeeCategoryTemplate(
                              maxWidth: cons.maxWidth,
                              title: 'Personal Details',
                              child: const AddEmployeePersonalData()),
                          _spacing,
                          AddEmployeeCategoryTemplate(
                              maxWidth: cons.maxWidth,
                              title: 'Office Details',
                              child: Center()),
                          _spacing,
                          AddEmployeeCategoryTemplate(
                              maxWidth: cons.maxWidth,
                              title: 'Payment Details',
                              child: Center()),
                          _spacing,
                          AddEmployeeCategoryTemplate(
                            maxWidth: cons.maxWidth,
                            title: 'Witness Details',
                            child: Center(),
                          ),
                          _spacing
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ));
  }
}
