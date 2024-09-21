import 'package:flutter/material.dart';
import 'package:freelance_app/views/home.dart';
import 'package:freelance_app/views/sign_up.dart';
import 'package:freelance_app/widgets/login_signup_helper.dart';
import 'package:freelance_app/widgets/text_field.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),

      //==============================================
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 50),

            const Center(
              child: Text(
                "Login",
                style: TextStyle(
                    color: Color.fromARGB(255, 4, 4, 4),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            const Divider(
              color: Colors.black, // Color of the line
              thickness: 1, // Thickness of the line
            ),
//========================================================================
            const SizedBox(
              height: 50,
            ),

            CustomTextField(
              text: "Email",
              Textfieldwidth: screenWidth,
              obsecuretext: false,
              icon: Icons.email_outlined,
            ),
            //===========================
            const SizedBox(
              height: 20,
            ),
            //===========================
            CustomTextField(
              text: "Password",
              Textfieldwidth: screenWidth,
              obsecuretext: true,
              icon: Icons.no_encryption_gmailerrorred,
            ),
            SignUpLoginHelper().getCustomLink(
                const HomeScreen(), context, "Forget your password ? "),
            //===============================
//==========================================================================

            const SizedBox(
              height: 40,
            ),

            const Divider(
              color: Colors.black, // Color of the line
              thickness: 1, // Thickness of the line
            ),

//======================================================

            const SizedBox(
              height: 40,
            ),

//===============================================================
// next button
            SignUpLoginHelper().getNextButton(1, const SignUp(), context),
//===================================================
            const SizedBox(
              height: 20,
            ),
//==================================================
            SignUpLoginHelper().getCustomLink(
                const SignUp(), context, "Sign Up !", "Don't Have an Account  ")
          ],
        ),
      ),
    );
  }
}
