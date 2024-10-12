// ignore_for_file: non_constant_identifier_names, invalid_return_type_for_catch_error
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/views/client_profile.dart';
import 'package:freelance_app/views/login.dart';
import 'package:freelance_app/views/second_freelancer_signup.dart';
import 'package:freelance_app/views/start.dart';
import 'package:freelance_app/widgets/drop_down_list.dart';
import 'package:freelance_app/widgets/login_signup_helper.dart';
import 'package:freelance_app/widgets/text_field.dart';
import 'package:freelance_app/services/array_data_for_test.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUp extends StatefulWidget {
  final String role;

  const SignUp({super.key, required this.role});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var Fname = TextEditingController();
  var Sname = TextEditingController();
  var Email = TextEditingController();
  var Password = TextEditingController();
  var CountryChoosed = TextEditingController();
  var FormKey = GlobalKey<FormState>();
//=========================================================
//=========================================================

  bool isLoading = false;
  //=======================================
  Widget page = const Start();
  late int option;

  @override
  void initState() {
    super.initState();
    // Initialize the 'page' variable based on the role
    if (widget.role == 'FreeLancer') {
      option = 1;
    } else {
      option = 3;
    }
  }
//===================================================================

  @override
  Widget build(BuildContext context) {
    //========================================================
    // for text field width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double textformheight = screenHeight / 20;
    //=================================================
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference clients =
        FirebaseFirestore.instance.collection('Users');

    Future<void> addClient() async {
      try {
        await clients.doc(Email.text).set({
          'full_name': "${Fname.text} ${Sname.text}",
          'email': Email.text,
          'Country': CountryChoosed.text,
          'role': 'client',
          'rate': 0.0
        });
      } catch (error) {
        SignUpLoginHelper.showAwesomeDialog(
            context: context,
            title: 'Error occured',
            description: 'oops something went wrong :( , Try again later',
            type: DialogType.error);
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),

//=============================================================

      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Form(
                key: FormKey,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0)),
                      )),
                    ),
                    //==================================================
                    const Divider(
                      color: Colors.black, // Color of the line
                      thickness: 1, // Thickness of the line
                    ),
                    //==================================================
                    const SizedBox(
                      height: 15,
                    ),
                    //==================================================
                    Column(
                      children: [
                        Row(
                          children: [
                            //=====================================
                            CustomTextField(
                              text: "First name",
                              Textfieldheight: textformheight,
                              Textfieldwidth: screenWidth / 2 - 40,
                              initialObsecureText: false,
                              ErrorText: "Enter Your First Name",
                              controller: Fname,
                              dataType: 'str',
                            ),
                            //====================================
                            const SizedBox(
                              width: 20,
                            ),
                            //==============================
                            CustomTextField(
                                text: "Second name",
                                Textfieldheight: textformheight,
                                Textfieldwidth: screenWidth / 2 - 60,
                                initialObsecureText: false,
                                ErrorText: "Enter Your Second Name",
                                controller: Sname,
                                dataType: 'str')
                          ],
                        ),
                        //=======================
                        CustomTextField(
                            onChange: (data) {
                              Email.text = data;
                            },
                            text: "Email",
                            Textfieldheight: textformheight,
                            Textfieldwidth: screenWidth,
                            icon: Icons.email_outlined,
                            initialObsecureText: false,
                            ErrorText: "Enter Your Email",
                            controller: Email,
                            dataType: 'email'),
                        //======================
                        CustomTextField(
                            onChange: (data) {
                              Password.text = data;
                            },
                            text: "Password",
                            Textfieldheight: textformheight,
                            Textfieldwidth: screenWidth,
                            icon: Icons.no_encryption,
                            initialObsecureText: true,
                            icontextfield: Icons.remove_red_eye_rounded,
                            ErrorText: "Enter Your password",
                            controller: Password,
                            dataType: 'num'),
                        //==============================================================
                        DropDownList(
                          items: countriesList,
                          title: 'Country',
                          TextError: "Please choose ur Country",
                          controller: CountryChoosed,
                        )
                      ],
                    ),
                    //=========================================
                    const SizedBox(
                      height: 10,
                    ),
                    //==========================================
                    const Divider(
                      color: Colors.black, // Color of the line
                      thickness: 1, // Thickness of the line
                    ),
                    //============================================
                    // Next Button
                    SignUpLoginHelper().getNextButton(
                      page: page,
                      context: context,
                      FormKey: FormKey,
                      onTap: () async {
                        if (FormKey.currentState!.validate()) {
                          if (option == 1) {
                            page = SecondFreelancerSignup(
                              Email: Email.text,
                              country: CountryChoosed.text,
                              password: Password.text,
                              first_name: Fname.text,
                              second_name: Sname.text,
                            );
                            SignUpLoginHelper.showAwesomeDialog(
                                context: context,
                                title: 'One More Step :)',
                                description: 'Continue...',
                                type: DialogType.success,
                                page: page);
                          } else {
                            try {
                              isLoading = true;
                              setState(() {});
                              await SignUpLoginHelper.UserRegister(
                                  Email.text, Password.text);
                              await addClient();
                              page = ClientProfile(
                                email: Email.text,
                              );
                              SignUpLoginHelper.showAwesomeDialog(
                                  context: context,
                                  title: 'Successfully registered',
                                  description: 'Welcome, Good Luck!',
                                  type: DialogType.success,
                                  page: page);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                SignUpLoginHelper.showAwesomeDialog(
                                    context: context,
                                    title: 'Weak Password',
                                    description:
                                        'Enter a strong password and try again',
                                    type: DialogType.error);
                              } else if (e.code == 'email-already-in-use') {
                                SignUpLoginHelper.showAwesomeDialog(
                                    context: context,
                                    title: 'Email already used before',
                                    description:
                                        'Log in or try an another email',
                                    type: DialogType.error);
                              } else {
                                SignUpLoginHelper.showAwesomeDialog(
                                    context: context,
                                    title: 'Error occured',
                                    description: 'Try again',
                                    type: DialogType.error);
                              }
                            }
                          }
                          isLoading = false;
                          setState(() {});
                        }
                      },
                    ),

                    //==========================================================
                    const SizedBox(
                      height: 15,
                    ),
                    //==========================================================
                    SignUpLoginHelper().getCustomLink(
                      onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },nextPageString:  "Login",
                    firstWord:  "Do you Have an Account ?  "
                    ),
                    //==================================
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
