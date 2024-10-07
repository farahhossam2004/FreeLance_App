// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/models/free_lancer.dart';
import 'package:freelance_app/models/person.dart';
import 'package:freelance_app/models/person_helpers.dart';

class SignUpLoginHelper {
  Widget getNextButton(
      {required int choice,
      required Widget page,
      required BuildContext context,
      var FormKey,
      List<TextEditingController>? controllers,
      int? option,
      VoidCallback? onTap}) {
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
          onPressed: onTap,
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
                  String First_name = controllers[0].text;
                  String Second_name = controllers[1].text;
                  String Full_name = First_name + " " + Second_name;
                  String email = controllers[2].text;
                  String password = controllers[3].text;
                  String Country_name = controllers[4].text;

                  FreeLancer freeLancer_new = FreeLancer.basic(
                      personName: Full_name,
                      role: "Free-Lancer",
                      country: Country_name,
                      Email: email,
                      password: password);

                  PersonHelpers.SetCurrentFreeLancer(freeLancer_new);
                } else if (option == 2) {
                  // ========================= option 2 For sign up page ==================================
                  print("Login page items : ");
                  for (int i = 0; i < controllers.length; i++) {
                    print("item [$i] = ${controllers[i].text}");
                  }
                } else if (option == 3) {
                  // to sign up as a gest
                  String First_name = controllers[0].text;
                  String Second_name = controllers[1].text;
                  String Full_name = First_name + " " + Second_name;
                  String email = controllers[2].text;
                  String password = controllers[3].text;
                  String Country_name = controllers[4].text;

                  Person newPerson = Person(
                      personName: Full_name,
                      role: "Client",
                      country: Country_name,
                      password: password,
                      Email: email);

                  //PersonHelpers.getallPersons().add(newPerson);
                  PersonHelpers.SetCurrentPerson(newPerson);
                }
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

  Widget getCustomAlert(String title, String content, BuildContext context) {
    return AlertDialog(
      title: Center(
          child: Text(
        title,
        style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 210, 39, 39)),
      )),
      content: Text(
        content,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      actions: <Widget>[
        TextButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(
              const Color.fromARGB(255, 30, 193, 18),
            ),
          ),
          child: const Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  static void showAwesomeDialog(
      {required BuildContext context,
      required String title,
      required String description,
      required DialogType type,
      Widget? page}) {
    AwesomeDialog(
      context: context,
      dialogType: type,
      animType: AnimType.rightSlide,
      title: title,
      desc: description,
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        if(page !=null){
          Navigator.push(context, MaterialPageRoute(builder: (context) => page!));
        }
      },
    ).show();
  }
}
