import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onSearchChanged;
  const CustomSearchBar({super.key, required this.controller, required this.onSearchChanged});

  @override
    Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Search jobs...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.green, width: 2),
          ),
          prefixIcon: const Icon(Icons.search, color: Colors.green,),
        ),
        onChanged: onSearchChanged,
        
      ),
    );
  }
}
