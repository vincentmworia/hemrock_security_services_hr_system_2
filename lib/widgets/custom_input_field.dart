import 'package:flutter/material.dart';
import 'package:hrsystem/main.dart';

class CustomInputField extends StatefulWidget {
  const CustomInputField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.icon,
    required this.obscureText,
    this.focusNode,
    required this.autoCorrect,
    required this.enableSuggestions,
    this.textCapitalization,
    this.onFieldSubmitted,
    this.textInputAction,
    this.validator,
    this.onSaved,
    // this.initialValue,
    required this.keyboardType,
    required this.enabled,
    required this.inputWidth,
    this.hintText,
  });

  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final bool enabled;
  final double inputWidth;
  final TextInputType? keyboardType;
  final IconData icon;
  final bool obscureText;
  final FocusNode? focusNode;
  final bool autoCorrect;
  final bool enableSuggestions;
  final TextCapitalization? textCapitalization;
  final void Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  // final String? initialValue;

  @override
  State<CustomInputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<CustomInputField> {
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = (widget.labelText == 'Password' ||
            widget.labelText == 'New Password' ||
            widget.labelText == 'Old Password' ||
            widget.labelText == 'Confirm Password')
        ? true
        : false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      child: TextFormField(
        // initialValue: widget.initialValue,
        key: widget.key,
        controller: widget.controller,

        keyboardType: widget.keyboardType,
        focusNode: widget.focusNode,
        autocorrect: widget.autoCorrect,
        enableSuggestions: widget.enableSuggestions,
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.none,
        obscureText: obscureText,
        onFieldSubmitted: widget.onFieldSubmitted,
        textInputAction: widget.textInputAction,

        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(width: 0.8),
          ),
          filled: true,
          fillColor: Colors.white,
          hoverColor: appSecondaryColor2.withOpacity(0.1),
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
          constraints: BoxConstraints(
            maxWidth: widget.inputWidth,
            minWidth: widget.inputWidth,
          ),
          prefixIcon: Icon(
            widget.icon,
            color: Theme.of(context).colorScheme.primary,
            size: 30.0,
          ),
          labelText: widget.labelText,
          hintText: widget.hintText,
          alignLabelWithHint: true,
          enabled: widget.enabled,
          suffixIcon: (widget.labelText == 'Password' ||
                  widget.labelText == 'Old Password' ||
                  widget.labelText == 'New Password' ||
                  widget.labelText == 'Confirm Password')
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: obscureText
                      ? const Icon(
                          Icons.visibility_off,
                          color: Colors.grey,
                          size: 30.0,
                        )
                      : Icon(
                          Icons.visibility,
                          color: Theme.of(context).colorScheme.primary,
                          size: 30.0,
                        ))
              : null,
        ),
        validator: widget.validator,
        onSaved: widget.onSaved,
      ),
    );
  }
}
