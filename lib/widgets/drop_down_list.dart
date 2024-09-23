import 'package:flutter/material.dart';

class CountryDropdown extends StatefulWidget {
  final String TextError;
  final TextEditingController controller; // Add this line

  const CountryDropdown(
      {super.key, required this.TextError, required this.controller});

  @override
  // ignore: library_private_types_in_public_api
  _CountryDropdownState createState() => _CountryDropdownState();
}

class _CountryDropdownState extends State<CountryDropdown> {
  // List of countries
  final List<String> countries = [
    'Egypt',
    'Saudi arabia',
    'Qatar',
    'Germany',
    'Sudan'
  ];

  // Selected country
  String? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Row(
              children: [
                Text(
                  "Country", // Display the passed text
                  style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 5), // Add some space between text and icon
                // Display the icon if provided
                Icon(Icons.home)
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
              value: selectedCountry,
              hint: const Text('Choose your country'),
              icon: const Icon(Icons.arrow_circle_down_outlined),
              //============
              items: countries.map((String country) {
                return DropdownMenuItem<String>(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
              //============
              onChanged: (String? newValue) {
                setState(() {
                  selectedCountry = newValue!;
                  widget.controller.text = selectedCountry!;
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
