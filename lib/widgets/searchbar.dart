import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        height: 48, // Adjust the height if needed
        decoration: BoxDecoration(
          color: Colors.white, // Ensure it's white for visibility
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            filled: true, // Add this to ensure it's filled with color
            fillColor: Colors.white, // Set the fill color for consistency
            hintText: 'Search Job...',
            hintStyle: TextStyle(color: Colors.grey[600]), // Darker color for better visibility
            prefixIcon: Icon(Icons.search, color: Colors.grey[600]), // Make sure the icon color is visible
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none, // Ensure no outline border
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16), // Adjust padding for the icon and text
          ),
          style: const TextStyle(color: Colors.black), // Ensure the input text is visible
        ),
      ),
    );
  }
}
