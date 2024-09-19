import 'package:flutter/material.dart';

class ChoosableContainer extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onToggle;
  final Icon icon;
  final Text text;

  const ChoosableContainer({
    Key? key,
    required this.isSelected,
    required this.onToggle,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: Container(
        width: 300,
        height: 150,
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  icon,
                  Checkbox(
                    checkColor: const Color.fromARGB(255, 255, 252, 252),
                    activeColor: const Color.fromARGB(255, 221, 218, 56),
                    value: isSelected,
                    onChanged: (bool? value) {
                      onToggle();
                    },
                  ),
                ],
              ),
              text, // Display the provided text
            ],
          ),
        ),
      ),
    );
  }
}
