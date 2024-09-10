import 'package:flutter/material.dart';

import 'package:hrsystem/models/office_details.dart';
import 'package:hrsystem/models/personal_data.dart';
import 'package:hrsystem/providers/employees_provider.dart';
import 'package:hrsystem/screens/template_screen.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../models/employee.dart';

class EmployeePageListView extends StatelessWidget {
  const EmployeePageListView(this.allEmployees, {super.key});

  final List<Map<String, dynamic>> allEmployees;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: allEmployees.length,
        itemBuilder: (context, index) {
          Employee employee = Employee.fromMap(allEmployees[index]);
          return Card(
              elevation: 2.0,
              // color: appPrimaryColor,
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                      color: employee.pendingData
                          ? appSecondaryColor
                          : appSecondaryColor,
                      width: 5.0),
                  gradient: LinearGradient(
                    colors: [
                      appPrimaryColor.withOpacity(1),
                      appPrimaryColor.withOpacity(0.9),
                      appPrimaryColor.withOpacity(0.8),
                      appPrimaryColor.withOpacity(0.7),
                      // appSecondaryColor2.withOpacity(0.9),
                      appSecondaryColor2.withOpacity(1),

                      appSecondaryColor.withOpacity(0.9),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: appSecondaryColor2,
                      child: Center(
                        child: Text(
                          employee.personalData.surName![0],
                          style:
                              TextStyle(color: appPrimaryColor, fontSize: 22.0),
                        ),
                      ),
                      // radius: 20,
                    ),
                    title: Text(
                      '${employee.personalData.surName!.toUpperCase()}, ${employee.personalData.otherNames}',
                      style: TextStyle(
                        color: appSecondaryColor,
                      ),
                    ),
                    subtitle: Text(
                      employee.payrollNumber,
                      style: TextStyle(
                        color: appSecondaryColor,letterSpacing: 3.0
                      ),
                    ),
                    trailing: Text(
                      '${employee.officeDetails.workStation} - ${getPositionTitleString(employee.officeDetails.positionTitle)}',
                      style: TextStyle(
                        color: appPrimaryColor,
                        fontSize: 18
                      ),
                    ),
                  ),
                ),
              )
              // Padding(
              //   padding: const EdgeInsets.all(16.0),
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         '${employee.personalData.surName}, ${employee.personalData.otherNames}',
              //         style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //           fontSize: 18,
              //         ),
              //       ),
              //       SizedBox(height: 8),
              //       Text(
              //         'Phone: ${employee.personalData.phoneNumber}',
              //         style: TextStyle(fontSize: 14),
              //       ),
              //       SizedBox(height: 4),
              //       Text(
              //         'Work Station: ${employee.officeDetails.workStation}',
              //         style: TextStyle(fontSize: 14),
              //       ),
              //       SizedBox(height: 4),
              //       Text(
              //         'Contract Type: ${employee.officeDetails.workStation}',
              //         style: TextStyle(fontSize: 14),
              //       ),
              //       SizedBox(height: 4),
              //       Text(
              //         'Gender: ${employee.personalData.gender}',
              //         style: TextStyle(fontSize: 14),
              //       ),
              //
              //     ],
              //   ),
              // ),
              );
        },
      ),
    );
  }
}
