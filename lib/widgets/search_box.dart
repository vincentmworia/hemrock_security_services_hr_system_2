import 'package:flutter/material.dart';

import '../widgets/input_field.dart';

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
    return SizedBox(
      width: 300.0,
      child: InputField(
          key: const ValueKey('search'),
          keyboardType: TextInputType.name,
          controller: _searchValueController,
          hintText: 'Search by Name',
          icon: Icons.search,
          obscureText: false,
          autoCorrect: false,
          enableSuggestions: false,
          textCapitalization: TextCapitalization.sentences,
          textInputAction: TextInputAction.done),
      // TextField(),
    );
  }
}
