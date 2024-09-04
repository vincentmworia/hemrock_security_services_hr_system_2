import 'package:flutter/material.dart';

import '../main.dart';
import '../screens/main_screen.dart';

class LeftPaneIconButton extends StatefulWidget {
  const LeftPaneIconButton({
    super.key,
    required this.icon,
    required this.buttonActive,
    required this.titleText,
    required this.extendPane,
    required this.buttonPage,
    required this.activatePage,
  });

  final IconData icon;
  final bool buttonActive;
  final String titleText;
  final bool extendPane;
  final PageDisplay buttonPage;
  final void Function(PageDisplay) activatePage;

  @override
  State<LeftPaneIconButton> createState() => _LeftPaneIconButtonState();
}

class _LeftPaneIconButtonState extends State<LeftPaneIconButton> {
  static final _inactiveBnColor = appSecondaryColor.withOpacity(0.2);
  static const _activeBnColor = appSecondaryColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.activatePage(widget.buttonPage),
      borderRadius: BorderRadius.circular(30.0),
      child: Row(
        mainAxisAlignment: widget.extendPane
            ? MainAxisAlignment.start
            : MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (widget.extendPane) const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Icon(widget.icon,
                size: 40,
                color:
                    !widget.buttonActive ? _inactiveBnColor : _activeBnColor),
          ),
          if (widget.extendPane) const SizedBox(width: 10), // const Center(),
          if (widget.extendPane)
            Text(
              widget.titleText,
              style: TextStyle(
                  color:
                      !widget.buttonActive ? _inactiveBnColor : _activeBnColor,
                  fontSize: 24.0),
            ),
        ],
      ),
    );
  }
}
