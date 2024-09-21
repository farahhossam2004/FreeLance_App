// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final IconData? icon; // Optional icon parameter
  final IconData? icontextfield;
  bool obsecuretext;
  // ignore: non_constant_identifier_names
  final double Textfieldwidth;
  CustomTextField(
      {
      super.key,
      required this.text,
      this.icon, // Icon is optional
      // ignore: non_constant_identifier_names
      required this.Textfieldwidth,
      required this.obsecuretext,
      this.icontextfield
      });

  @override
  Widget build(BuildContext context) {
    final screenWidth = Textfieldwidth;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
        children: [
          Row(
            children: [
              Text(
                text, // Display the passed text
                style: const TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 5), // Add some space between text and icon
              if (icon != null) Icon(icon), // Display the icon if provided
            ],
          ),
          const SizedBox(height: 8), // Space between text and TextField
          SizedBox(
            width: screenWidth,
            height: 40,
            child: TextField(
              obscureText: obsecuretext,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0), // Center the text
                border: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.grey), // Light grey border
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.grey), // Light grey when not focused
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.green), // Green when focused
                ),
                suffixIcon: (icontextfield != null) ? Icon(icontextfield) : null  
              ),
            ),
          ),
        ],
      ),
    );
  }
}
