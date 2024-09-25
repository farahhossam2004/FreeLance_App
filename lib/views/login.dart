// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:freelance_app/views/free_lancer.dart';
import 'package:freelance_app/views/home.dart';
import 'package:freelance_app/views/start.dart';
import 'package:freelance_app/widgets/login_signup_helper.dart';
import 'package:freelance_app/widgets/text_field.dart';

class Login extends StatelessWidget {
  //const Login({super.key});

  //========================================= For the form and custom text field ==================================
  var Email = TextEditingController();
  var Password = TextEditingController();
  var FormKey = GlobalKey<FormState>();

  Login({super.key}); // Form key
  //==============================================================================================================

  @override
  Widget build(BuildContext context) {
    //=======================================
    // for custom text field height and width ==========================
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double textFieldHeight = screenHeight / 20;
    //=======================================================
    List<TextEditingController> controllers = [];
    controllers.add(Email);
    controllers.add(Password);
    //=============================================================
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),

      //==============================================
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),

        // ==============================================Form start pass the key ==========================
        child: Form(
          key: FormKey, // form key 
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
              //==================================================================================
              CustomTextField(
                text: "Email",
                Textfieldwidth: screenWidth,
                Textfieldheight: textFieldHeight,
                initialObsecureText: false,
                icon: Icons.email_outlined,
                ErrorText: "Enter Your Email",
                controller: Email,
              ),
              //===========================
              const SizedBox(
                height: 20,
              ),
              //===========================
              CustomTextField(
                text: "Password",
                Textfieldheight: textFieldHeight,
                Textfieldwidth: screenWidth,
                initialObsecureText: true,
                icon: Icons.no_encryption_gmailerrorred,
                icontextfield: Icons.remove_red_eye,
                ErrorText: "Enter Your Password",
                controller: Password,
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
              SignUpLoginHelper().getNextButton( choice: 2, page:  FreeLancerProfile(), context:  context ,FormKey: FormKey, controllers:  controllers, option:  2),
              //===================================================
              const SizedBox(
                height: 20,
              ),
              //==================================================
              SignUpLoginHelper().getCustomLink(const Start(), context,
                  "Sign Up !", "Don't Have an Account  ")
            ],
          ),
        ),
      ),
    );
  }
}
