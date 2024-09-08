import 'package:flutter/material.dart';

import '../main.dart';
import '../models/office_details.dart';
import '../models/employee.dart';

class EmployeePageGridView extends StatelessWidget {
  const EmployeePageGridView(this.allEmployees, {super.key});

  final List<Map<String, dynamic>> allEmployees;

  @override
  Widget build(BuildContext context) => GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 400.0,
            mainAxisExtent: 250,
            // childAspectRatio: 4.5 / 3,
            mainAxisSpacing: 50.0,
            crossAxisSpacing: 50.0),
        itemCount: allEmployees.length,
        itemBuilder: (context, index) {
          Employee employee = Employee.fromMap(allEmployees[index]);
          return Card(
            elevation: 12,
            color: appPrimaryColor.withOpacity(0.85),
            shadowColor: appSecondaryColor2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              decoration: BoxDecoration(
                border: Border.all(
                    color: employee.pendingData
                        ? appSecondaryColor
                        : appSecondaryColor,
                    width: 5.0),
                gradient: LinearGradient(
                  colors: [
                    // Colors.blueGrey.withOpacity(0.1),
                    appSecondaryColor2.withOpacity(0.3),
                    appPrimaryColor.withOpacity(0.3),
                    appPrimaryColor.withOpacity(0.6),
                    appPrimaryColor.withOpacity(0.3),
                    appSecondaryColor2.withOpacity(0.2),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(
                children: [
                  const Spacer(),
                  Text(
                    employee.payrollNumber,
                    style: const TextStyle(
                        color: appSecondaryColor,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3.0,
                        fontSize: 18.0),
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTile(
                        leading: const Icon(
                          Icons.person,
                          size: 25.0,
                          color: appSecondaryColor2,
                        ),
                        title: SizedBox(
                          width: double.infinity,
                          child: Wrap(
                            // alignment: WrapAlignment.spaceBetween,
                            children: [
                              Text(
                                employee.personalData.otherNames,
                                style:
                                    const TextStyle(color: appSecondaryColor),
                                overflow: TextOverflow.fade,
                              ),
                              Text(
                                ' ${employee.personalData.surName.toUpperCase()}',
                                style: const TextStyle(
                                  color: appSecondaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.phone,
                          size: 25.0,
                          color: appSecondaryColor2,
                        ),
                        title: Text(
                          '0${employee.personalData.phoneNumber.toString()}',
                          style: const TextStyle(color: appSecondaryColor),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.house_siding,
                          size: 25.0,
                          color: appSecondaryColor2,
                        ),
                        title: Text(
                          employee.officeDetails.workStation,
                          style: const TextStyle(color: appSecondaryColor),
                        ),
                        trailing: Text(
                          getPositionTitleString(
                              employee.officeDetails.positionTitle),
                          style: const TextStyle(color: appSecondaryColor2),
                        ),
                      ),
                    ],
                  ),
                  ...[1, 2, 3, 4].map((_) => const Spacer())
                ],
              ),
            ),
          );
        },
      );
}
