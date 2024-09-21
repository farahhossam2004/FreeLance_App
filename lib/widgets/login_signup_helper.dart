import 'package:flutter/material.dart';

class SignUpLoginHelper {
  Widget getNextButton(int choice, Widget page, BuildContext context) {
    if (choice == 1) {
      return SizedBox(
        height: 50,
        width: 150,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(
              const Color.fromARGB(255, 30, 193, 18),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
          },
          child: const Text(
            "Next",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    } else {
      return Container(); // Return an empty container if the condition is not met
    }
  }

  Widget getCustomLink(
      Widget page, BuildContext context, String nextpageString,[String? FirstWord]) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(FirstWord != null)
          Text(
            FirstWord,
            style:const  TextStyle(
              color:  Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => page),
              );
            },
            child: Text(
              nextpageString,
              style: const TextStyle(
                color: Color.fromARGB(255, 32, 189, 40),
                fontSize: 17,
                decoration:
                    TextDecoration.underline, // Optional: underline text
              ),
            ),
          ),
        ],
      ),
    );
  }
}
