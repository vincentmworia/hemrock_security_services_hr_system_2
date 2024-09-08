import 'package:flutter/cupertino.dart';

import '../dummy_data.dart';

class EmployeesHandler with ChangeNotifier {
  List<Map<String, dynamic>> allEmployees = [];

  void getAllEmployees() {
    allEmployees = dataInDatabase.entries.map((entry) {
      return {entry.key: entry.value};
    }).toList();

    // notifyListeners();
  }
}
