import 'package:flutter/material.dart';
import 'package:hrsystem/models/next_of_kin.dart';
import 'package:hrsystem/models/payment_data.dart';

import '../models/personal_data.dart';
import 'package:intl/intl.dart';
import '../main.dart';
import 'custom_input_field.dart';

class AddEmployeeNextOfKinDetails extends StatefulWidget {
  const AddEmployeeNextOfKinDetails({super.key, required this.switchIcon});

  final void Function(int toSwitch) switchIcon;

  @override
  State<AddEmployeeNextOfKinDetails> createState() =>
      _AddEmployeeNextOfKinDetails();
}

class _AddEmployeeNextOfKinDetails extends State<AddEmployeeNextOfKinDetails> {
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
      // If all fields are valid, save the form
      _formKey.currentState!.save();

      print(_nextOfKin1.toMap());
      print(_nextOfKin2.toMap());

      widget.switchIcon((_nextOfKin1.hasNullValue ||
              _nextOfKin1.hasNullValue ||
              (_nextOfKin2.hasNullValue))
          ? 1
          : 2);

      ScaffoldMessenger.of(context)
          .showSnackBar(_snackBar('Next of kin details are okay'));
    }
  }

  final _nextOfKin1RelationshipController = TextEditingController();
  final _nextOfKin1MobileNumberController = TextEditingController();
  final _nextOfKin2RelationshipController = TextEditingController();
  final _nextOfKin2MobileNumberController = TextEditingController();

  final _nextOfKin1 = NextOfKin();
  final _nextOfKin2 = NextOfKin();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _nextOfKin1RelationshipController.dispose();
    _nextOfKin1MobileNumberController.dispose();
    _nextOfKin2RelationshipController.dispose();
    _nextOfKin2MobileNumberController.dispose();
  }

  SizedBox _title(String title, BoxConstraints cons) => SizedBox(
        height: double.infinity,
        width: cons.maxWidth * 0.25,
        child: Center(
            child: Text(
          title,
          style: const TextStyle(
              color: appSecondaryColor2,
              fontSize: 22.0,
              fontWeight: FontWeight.w600),
        )),
      );

  @override
  Widget build(BuildContext context) {
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
                  _title('Next of Kin 1', cons),
                  CustomInputField(
                    controller: _nextOfKin1RelationshipController,
                    inputWidth: cons.maxWidth * 0.25,
                    autoCorrect: false,
                    enabled: true,
                    enableSuggestions: false,
                    labelText: 'Relationship',
                    icon: Icons.person,
                    keyboardType: TextInputType.name,
                    obscureText: false,
                    textCapitalization: TextCapitalization.none,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter relationship';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _nextOfKin1.relationship = value;
                    },
                  ),
                  CustomInputField(
                    controller: _nextOfKin1MobileNumberController,
                    inputWidth: cons.maxWidth * 0.25,
                    autoCorrect: false,
                    enabled: true,
                    enableSuggestions: false,
                    labelText: 'Mobile Number',
                    icon: Icons.phone,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    textCapitalization: TextCapitalization.none,
                    validator: (value) {
                      if (value != null && (int.tryParse(value) == null)) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _nextOfKin1.mobileNumber = int.parse(value!);
                    },
                  ),
                ])),
            Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  _title('Next of Kin 2', cons),
                  CustomInputField(
                    controller: _nextOfKin2RelationshipController,
                    inputWidth: cons.maxWidth * 0.25,
                    autoCorrect: false,
                    enabled: true,
                    enableSuggestions: false,
                    labelText: 'Relationship',
                    icon: Icons.person,
                    keyboardType: TextInputType.name,
                    obscureText: false,
                    textCapitalization: TextCapitalization.none,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter relationship';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _nextOfKin2.relationship = value;
                    },
                  ),
                  CustomInputField(
                    controller: _nextOfKin2MobileNumberController,
                    inputWidth: cons.maxWidth * 0.25,
                    autoCorrect: false,
                    enabled: true,
                    enableSuggestions: false,
                    labelText: 'Mobile Number',
                    icon: Icons.phone,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    textCapitalization: TextCapitalization.none,
                    validator: (value) {
                      if (value != null && (int.tryParse(value) == null)) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _nextOfKin2.mobileNumber = int.parse(value!);
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
                    fixedSize: const Size(100, 50),
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
