import 'package:flutter/material.dart';

class SignUpLoginHelper {
  Widget getNextButton(int choice, Widget page, BuildContext context,
      [var FormKey, List<TextEditingController>? controllers, int? option]) {
    // For Normal Buttons that navigate only to another page ================================
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

      //============================================ For Form button ===============================================
    } else if (choice == 2) {
      return SizedBox(
        height: 50,
        width: 150,
        child: ElevatedButton(
          onPressed: () async {
            if (FormKey.currentState!.validate()) {
              if (controllers != null && controllers.isNotEmpty) {
                //============================================== option 1 for login page form ================================
                if (option == 1) {
                  print("Sign-Up page items : ");
                  for (int i = 0; i < controllers.length; i++) {
                    print("item [$i] = " + controllers[i].text);
                  }
                }else if(option ==2){ // ========================= option 2 For sign up page ==================================
                  print("Login page items : ");
                  for (int i = 0; i < controllers.length; i++) {
                    print("item [$i] = " + controllers[i].text);
                  }
                } // if there's another page just add the option here and the data base addition of it 
              }
              //=========================
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => page));
              // Reset the form
              FormKey.currentState!.reset();
            }
          },
          //Styling =======================================
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(
              const Color.fromARGB(255, 30, 193, 18),
            ),
          ),
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

  Widget getCustomLink(Widget page, BuildContext context, String nextpageString,
      // ignore: non_constant_identifier_names
      [String? FirstWord]) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (FirstWord != null)
            Text(
              FirstWord,
              style: const TextStyle(
                color: Colors.black,
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
