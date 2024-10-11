// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class SignUpLoginHelper {
  Widget getNextButton(
      {
      required Widget page,
      required BuildContext context,
      var FormKey,
      List<TextEditingController>? controllers,
      VoidCallback? onTap}) {
    // For Normal Buttons that navigate only to another page ================================
    return SizedBox(
      height: 50,
      width: 150,
      child: ElevatedButton(
        onPressed: onTap,
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
  }

  Widget getCustomLink( {
  required GestureTapCallback? onTap,
  required String nextPageString,
  String? firstWord,
}) {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (firstWord != null)
          Text(
            firstWord,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            nextPageString,
            style: const TextStyle(
              color: Color.fromARGB(255, 32, 189, 40),
              fontSize: 17,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    ),
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
        if (page != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        }
      },
    ).show();
  }

  static Future<void> UserRegister(String Email, String Password) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: Email, password: Password);
  }
}
