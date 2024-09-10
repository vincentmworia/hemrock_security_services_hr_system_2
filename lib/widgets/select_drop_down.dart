import 'package:flutter/material.dart';
import 'package:hrsystem/main.dart';
import 'package:hrsystem/models/drop_down_data.dart';

class SelectDropDown extends StatefulWidget {
  const SelectDropDown({super.key, required this.switchCurrentSearchCategory});

  static const defaultCategory = 'Payroll Number';

  final void Function(String) switchCurrentSearchCategory;



  @override
  State<SelectDropDown> createState() => _SelectDropDownState();
}

class _SelectDropDownState extends State<SelectDropDown> {
  var _value = SelectDropDown.defaultCategory;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        value: _value,
        iconSize: 0,
        elevation: 5,
        underline: Container(
          height: 0,
        ),
        onChanged: (String? newValue) {
          setState(() {
            _value = newValue!;
            widget.switchCurrentSearchCategory(newValue);
          });
          // updateSearchedText(newValue);
        },
        items: <String>[
           ...DropDownData.stringList
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(
                color: (value == _value) ? appSecondaryColor2 : appPrimaryColor,
                // fontSize: 18.0,
              ),
            ),
          );
        }).toList(),
      ),
    );

    // return DropdownButton(
    //     value: _value,
    //
    //
    //     items: <String>['One', 'Two', 'Three', 'Four']
    //         .map<DropdownMenuItem<String>>((String value) {
    //       return DropdownMenuItem<String>(
    //         value: value,
    //         child: Text(value),
    //       );
    //     }).toList(),
    //     onChanged: (val) {
    //       setState(() {
    //         _value = val.toString();
    //       });
    //     });
  }
}
