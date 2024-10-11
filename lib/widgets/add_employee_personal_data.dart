import 'package:flutter/material.dart';

import '../models/personal_data.dart';
import 'package:intl/intl.dart';
import '../main.dart';
import 'custom_input_field.dart';

class AddEmployeePersonalData extends StatefulWidget {
  const AddEmployeePersonalData({super.key, required this.switchIcon});

  final void Function(int toSwitch) switchIcon;

  @override
  State<AddEmployeePersonalData> createState() =>
      _AddEmployeePersonalDataState();
}

class _AddEmployeePersonalDataState extends State<AddEmployeePersonalData> {
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
      print(_selectedDate);
      if (_selectedDate == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(_snackBar('Select the date of birth'));
      } if (_selectedGender == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(_snackBar('Select the gender'));
      }

      if (_selectedDate != null && _selectedGender != null) {
        // If all fields are valid, save the form
        _formKey.currentState!.save();
        _personalData.gender = getGenderEnum(_selectedGender!);
        _personalData.dateOfBirth = _selectedDate;

        print(_personalData.toMap());

        widget.switchIcon(_personalData.hasNullValue ? 1 : 2);

        ScaffoldMessenger.of(context)
            .showSnackBar(_snackBar('Personal Data is okay'));
      }
    }
  }

  final _surnameController = TextEditingController();
  final _otherNamesController = TextEditingController();
  final _identityNumberController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _citizenshipController = TextEditingController();
  final _kraPinController = TextEditingController();
  final _nssfNumberController = TextEditingController();
  final _nhifNumberController = TextEditingController();

  final _personalData = PersonalData();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _surnameController.dispose();
    _otherNamesController.dispose();
    _identityNumberController.dispose();
    _phoneNumberController.dispose();
    _citizenshipController.dispose();
    _kraPinController.dispose();
    _nssfNumberController.dispose();
    _nhifNumberController.dispose();
  }

  String? _selectedGender ;

  DateTime? _selectedDate;

  // Function to show the DatePicker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Default to today's date
      firstDate: DateTime(1900), // Earliest date available
      lastDate: DateTime.now(), // Latest date available
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
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
                    controller: _surnameController,
                    inputWidth: cons.maxWidth * 0.25,
                    autoCorrect: false,
                    enabled: true,
                    enableSuggestions: false,
                    labelText: 'Surname',
                    icon: Icons.person,
                    keyboardType: TextInputType.name,
                    obscureText: false,
                    textCapitalization: TextCapitalization.sentences,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter surname';
                      }

                      return null;
                    },
                    onSaved: (value) {
                      _personalData.surName = value!;
                      // print(_personalData.surName);
                    },
                  ),
                  Expanded(
                    child: CustomInputField(
                      controller: _otherNamesController,
                      inputWidth: cons.maxWidth * 0.4,
                      autoCorrect: false,
                      enabled: true,
                      enableSuggestions: false,
                      labelText: 'Other name(s)',
                      icon: Icons.person,
                      keyboardType: TextInputType.name,
                      obscureText: false,
                      textCapitalization: TextCapitalization.sentences,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter other name(s)';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _personalData.otherNames = value!;
                      },
                    ),
                  ),
                  Column(
                    children: [
                      const Text('Select the gender',style: TextStyle(color: appPrimaryColor),),
                      SizedBox(
                        width: cons.maxWidth * 0.2,
                        child: Center(
                          child: DropdownButton<String>(
                            alignment: Alignment.centerRight,
                            value:_selectedGender,
                            iconSize: 30,
                            icon: const Icon(
                              Icons.arrow_drop_down_sharp,
                              color: appSecondaryColor2,
                            ),
                            focusColor: appSecondaryColor2.withOpacity(0.1),
                            iconDisabledColor: appSecondaryColor,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            iconEnabledColor: appSecondaryColor2,
                            elevation: 5,
                            underline: Container(
                              height: 0,
                            ),
                            items: <String>['Male', 'Female']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                    color: appPrimaryColor,
                                    // fontSize: 18.0,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedGender = newValue!;
                                _personalData.gender = getGenderEnum(_selectedGender!);
                              });
                              // updateSearchedText(newValue);
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                ])),
            Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  CustomInputField(
                    controller: _identityNumberController,
                    inputWidth: cons.maxWidth * 0.2,
                    autoCorrect: false,
                    enabled: true,
                    enableSuggestions: false,
                    labelText: 'Id Number',
                    icon: Icons.badge,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    textCapitalization: TextCapitalization.none,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Identity Number';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _personalData.identityNumber = int.parse(value!);
                    },
                  ),
                  CustomInputField(
                    controller: _phoneNumberController,
                    inputWidth: cons.maxWidth * 0.2,
                    autoCorrect: false,
                    enabled: true,
                    enableSuggestions: false,
                    labelText: 'Phone',
                    hintText: '0700000110',
                    icon: Icons.phone,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    textCapitalization: TextCapitalization.none,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Phone Number';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      if (value.length != 10) {
                        return 'A phone number has 10 numbers';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _personalData.phoneNumber = int.parse(value!);
                    },
                  ),
                  CustomInputField(
                    controller: _citizenshipController,
                    inputWidth: cons.maxWidth * 0.2,
                    autoCorrect: false,
                    enabled: true,
                    enableSuggestions: false,
                    labelText: 'Citizenship',
                    // hintText: '0700000110',
                    icon: Icons.public,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    textCapitalization: TextCapitalization.sentences,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Citizenship';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _personalData.citizenship = value!;
                    },
                  ),
                  Column(
                    children: [
                      const Text('Date of Birth:',style: TextStyle(color: appPrimaryColor),),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 2,
                          fixedSize: Size(cons.maxWidth * 0.2, 50),
                          backgroundColor: appSecondaryColor,
                        ),
                        onPressed: () => _selectDate(context),
                        child: Text(_selectedDate == null
                            ? 'DD/MM/YYYY'
                            : 'Date of birth: ${_formatDateTime(_selectedDate!)}'),
                      ),
                    ],
                  )
                ])),
            Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  CustomInputField(
                    controller: _kraPinController,
                    inputWidth: cons.maxWidth * 0.25,
                    autoCorrect: false,
                    enabled: true,
                    enableSuggestions: false,
                    labelText: 'KRA pin',
                    icon: Icons.description,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    textCapitalization: TextCapitalization.none,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter KRA pin';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _personalData.kraPin = value!;
                    },
                  ),
                  CustomInputField(
                    controller: _nhifNumberController,
                    inputWidth: cons.maxWidth * 0.25,
                    autoCorrect: false,
                    enabled: true,
                    enableSuggestions: false,
                    labelText: 'NHIF Number',
                    icon: Icons.health_and_safety,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    textCapitalization: TextCapitalization.none,
                    validator: (value) {
                      // if (value == null || value.isEmpty) {
                      //   return 'Enter NHIF Number';
                      // }
                      if (value != null) {
                        if (int.tryParse(value) == null) {
                          return 'Enter a valid number';
                        }
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _personalData.nhifNumber = int.parse(value!);
                    },
                  ),
                  CustomInputField(
                    controller: _nssfNumberController,
                    inputWidth: cons.maxWidth * 0.25,
                    autoCorrect: false,
                    enabled: true,
                    enableSuggestions: false,
                    labelText: 'NSSF Number',
                    icon: Icons.savings,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    textCapitalization: TextCapitalization.none,
                    validator: (value) {
                      // if (value == null || value.isEmpty) {
                      //   return 'Enter NSSF Number';
                      // }
                      if (value != null && (int.tryParse(value) == null)) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _personalData.nssfNumber = int.parse(value!);
                    },
                  ),
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
            ))
          ]);
        }),
      ),
    );
  }
}
