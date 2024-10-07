// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  //=========================================
  // For Decoration
  final String text;
  final IconData? icon; // Optional icon parameter
  final IconData? icontextfield;
  final bool initialObsecureText; // Set initial value for obsecure text
  Function(String)? onChange;
  //===================================
  final double Textfieldwidth;
  final double Textfieldheight;
//=============================================
// For Form
  final TextEditingController controller; // Add this line
  final String ErrorText;
  final String dataType;

  CustomTextField({
    super.key,
    required this.text,
    this.icon, // Icon is optional
    required this.Textfieldwidth,
    required this.initialObsecureText,
    this.icontextfield,
    required this.ErrorText,
    required this.controller,
    required this.Textfieldheight,
    required this.dataType,
    this.onChange
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  // No need for a local TextEditingController
  // var input = TextEditingController(); // Remove this line
  
  bool _obsecureText = true;
  IconData _icontextfield = Icons.visibility_off;

  @override
  void initState() {
    super.initState();
    _obsecureText = widget.initialObsecureText;
    if (widget.icontextfield != null) {
      _icontextfield = widget.icontextfield!;
    }
  }

  @override
  Widget build(BuildContext context) {
    //===============================================
    final screenWidth = widget.Textfieldwidth;
    final screenHeight = widget.Textfieldheight;
    //==================================================
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                widget.text,
                style: const TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 5),
              if (widget.icon != null) Icon(widget.icon),
            ],
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: screenWidth,
            height: screenHeight,
            //===============================For Controller==============================
            child: TextFormField(
              onChanged: widget.onChange,
              controller: widget.controller, // Use the passed controller
              validator: (value) {
                if (value == null || value.isEmpty) {
                  // return the text error if the field is empty
                  return widget.ErrorText;
                } else if (widget.dataType == 'str') {
                  if (RegExp(r'\d').hasMatch(value)) {
                    return 'Please enter a valid string (no numbers allowed)';
                  }
                } else if (widget.dataType == 'num') {
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                } else if (widget.dataType == 'email') {
                  // Regex for validating an email address
                  final emailRegex = RegExp(
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                  );
                  if (!emailRegex.hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                } else {
                  return null;
                }
                 // Return null if valid
              },

              //=======================================For Design the text filed ================================

              obscureText: _obsecureText,

              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 10.0,
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
                suffixIcon: widget.icontextfield != null &&
                        widget.initialObsecureText != false
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            _obsecureText = !_obsecureText;
                            _icontextfield = _obsecureText
                                ? Icons.visibility_off
                                : Icons.remove_red_eye;
                          });
                        },
                        icon: Icon(_icontextfield),
                      )
                    : widget.icontextfield != null &&
                            widget.initialObsecureText != true
                        ? Icon(widget.icontextfield)
                        : null,
              ),
            ),
          )
        ],
      ),
    );
  }
}
