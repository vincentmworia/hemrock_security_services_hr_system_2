import 'package:flutter/material.dart';
import 'package:hrsystem/models/payment_data.dart';

import '../models/personal_data.dart';
import 'package:intl/intl.dart';
import '../main.dart';
import 'custom_input_field.dart';

class AddEmployeePaymentDetails extends StatefulWidget {
  const AddEmployeePaymentDetails({super.key, required this.switchIcon});

  final void Function(int toSwitch) switchIcon;

  @override
  State<AddEmployeePaymentDetails> createState() =>
      _AddEmployeePaymentDetails();
}

class _AddEmployeePaymentDetails extends State<AddEmployeePaymentDetails> {
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

      _paymentDetails.bankDetails = _bankDetails;
      print(_paymentDetails.toMap());

      widget.switchIcon((_paymentDetails.hasNullValue ||
              _bankDetails.hasNullValue ||
              (_paymentDetails.bankDetails == null))
          ? 1
          : 2);

      ScaffoldMessenger.of(context)
          .showSnackBar(_snackBar('Payment Details are okay'));
    }
  }

  final _bankNameController = TextEditingController();
  final _bankAccountNumberController = TextEditingController();
  final _bankCodeController = TextEditingController();
  final _grossPayController = TextEditingController();
  final _savingsController = TextEditingController();
  final _otherCutsController = TextEditingController();
  final _payeCutController = TextEditingController();
  final _nhifCutController = TextEditingController();
  final _nssfCutController = TextEditingController();

  final _bankDetails = BankDetails();
  final _paymentDetails = PaymentData();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _bankNameController.dispose();
    _bankAccountNumberController.dispose();
    _bankCodeController.dispose();
    _grossPayController.dispose();
    _savingsController.dispose();
    _otherCutsController.dispose();
    _payeCutController.dispose();
    _nhifCutController.dispose();
    _nssfCutController.dispose();
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
                    controller: _bankNameController,
                    inputWidth: cons.maxWidth * 0.25,
                    autoCorrect: false,
                    enabled: true,
                    enableSuggestions: false,
                    labelText: 'Bank Name',
                    icon: Icons.account_balance,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    textCapitalization: TextCapitalization.none,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Bank Name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _bankDetails.bankName = value!;
                    },
                  ),
                  CustomInputField(
                    controller: _bankAccountNumberController,
                    inputWidth: cons.maxWidth * 0.25,
                    autoCorrect: false,
                    enabled: true,
                    enableSuggestions: false,
                    labelText: 'Account Number',
                    icon: Icons.account_circle,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    textCapitalization: TextCapitalization.none,
                    validator: (value) {
                      // if (value == null || value.isEmpty) {
                      //   return 'Enter NHIF Number';
                      // }
                      if (value == null || value.isEmpty) {
                        return 'Enter Account Number';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _bankDetails.bankAccountNumber = int.parse(value!);
                    },
                  ),
                  CustomInputField(
                    controller: _bankCodeController,
                    inputWidth: cons.maxWidth * 0.25,
                    autoCorrect: false,
                    enabled: true,
                    enableSuggestions: false,
                    labelText: 'Bank code',
                    icon: Icons.numbers,
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
                      _bankDetails.bankCode = int.parse(value!);
                    },
                  ),
                ])),
            Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  CustomInputField(
                    controller: _grossPayController,
                    inputWidth: cons.maxWidth * 0.25,
                    autoCorrect: false,
                    enabled: true,
                    enableSuggestions: false,
                    labelText: 'Gross Pay',
                    icon: Icons.attach_money,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    textCapitalization: TextCapitalization.none,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Gross Pay';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _paymentDetails.grossPayBasicSalary = int.parse(value!);
                    },
                  ),
                  CustomInputField(
                    controller: _savingsController,
                    inputWidth: cons.maxWidth * 0.25,
                    autoCorrect: false,
                    enabled: true,
                    enableSuggestions: false,
                    labelText: 'Savings cut',
                    icon: Icons.attach_money,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    textCapitalization: TextCapitalization.none,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter savings cut';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _paymentDetails.savings = int.parse(value!);
                    },
                  ),
                  CustomInputField(
                    controller: _otherCutsController,
                    inputWidth: cons.maxWidth * 0.25,
                    autoCorrect: false,
                    enabled: true,
                    enableSuggestions: false,
                    labelText: 'Other cuts',
                    icon: Icons.attach_money,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    textCapitalization: TextCapitalization.none,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter other cuts total amount';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _paymentDetails.otherCuts = int.parse(value!);
                    },
                  ),
                ])),
            Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  CustomInputField(
                    controller: _payeCutController,
                    inputWidth: cons.maxWidth * 0.25,
                    autoCorrect: false,
                    enabled: true,
                    enableSuggestions: false,
                    labelText: 'PAYE cut',
                    icon: Icons.attach_money,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    textCapitalization: TextCapitalization.none,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter PAYE cut';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _paymentDetails.payeCut = int.parse(value!);
                    },
                  ),
                  CustomInputField(
                    controller: _nhifCutController,
                    inputWidth: cons.maxWidth * 0.25,
                    autoCorrect: false,
                    enabled: true,
                    enableSuggestions: false,
                    labelText: 'NHIF cut',
                    icon: Icons.attach_money,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    textCapitalization: TextCapitalization.none,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter NHIF cut';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _paymentDetails.nhifCut = int.parse(value!);
                    },
                  ),
                  CustomInputField(
                    controller: _nssfCutController,
                    inputWidth: cons.maxWidth * 0.25,
                    autoCorrect: false,
                    enabled: true,
                    enableSuggestions: false,
                    labelText: 'NSSF cut',
                    icon: Icons.attach_money,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    textCapitalization: TextCapitalization.none,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter NSSF cut';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _paymentDetails.nssfCut = int.parse(value!);
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
