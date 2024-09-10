import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hrsystem/models/drop_down_data.dart';
import 'package:hrsystem/screens/detailed_view/employees_page.dart';
import 'package:hrsystem/screens/template_screen.dart';
import 'package:http/http.dart' as http;

import '../main.dart';
import '../models/office_details.dart';
import '../models/employee.dart';

class EmployeePageGridView extends StatelessWidget {
  const EmployeePageGridView(
      {super.key,
      required this.sortOrder,
      required this.currentCategory,
      required this.searchData});

  final SortOrder sortOrder;
  final String currentCategory;
  final String searchData;

  // final List<Map<String, dynamic>> allEmployees;

  static const _url =
      'https://hemrock-hr-system-default-rtdb.europe-west1.firebasedatabase.app/.json';

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: http.get(Uri.parse(_url)),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: appPrimaryColor,
              ),
            );
          }
          if (snapshot.data == null) {
            return const Center(
              child: TemplateScreenView('No Internet  '),
            );
          }

          final jsonData = json.decode((snapshot.data as http.Response).body)
              as Map<String, dynamic>;

          var allEmployees = jsonData.entries.map((entry) {
            return {entry.key: entry.value};
          }).toList();

          // Reduce the list as per the searched string

          // Order by search value drop down
          allEmployees.sort((a, b) => (a.values.first['personalData']
                  ['otherNames'])
              .compareTo(b.values.first['personalData']['otherNames']));

          if (searchData.isNotEmpty || searchData != '') {
            // Search for maps where 'value' is present
            switch (currentCategory) {
              case DropDownData.payrollNumber:
                allEmployees = allEmployees
                    .where((map) =>
                        map.keys.first.toLowerCase().contains(searchData))
                    .toList();

              case DropDownData.surName:
                allEmployees = allEmployees
                    .where((map) =>
                        (map.values.first['personalData']['surName'] as String)
                            .toLowerCase()
                            .contains(searchData))
                    .toList();

              case DropDownData.otherNames:
                allEmployees = allEmployees
                    .where((map) => map
                        .values.first['personalData']['otherNames']
                        .toLowerCase()
                        .contains(searchData))
                    .toList();
              case DropDownData.workStation:
                allEmployees = allEmployees
                    .where((map) => map
                        .values.first['officeDetails']['workStation']
                        .toLowerCase()
                        .contains(searchData))
                    .toList();
              case DropDownData.positionTitle:
                allEmployees = allEmployees
                    .where((map) => map
                        .values.first['officeDetails']['positionTitle']
                        .toLowerCase()
                        .contains(searchData))
                    .toList();
            }
          }

          switch (currentCategory) {
            case DropDownData.payrollNumber:
              allEmployees.sort((a, b) => a.keys.first.compareTo(b.keys.first));
            case DropDownData.surName:
              allEmployees.sort((a, b) => (a.values.first['personalData']
                      ['surName'])
                  .compareTo(b.values.first['personalData']['surName']));
            case DropDownData.otherNames:
              allEmployees.sort((a, b) => (a.values.first['personalData']
                      ['otherNames'])
                  .compareTo(b.values.first['personalData']['otherNames']));
            case DropDownData.workStation:
              allEmployees.sort((a, b) => (a.values.first['officeDetails']
                      ['workStation'])
                  .compareTo(b.values.first['officeDetails']['workStation']));
            case DropDownData.positionTitle:
              allEmployees.sort((a, b) => (a.values.first['officeDetails']
                      ['positionTitle'])
                  .compareTo(b.values.first['officeDetails']['positionTitle']));
          }

          // Ascending or descending
          if (sortOrder == SortOrder.descending) {
            allEmployees = allEmployees.reversed.toList();
          }

          // todo sort list as per ascending / Descending, search box selection value,
          // todo Filter list as per the searched value. Just the list.

          return GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400.0,
                mainAxisExtent: 250,
                // childAspectRatio: 4.5 / 3,
                mainAxisSpacing: 50.0,
                crossAxisSpacing: 50.0),
            itemCount: allEmployees.length,
            itemBuilder: (context, index) {
              final employee =
                  Employee.fromMap(allEmployees[index]) as Employee;
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
                            : appSecondaryColor2,
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
                                    employee.personalData.otherNames!,
                                    style: const TextStyle(
                                        color: appSecondaryColor),
                                    overflow: TextOverflow.fade,
                                  ),
                                  Text(
                                    ' ${employee.personalData.surName!.toUpperCase()}',
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
        },
      );
}
