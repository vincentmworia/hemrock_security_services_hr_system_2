import 'package:flutter/material.dart';

import 'package:hrsystem/widgets/add_employee_category_template.dart';
import 'package:hrsystem/widgets/add_employee_office_data.dart';
import 'package:hrsystem/widgets/add_employee_payment_details.dart';
import 'package:hrsystem/widgets/add_employee_personal_data.dart';
import '../../main.dart';
import '../../widgets/custom_input_field.dart';

class AddEmployeePage extends StatefulWidget {
  const AddEmployeePage({super.key});

  // final int currentStep;
  // final Station stationName;
  // final Workpiece workpiece;

  // int get stepCurrent => 250 + (60 * currentStep);
  static const _spacing = SizedBox(width: 20);

  @override
  State<AddEmployeePage> createState() => _AddEmployeePageState();
}

class _AddEmployeePageState extends State<AddEmployeePage> {
  var _personalIconReady = 0;

  _switchPersonalDataIcon(int toSwitch) {
    setState(() {
      _personalIconReady = toSwitch;
    });
  }

  var _officeIconReady = 0;

  _switchOfficeDataIcon(int toSwitch) {
    setState(() {
      _officeIconReady = toSwitch;
    });
  }

  var _paymentDetailsIconReady = 0;

  _switchPaymentDetailsIcon(int toSwitch) {
    setState(() {
      _paymentDetailsIconReady = toSwitch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        child: Container(
          color: Colors.white.withOpacity(0.75),
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
                  child: SizedBox(
                    width: double.infinity,
                    // color: Colors.red,
                    child: Column(
                      children: [
                        AddEmployeeCategoryTemplate(
                            maxWidth: cons.maxWidth,
                            title: 'Personal Details',
                            containerHeight: 650,
                            isReady: _personalIconReady,
                            child: AddEmployeePersonalData(
                              switchIcon: _switchPersonalDataIcon,
                            )),
                        AddEmployeePage._spacing,
                        AddEmployeeCategoryTemplate(
                          maxWidth: cons.maxWidth,
                          title: 'Office Details',
                          containerHeight: 400,
                          isReady: _officeIconReady,
                          child: AddEmployeeOfficeData(
                              switchIcon: _switchOfficeDataIcon),
                        ),
                        AddEmployeePage._spacing,
                        AddEmployeeCategoryTemplate(
                            maxWidth: cons.maxWidth,
                            title: 'Payment Details',
                            containerHeight: 500,
                            isReady: _paymentDetailsIconReady,
                            child: AddEmployeePaymentDetails(
                                switchIcon: _switchPaymentDetailsIcon)),
                        AddEmployeePage._spacing,
                        AddEmployeeCategoryTemplate(
                          maxWidth: cons.maxWidth,
                          title: 'Witness Details',
                          containerHeight: 350,
                          isReady: 1,
                          child: Center(),
                        ),
                        AddEmployeePage._spacing
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        ));
  }
}
