// ignore_for_file: non_constant_identifier_names, must_be_immutable, use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/views/free_lancer.dart';
import 'package:freelance_app/views/start.dart';
import 'package:freelance_app/widgets/custom_multiple_dropdownlist.dart';
import 'package:freelance_app/widgets/customslider.dart';
import 'package:freelance_app/widgets/login_signup_helper.dart';
import 'package:freelance_app/widgets/profile_helpers.dart';
import 'package:freelance_app/widgets/text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SecondFreelancerSignup extends StatefulWidget {
  final String first_name;
  final String second_name;
  final String Email;
  final String password;
  final String country;

  SecondFreelancerSignup(
      {super.key,
      required this.Email,
      required this.first_name,
      required this.country,
      required this.password,
      required this.second_name});

  @override
  State<SecondFreelancerSignup> createState() => _SecondFreelancerSignupState();
}

class _SecondFreelancerSignupState extends State<SecondFreelancerSignup> {
  bool isloading = false;
  // For Form //================================================
  double currentSliderValue = 0;
  var price = TextEditingController();
  var aboutme = TextEditingController();
  var FormKey = GlobalKey<FormState>();
  //==============================================================
  // Create a CollectionReference called users that references the firestore collection
  CollectionReference clients = FirebaseFirestore.instance.collection('Users');

  Future<void> addFreeLancer() async {
    try {
      await clients.doc(widget.Email).set({
        'full_name': "${widget.first_name} ${widget.second_name}",
        'email': widget.Email,
        'Country': widget.country,
        'role': 'free_lancer',
        'rate': 0.0,
        'Skills': selected_skills,
        'Languages': selected_languages,
        'About me': aboutme.text,
        'Price': currentSliderValue
      });
    } catch (error) {
      SignUpLoginHelper.showAwesomeDialog(
          context: context,
          title: 'Error occured',
          description: "can't add freelancer , something went wrong :(",
          type: DialogType.error);
    }
  }

  List<String> selected_skills = [];
  List<String> selected_languages = [];

  List<String> skills = [
    "UI/UX",
    "Java",
    'Kotlin',
    'Java Script',
    'python',
    'dart',
    'angular',
    'mongo',
    'C++',
    'C',
    'Mobile app',
    'Flutter',
    'Android',
    'odoo',
  ];

  List<String> languages = ["Arabic", "Englisch", "Germany", "Frensch"];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    //========================================================

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: ModalProgressHUD(
        inAsyncCall: isloading,
        child: Form(
          key: FormKey,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      const Text(
                        "One more step !",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      //================================================
                      SizedBox(height: screenHeight / 20),
                      const Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(height: screenHeight / 25),
                      //=======================================================
                      Row(
                        children: [
                          Column(
                            children: [
                              Customslider(
                                text: "Enter your price \$/h",
                                currentSliderValue: currentSliderValue,
                                screenwidth: screenwidth,
                                max: 1500,
                                min: 0,
                                onChanged: (double value) {
                                  setState(() {
                                    currentSliderValue = value;
                                  });
                                },
                              ),
                              //===============================================
                            ],
                          ),
                          const Spacer(),
                          ProfileHelpers().getProfileContainer(
                            title: "Price",
                            item: "$currentSliderValue \$",
                          ),
                        ],
                      ),
                      //========================================================
                      SizedBox(height: screenHeight / 20),
                      const Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(height: screenHeight / 25),

                      //========================================================
                      SizedBox(
                        width: screenwidth,
                        height: 150,
                        child: MultipleChoiceDropdown(
                          buttontext: "Skills",
                          text: "Select Skills Below",
                          options: skills,
                          selectedOptions: selected_skills,
                          onOptionsChanged: (List<String> newoptions) {
                            setState(() {
                              selected_skills = newoptions;
                            });
                          },
                        ),
                      ),
                      //===================================================
                      const SizedBox(height: 0),
                      const Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 20),
                      //=================================================
                      SizedBox(
                        width: screenwidth,
                        height: 150,
                        child: MultipleChoiceDropdown(
                          buttontext: "Language",
                          text: "Select Languages Below",
                          options: languages,
                          selectedOptions: selected_languages,
                          onOptionsChanged: (List<String> newlist) {
                            setState(() {
                              selected_languages = newlist;
                            });
                          },
                        ),
                      ),
                      //==================================================
                      const SizedBox(height: 0),
                      const Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //=================================================
                      const Center(
                          child: Text(
                        "About You",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )),

                      CustomTextField(
                          text: " ",
                          Textfieldwidth: screenwidth,
                          initialObsecureText: false,
                          ErrorText: "Talk about yourself",
                          controller: aboutme,
                          dataType: 'str',
                          Textfieldheight: 100),
                      //===========================================
                      const Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //========================================
                      SizedBox(
                        height: 50,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (selected_languages.isEmpty ||
                                selected_skills.isEmpty ||
                                currentSliderValue == 0 ||
                                aboutme.text.isEmpty) {
                              SignUpLoginHelper.showAwesomeDialog(
                                  context: context,
                                  title: 'Error',
                                  description: 'Fill all the form please',
                                  type: DialogType.error);
                            } else {
                              if (FormKey.currentState!.validate()) {
                                try {
                                  isloading = true;
                                  setState(() {});
                                  await SignUpLoginHelper.UserRegister(
                                      widget.Email, widget.password);
                                  await addFreeLancer();
                                  SignUpLoginHelper.showAwesomeDialog(
                                      context: context,
                                      title: 'Successfully registered',
                                      description: 'Welcome, Good Luck!',
                                      type: DialogType.success,
                                      page: const Start());
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
                                    print("The Erooorrrrrrrrrrrrrrr is : " +
                                        e.code);
                                    print(widget.Email +
                                        " --" +
                                        widget.country +
                                        "--" +
                                        widget.first_name +
                                        "--" +
                                        widget.password +
                                        "--" +
                                        widget.second_name +
                                        "--" +
                                        selected_languages.toString() +
                                        selected_skills.toString());
                                  }
                                }
                                isloading = false;
                                setState(() {});
                              }
                            }
                          },
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
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
