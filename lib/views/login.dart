// ignore_for_file: non_constant_identifier_names, unused_catch_clause, use_build_context_synchronously, prefer_const_constructors_in_immutables

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/services/user_provider.dart';
import 'package:freelance_app/views/client_profile.dart';
import 'package:freelance_app/views/free_lancer.dart';
import 'package:freelance_app/views/home.dart';
import 'package:freelance_app/views/start.dart';
import 'package:freelance_app/widgets/login_signup_helper.dart';
import 'package:freelance_app/widgets/text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //const Login({super.key});
  var Email = TextEditingController();

  var Password = TextEditingController();

  var FormKey = GlobalKey<FormState>();

  bool isLoading = false;

  // Form key
  @override
  Widget build(BuildContext context) {
    //=======================================
    // for custom text field height and width ==========================
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double textFieldHeight = screenHeight / 20;
    //=======================================================

    //=============================================================
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
      ),

      //==============================================
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: SingleChildScrollView(
          child: Padding(
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
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Divider(
                    color: Colors.black, // Color of the line
                    thickness: 2, // Thickness of the line
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
                      dataType: 'email'),
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
                      dataType: 'num'),

                  SignUpLoginHelper().getCustomLink(
                      onTap: () {}, nextPageString: "Forget your password ? "),
                  //===============================
                  //==========================================================================

                  const SizedBox(
                    height: 40,
                  ),

                  const Divider(
                    color: Colors.black, // Color of the line
                    thickness: 2, // Thickness of the line
                  ),

                  //======================================================

                  const SizedBox(
                    height: 40,
                  ),

                  //===============================================================
                  // next button
                  SignUpLoginHelper().getNextButton(
                    page: const Start(),
                    context: context,
                    FormKey: FormKey,
                    onTap: () async {
                      if (FormKey.currentState!.validate()) {
                        try {
                          isLoading = true;
                          setState(() {});
                          await Userlogin();
                        } on FirebaseAuthException catch (e) {
                          print(e);
                        }
                        isLoading = false;
                        setState(() {});
                      }
                    },
                  ),
                  //===================================================
                  const SizedBox(
                    height: 20,
                  ),
                  //==================================================
                  SignUpLoginHelper().getCustomLink(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      nextPageString: "Sign Up!",
                      firstWord: "Don't Have an Account.  "),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> Userlogin() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: Email.text, password: Password.text);

      // Fetch user data from 'Clients' collection using ClientProvider
      final clientProvider = Provider.of<UserProvider>(context, listen: false);
      await clientProvider.fetchClientData(credential.user!.email!);

      SignUpLoginHelper.showAwesomeDialog(
          context: context,
          title: 'Succussefully logged in',
          description: 'Welcome back!',
          type: DialogType.success,
          page: clientProvider.client != null
              ? ClientProfile(email: Email.text)
              : FreeLancerProfile(email: Email.text)
          );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        SignUpLoginHelper.showAwesomeDialog(
            context: context,
            title: 'User not found',
            description: 'Try again, or sign up!',
            type: DialogType.error);
      } else if (e.code == 'wrong-password') {
        SignUpLoginHelper.showAwesomeDialog(
            context: context,
            title: 'Wrong password',
            description: 'Try again!',
            type: DialogType.error);
      } else {
        SignUpLoginHelper.showAwesomeDialog(
            context: context,
            title: 'Error occured',
            description: 'Check Your Email or password',
            type: DialogType.error);
      }
    }
  }
}
