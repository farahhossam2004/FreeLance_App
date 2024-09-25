import 'package:flutter/material.dart';

class MultipleChoiceDropdown extends StatefulWidget {
  final String text;
  final String buttontext;
  final List<String> options;
  final List<String> selectedOptions; // This will hold selected options
  final Function(List<String>) onOptionsChanged; // Callback to update options

  MultipleChoiceDropdown({
    super.key,
    required this.text,
    required this.buttontext,
    required this.options,
    required this.selectedOptions, // Initialize here
    required this.onOptionsChanged, // Initialize callback here
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
        const SizedBox(
          height: 30,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  // Create a local list to store the changes temporarily
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
                                    if (value != null && value) {
                                      tempSelectedOptions.add(option);
                                    } else {
                                      tempSelectedOptions.remove(option);
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
                              // Call the callback function to update selected options
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

