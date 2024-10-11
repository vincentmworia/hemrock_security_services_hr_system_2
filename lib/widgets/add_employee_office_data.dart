import 'package:flutter/material.dart';
import 'package:hrsystem/models/office_details.dart';

import '../models/drop_down_data.dart';
import '../models/personal_data.dart';
import 'package:intl/intl.dart';
import '../main.dart';
import 'custom_input_field.dart';

class AddEmployeeOfficeData extends StatefulWidget {
  const AddEmployeeOfficeData({super.key, required this.switchIcon});

  final void Function(int toSwitch) switchIcon;
  static var payrollNumber = '';

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
      // todo date of hire and position title
      if (_dateOfHire == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(_snackBar('Select the date of hire'));
      }
      if (_positionTitleString == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(_snackBar('Select the job position'));
      }
      if (_dateOfHire != null && _positionTitleString != null) {
        // If all fields are valid, save the form
        _formKey.currentState!.save();
        // _personalData.gender = getGenderEnum(_selectedGender);
        // _personalData.dateOfBirth = _selectedDate;
        //
        print(_officeDetails.toMap());
        print(_officeDetails.hasNullValue);
        //
        widget.switchIcon(_officeDetails.hasNullValue ? 1 : 2);

        ScaffoldMessenger.of(context)
            .showSnackBar(_snackBar('Office details is okay'));
      }
    }
  }

  final _payrollNumberController = TextEditingController();
  final _workstationController = TextEditingController();
  final _employeePeriodInMonthsController = TextEditingController();

  final _officeDetails = OfficeDetails();

  DateTime? _dateOfHire;

  String? _payrollNumber;
  String? _positionTitleString;

  // var _positionTitleString = contractGuardString;

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
        _officeDetails.dateOfHire = _dateOfHire;
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
                    inputWidth: cons.maxWidth * 0.3,
                    autoCorrect: false,
                    enabled: true,
                    enableSuggestions: false,
                    labelText: 'Payroll Number',
                    hintText: 'HSS001',
                    icon: Icons.business,
                    keyboardType: TextInputType.name,
                    obscureText: false,
                    textCapitalization: TextCapitalization.sentences,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter payroll number';
                      }if (!(value.contains('HSS'))) {
                        return 'Start with HSS';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _payrollNumber = value!;
                      AddEmployeeOfficeData.payrollNumber = _payrollNumber!;
                      // print(_personalData.surName);
                    },
                  ),
                  CustomInputField(
                    controller: _employeePeriodInMonthsController,
                    inputWidth: cons.maxWidth * 0.3,
                    autoCorrect: false,
                    enabled: true,
                    enableSuggestions: false,
                    labelText: 'Period (Months)',
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
                  SizedBox(
                    width: cons.maxWidth * 0.3,
                    child: Center(
                      child: Column(
                        children: [
                          const Text(
                            'Position Title',
                            style: TextStyle(color: appPrimaryColor),
                          ),
                          Center(
                            child: DropdownButton<String>(
                              value: _positionTitleString,
                              iconSize: 30,
                              icon: const Icon(
                                Icons.arrow_drop_down_sharp,
                                color: appSecondaryColor2,
                              ),
                              elevation: 5,
                              underline: Container(
                                height: 0,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _positionTitleString = newValue!;
                                  _officeDetails.positionTitle =
                                      getPositionTitleEnum(newValue);
                                  //   todo validate this data
                                });
                                // updateSearchedText(newValue);
                              },
                              items: <String>[
                                ...officePositions
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      color: (value == _positionTitleString)
                                          ? appSecondaryColor2
                                          : appPrimaryColor,
                                      // fontSize: 18.0,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ])),
            Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  CustomInputField(
                    controller: _workstationController,
                    inputWidth: cons.maxWidth * 0.5,
                    autoCorrect: false,
                    enabled: true,
                    enableSuggestions: false,
                    labelText: 'Work station',
                    icon: Icons.security,
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

                  // todo start from setting the position title

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 2,
                      fixedSize: Size(cons.maxWidth * 0.3, 50),
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
