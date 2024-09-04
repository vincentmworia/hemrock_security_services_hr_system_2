import 'package:flutter/material.dart';

class SelectDropDown extends StatefulWidget {
  const SelectDropDown({super.key});

  @override
  State<SelectDropDown> createState() => _SelectDropDownState();
}

class _SelectDropDownState extends State<SelectDropDown> {
  var _value = 'One';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 100,
      child: DropdownButton<String>(
        value: _value,
        // icon: Icon(null),
        iconSize: 24,
        elevation: 16,
        // style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 0,
          color: Colors.green,
        ),
        onChanged: (String? newValue) {
          setState(() {
            _value = newValue!;
          });
        },
        items: <String>[
          'One',
          'Two',
          'Three',
          'Four',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
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
