import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class MultiSelectDropDown extends StatefulWidget {
  final List<String> items;
  final Function(List<String>) onSelectionChanged;

  const MultiSelectDropDown({
    Key? key,
    required this.items,
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  State<MultiSelectDropDown> createState() => _MultiSelectDropDownState();
}

class _MultiSelectDropDownState extends State<MultiSelectDropDown> {
  List<String> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: DropdownButtonHideUnderline(
          child: DropdownButton2(
            isExpanded: true,
            hint: const Text(
              'Select Items',
              style: TextStyle(fontSize: 14),
            ),
            items: widget.items.map((item) {
              return DropdownMenuItem<String>(
                value: item,
                child: StatefulBuilder(
                  builder: (context, menuSetState) {
                    final isSelected = selectedItems.contains(item);
                    return InkWell(
                      onTap: () {
                        setState(() {
                          isSelected
                              ? selectedItems.remove(item)
                              : selectedItems.add(item);
                        });
                        // Pass the updated selection to the parent
                        widget.onSelectionChanged(selectedItems);
                        menuSetState(() {}); // Update UI of the dropdown menu
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item,
                            style: const TextStyle(fontSize: 14),
                          ),
                          Checkbox(
                            value: isSelected,
                            onChanged: (checked) {
                              setState(() {
                                checked!
                                    ? selectedItems.add(item)
                                    : selectedItems.remove(item);
                              });
                              widget.onSelectionChanged(selectedItems);
                              menuSetState(() {});
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }).toList(),
            value: null, // Multi-select dropdown does not need a single value
            onChanged:
                (value) {}, // Empty because selection happens via the InkWell
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 40,
              width: 240,
            ),
            menuItemStyleData: const MenuItemStyleData(height: 40),
          ),
        ),
      ),
    );
  }
}
