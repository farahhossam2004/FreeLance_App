import 'package:flutter/material.dart';

class MultipleChoiceDropdown extends StatefulWidget {
  final String text;
  final String buttontext;
  final List<String> options;
  final List<String> selectedOptions;
  final Function(List<String>) onOptionsChanged;
  final bool isSingleSelection; // Boolean to control single/multiple selection

  const MultipleChoiceDropdown({
    super.key,
    required this.text,
    required this.buttontext,
    required this.options,
    required this.selectedOptions,
    required this.onOptionsChanged,
    this.isSingleSelection = false, // Default is multiple selection
  });

  @override
  _MultipleChoiceDropdownState createState() => _MultipleChoiceDropdownState();
}

class _MultipleChoiceDropdownState extends State<MultipleChoiceDropdown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.text,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30),
        Center(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  List<String> tempSelectedOptions = List.from(widget.selectedOptions);

                  return StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return AlertDialog(
                        title: const Text(
                          "Select Options",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: widget.options.map((String option) {
                              return CheckboxListTile(
                                title: Text(option),
                                value: tempSelectedOptions.contains(option),
                                onChanged: (bool? value) {
                                  setState(() {
                                    if (widget.isSingleSelection) {
                                      // If single selection, clear previous selection and add the new one
                                      tempSelectedOptions.clear();
                                      if (value == true) {
                                        tempSelectedOptions.add(option);
                                      }
                                    } else {
                                      // If multiple selection is allowed
                                      if (value == true) {
                                        tempSelectedOptions.add(option);
                                      } else {
                                        tempSelectedOptions.remove(option);
                                      }
                                    }
                                  });
                                },
                              );
                            }).toList(),
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              widget.onOptionsChanged(tempSelectedOptions);
                              Navigator.of(context).pop();
                            },
                            child: const Text("Close"),
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(
                const Color.fromARGB(255, 72, 175, 65),
              ),
            ),
            child: Text(
              widget.buttontext,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}

