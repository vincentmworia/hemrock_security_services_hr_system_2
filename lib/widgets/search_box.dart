import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  const SearchBox(
      {super.key,
      required this.updateSearchedText,
      required this.searchCategory});

  final String searchCategory;
  final void Function(String) updateSearchedText;

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final searchValueController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    searchValueController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        width: 250.0,
        child: TextFormField(
          onChanged: (value) {
            widget.updateSearchedText(value);
          },
          key: const ValueKey('search'),
          controller: searchValueController,
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
            contentPadding: const EdgeInsets.all(10.0),
            hintText: 'Search by ${widget.searchCategory}',
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
