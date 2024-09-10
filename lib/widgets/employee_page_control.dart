import 'package:flutter/material.dart';

import '../../screens/main_screen.dart';
import '../screens/detailed_view/employees_page.dart';
import '../widgets/grid_list_switch.dart';
import '../main.dart';
import './search_box.dart';
import './select_drop_down.dart';
import './ascending_descending_sort_icon.dart';

class EmployeePageControl extends StatefulWidget {
  const EmployeePageControl({
    super.key,
    required this.deviceWidth,
    required this.view,
    required this.switchDisplayStyle,
    required this.switchSort,
    required this.sort,
    required this.switchCurrentPage,
    required this.updateSearchedText,
    required this.searchCategory,
    required this.switchCurrentSearchCategory,
  });

  final double deviceWidth;
  final ViewData view;
  final SortOrder sort;
  final String searchCategory;
  final void Function(PageDisplay) switchCurrentPage;
  final void Function(ViewData) switchDisplayStyle;
  final void Function(SortOrder) switchSort;
  final void Function(String) updateSearchedText;
  final void Function(String) switchCurrentSearchCategory;

  @override
  State<EmployeePageControl> createState() => _EmployeePageControlState();
}

class _EmployeePageControlState extends State<EmployeePageControl> {
  var _search = false;

  void _switchSearch(/*[bool revertOnDeviceCompressed = false]*/) {
    // if (revertOnDeviceCompressed) {
    //   setState(() => _search = false);
    // } else {
    setState(() => _search = !_search);
    // }
  }

  var _visibleWidgets = false;

  void _pTrigLogic() {
    if (!_visibleWidgets && _search) {
      Future.delayed(const Duration(milliseconds: 300)).then((value) {
        setState(() {
          _visibleWidgets = true;
        });
      });
    }
    if (_visibleWidgets && !_search) {
      setState(() => _visibleWidgets = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    _pTrigLogic();
    return Padding(
      padding: const EdgeInsets.only(
          left: 30.0, top: 10.0, bottom: 10.0, right: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!_search)
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    elevation: 5.0,
                    fixedSize: const Size(200, 50),
                    backgroundColor: appSecondaryColor),
                icon: const Icon(
                  Icons.add,
                  color: appPrimaryColor,
                ),
                onPressed: () => widget.switchCurrentPage(PageDisplay.addEmployee),
                label: const Text(
                  'Add New Employee',
                  style: TextStyle(
                    color: appPrimaryColor,
                  ),
                )),
          const Text(
            'Staff Members',
            style: TextStyle(
              fontSize: 30.0,
              color: appPrimaryColor,
              fontWeight: FontWeight.w700,
              letterSpacing: 3.0,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Row(
              //   children: [
              //     GridListSwitch(
              //       deviceWidth: widget.deviceWidth,
              //       title: 'Grid',
              //       active: widget.view == ViewData.asGrid,
              //       currentView: ViewData.asGrid,
              //       switchDisplayStyle: widget.switchDisplayStyle,
              //     ),
              //     GridListSwitch(
              //       deviceWidth: widget.deviceWidth,
              //       title: 'List',
              //       active: widget.view == ViewData.asList,
              //       currentView: ViewData.asGrid,
              //       switchDisplayStyle: widget.switchDisplayStyle,
              //     ),
              //   ],
              // ),
              if (_search)
                !_visibleWidgets
                    ? SizedBox(width: widget.deviceWidth * 0.4)
                    : Row(
                        children: [
                          // if (widget.deviceWidth > 1200)
                          SearchBox(
                            updateSearchedText: widget.updateSearchedText,
                            searchCategory: widget.searchCategory,
                          ),
                          // if (widget.deviceWidth > 1300)
                          SelectDropDown(
                              switchCurrentSearchCategory:
                                  widget.switchCurrentSearchCategory),
                          AscendingDescendingSortIcon(
                            sort: widget.sort,
                            switchSort: widget.switchSort,
                          ),
                        ],
                      ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: FloatingActionButton(
                  onPressed: () => _switchSearch(),
                  backgroundColor: appSecondaryColor,
                  child: Icon(
                    _search ? Icons.arrow_forward_ios_rounded : Icons.search,
                    size: 30.0,
                    color: appPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
