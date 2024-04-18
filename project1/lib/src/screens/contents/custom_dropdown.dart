import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    super.key,
    required this.items,
    required this.onChanged,
    this.width = 250,
    this.height = 48,
  });

  final List<String> items;
  final Function(String) onChanged;
  final double width;
  final double height;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  late String _selectedItem;
  bool _isOpen = false;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.items[0];
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        value: _selectedItem,
        items: widget.items
            .map(
              (e) => DropdownMenuItem<String>(
                value: e,
                child: Text(
                  e,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: (value) {
          setState(() {
            widget.onChanged(value.toString());
            _selectedItem = value.toString();
          });
        },
        onMenuStateChange: (isOpen) {
          setState(() {
            _isOpen = isOpen;
          });
        },
        buttonStyleData: ButtonStyleData(
          width: widget.width,
          height: widget.height,
          padding: const EdgeInsets.only(right: 15, left: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
            border: Border.all(
                color: _isOpen ? Colors.blue : Colors.grey[400]!, width: 1),
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          width: widget.width,
          offset: const Offset(0, -5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
            border: Border.all(color: Colors.blue, width: 1),
          ),
          elevation: 0,
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 48,
        ),
        selectedItemBuilder: (context) {
          return widget.items.map((e) {
            return Center(
              child: Text(
                e,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }).toList();
        },
      ),
    );
  }
}
