import 'package:flutter/material.dart';
import 'package:hrsystem/models/office_details.dart';

import '../models/personal_data.dart';
import 'package:intl/intl.dart';
import '../main.dart';
import 'custom_input_field.dart';

class AddEmployeeOfficeData extends StatefulWidget {
  const AddEmployeeOfficeData({super.key, required this.switchIcon});

  final void Function(int toSwitch) switchIcon;

  @override
  State<AddEmployeeOfficeData> createState() => _AddEmployeePersonalDataState();
}

class _AddEmployeePersonalDataState extends State<AddEmployeeOfficeData> {
  final _formKey = GlobalKey<FormState>();

  SnackBar _snackBar(String message) => SnackBar(
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            message,
            style: const TextStyle(color: appPrimaryColor, fontSize: 18),
          ),
        ),
        backgroundColor: appSecondaryColor.withOpacity(0.5),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 2000),
      );

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // print(_selectedDate);
      if (_dateOfHire == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(_snackBar('Select the date of birth'));
      }
      if (_dateOfHire != null) {
        // If all fields are valid, save the form
        _formKey.currentState!.save();
        // _personalData.gender = getGenderEnum(_selectedGender);
        // _personalData.dateOfBirth = _selectedDate;
        //
        // print(_personalData.toMap());
        //
        // widget.switchIcon(_personalData.hasNullValue ? 1 : 2);

        ScaffoldMessenger.of(context)
            .showSnackBar(_snackBar('Personal Data is okay'));
      }
    }
  }

  final _payrollNumberController = TextEditingController();
  final _workstationController = TextEditingController();
  final _employeePeriodInMonthsController = TextEditingController();

  final _officeDetails = OfficeDetails();

  DateTime? _dateOfHire;

  String? _payrollNumber;

  //  todo dropdown of position title that will be validated

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _payrollNumberController.dispose();
    _workstationController.dispose();
  }

  // Function to show the DatePicker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Default to today's date
      firstDate: DateTime(2016), // Earliest date available
      lastDate: DateTime.now(), // Latest date available
    );
    if (pickedDate != null && pickedDate != _dateOfHire) {
      setState(() {
        _dateOfHire = pickedDate;
      });
    }
  }

  // Function to format the selected DateTime
  String _formatDateTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('yMMMd');
    return formatter.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    // print(_selectedDate.toString());
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: LayoutBuilder(builder: (context, cons) {
          return Column(children: [
            Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  CustomInputField(
                    controller: _payrollNumberController,
                    inputWidth: cons.maxWidth * 0.25,
                    autoCorrect: false,
                    enabled: true,
                    enableSuggestions: false,
                    labelText: 'Payroll Number',
                    icon: Icons.business,
                    keyboardType: TextInputType.name,
                    obscureText: false,
                    textCapitalization: TextCapitalization.sentences,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter payroll number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _payrollNumber = value!;
                      // print(_personalData.surName);
                    },
                  ),
                  CustomInputField(
                    controller: _employeePeriodInMonthsController,
                    inputWidth: cons.maxWidth * 0.4,
                    autoCorrect: false,
                    enabled: true,
                    enableSuggestions: false,
                    labelText: 'Months of employment',
                    hintText: '3',
                    icon: Icons.person,
                    keyboardType: TextInputType.name,
                    obscureText: false,
                    textCapitalization: TextCapitalization.sentences,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter months of employment';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _officeDetails.employeePeriod = int.parse(value!);
                    },
                  ),
                  CustomInputField(
                    controller: _workstationController,
                    inputWidth: cons.maxWidth * 0.4,
                    autoCorrect: false,
                    enabled: true,
                    enableSuggestions: false,
                    labelText: 'Work station',
                    icon: Icons.person,
                    keyboardType: TextInputType.name,
                    obscureText: false,
                    textCapitalization: TextCapitalization.sentences,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter work station';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _officeDetails.workStation = value!;
                    },
                  ),
                ])),
            Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 2,
                      fixedSize: Size(cons.maxWidth * 0.2, 50),
                      backgroundColor: appSecondaryColor,
                    ),
                    onPressed: () => _selectDate(context),
                    child: Text(_dateOfHire == null
                        ? 'Date of Hire:'
                        : 'Date of Hire: ${_formatDateTime(_dateOfHire!)}'),
                  )
                ])),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Spacer(),
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: appSecondaryColor,
                  ),
                  child: const Text('Done'),
                )
              ],
            )),
          ]);
        }),
      ),
    );
  }
}
