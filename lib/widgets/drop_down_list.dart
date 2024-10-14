// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class DropDownList extends StatefulWidget {
  final String TextError;
  final TextEditingController controller; // Add this line
  final List<String> items;
  final IconData? icon;
  final String title;
  final ValueChanged<String?>? onChanged;

  const DropDownList(
      {super.key,
      required this.TextError,
      required this.controller,
      required this.items,
      this.icon,
      required this.title,
      this.onChanged});

  @override
  // ignore: library_private_types_in_public_api
  _CountryDropdownState createState() => _CountryDropdownState();
}

class _CountryDropdownState extends State<DropDownList> {
  String? selecteditem;

  @override
  void didUpdateWidget(covariant DropDownList oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Reset selecteditem if the items list changes
    if (widget.items != oldWidget.items) {
      setState(() {
        selecteditem = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  widget.title, // Display the passed text
                  style: const TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                    width: 5), // Add some space between text and icon
              ],
            ),
            //===========================================================================
            const SizedBox(
              height: 5,
            ),
            //======================================================================
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              ),
              //============
              value: selecteditem,
              hint: const Text('Choose an option'),
              icon: const Icon(Icons.arrow_circle_down_outlined),
              //============
              items: widget.items.map((String country) {
                return DropdownMenuItem<String>(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
              //============
              onChanged: (String? newValue) {
                setState(() {
                  selecteditem = newValue;
                  widget.controller.text = selecteditem!;
                  if (widget.onChanged != null) {
                    widget.onChanged!(newValue);
                  }
                });
              },

              validator: (value) {
                if (value == null) {
                  return widget.TextError;
                } else {
                  return null;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
