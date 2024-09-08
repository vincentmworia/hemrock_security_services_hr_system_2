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
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: allEmployees.length,
        itemBuilder: (context, index) {
          Employee employee = Employee.fromMap(allEmployees[index]);
          return Card(
            elevation: 8.0,
            margin: EdgeInsets.symmetric(vertical: 12.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${employee.personalData.surName}, ${employee.personalData.otherNames}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Phone: ${employee.personalData.phoneNumber}',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Work Station: ${employee.officeDetails.workStation}',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Contract Type: ${employee.officeDetails.workStation}',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Gender: ${employee.personalData.gender}',
                    style: TextStyle(fontSize: 14),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
