import 'package:flutter/material.dart';
import 'package:freelance_app/widgets/starcliper.dart';

class Starwidget extends StatelessWidget {
  const Starwidget({super.key, required this.isActive});

  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipPath(
        clipper: StarClipper(),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          color:isActive? Colors.orange : const Color.fromARGB(255, 216, 207, 207),
          height: 50,
          width: 60,
        ),
      ),
    );
  }
}
