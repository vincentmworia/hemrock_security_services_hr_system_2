import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({super.key});

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final _searchValueController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _searchValueController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        width: 200.0,
        child: TextFormField(
          key: const ValueKey('search'),
          controller: _searchValueController,
          keyboardType: TextInputType.name,
          textCapitalization: TextCapitalization.sentences,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(width: 0.8),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
            hintText: 'Payroll Number',
            prefixIcon: Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.primary,
              size: 30.0,
            ),
          ),
        ),
      ),
    );
  }
}
