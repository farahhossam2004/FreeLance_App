// ignore_for_file: non_constant_identifier_names

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/models/feedbacks.dart';
import 'package:freelance_app/views/start.dart';
import 'package:freelance_app/widgets/login_signup_helper.dart';
import 'package:freelance_app/widgets/starwidget.dart';
import 'package:freelance_app/widgets/text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Rate extends StatefulWidget {
  Rate({super.key, required this.email});

  String email;

  @override
  State<Rate> createState() => _RateState();
}

class _RateState extends State<Rate> {
  String comment = '';
  var textcomment = TextEditingController();

  List<bool> rates_choosed = [false, false, false, false, false];
  bool isactive = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    int numberofstars = 0;
    for (int i = 0; i < rates_choosed.length; i++) {
      if (rates_choosed[i] == true) {
        numberofstars += 1;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "feedbacks",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 14, 175, 57),
      ),
      body: ModalProgressHUD(
        inAsyncCall: isactive,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                height: 2,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          rates_choosed[0] = !rates_choosed[0];
                          if (rates_choosed[0] == false) {
                            rates_choosed[1] = false;
                            rates_choosed[2] = false;
                            rates_choosed[3] = false;
                            rates_choosed[4] = false;
                          }
                        });
                      },
                      child: Starwidget(isActive: rates_choosed[0])),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          rates_choosed[1] = !rates_choosed[1];
                          if (rates_choosed[0] == false) {
                            rates_choosed[0] = !rates_choosed[0];
                          }
                          if (rates_choosed[1] == false) {
                            rates_choosed[2] = false;
                            rates_choosed[3] = false;
                            rates_choosed[4] = false;
                          }
                        });
                      },
                      child: Starwidget(isActive: rates_choosed[1])),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          rates_choosed[2] = !rates_choosed[2];
                          if (rates_choosed[1] == false) {
                            rates_choosed[1] = !rates_choosed[1];
                          }
                          if (rates_choosed[0] == false) {
                            rates_choosed[0] = !rates_choosed[0];
                          }
                          if (rates_choosed[2] == false) {
                            rates_choosed[3] = false;
                            rates_choosed[4] = false;
                          }
                        });
                      },
                      child: Starwidget(isActive: rates_choosed[2])),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          rates_choosed[3] = !rates_choosed[3];
                          if (rates_choosed[1] == false) {
                            rates_choosed[1] = !rates_choosed[1];
                          }
                          if (rates_choosed[0] == false) {
                            rates_choosed[0] = !rates_choosed[0];
                          }
                          if (rates_choosed[2] == false) {
                            rates_choosed[2] = !rates_choosed[2];
                          }
                          if (rates_choosed[3] == false) {
                            rates_choosed[4] = false;
                          }
                        });
                      },
                      child: Starwidget(isActive: rates_choosed[3])),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          rates_choosed[4] = !rates_choosed[4];
                          if (rates_choosed[1] == false) {
                            rates_choosed[1] = !rates_choosed[1];
                          }
                          if (rates_choosed[0] == false) {
                            rates_choosed[0] = !rates_choosed[0];
                          }
                          if (rates_choosed[2] == false) {
                            rates_choosed[2] = !rates_choosed[2];
                          }
                          if (rates_choosed[3] == false) {
                            rates_choosed[3] = !rates_choosed[3];
                          }
                        });
                      },
                      child: Starwidget(isActive: rates_choosed[4])),
                ],
              ),
            ),
            //===========================================================
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                height: 2,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //=========================================================
            const Text(
              "Any Comment ?",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                onChange: (data) {
                  comment = data;
                },
                text: "Add Your Comment here",
                Textfieldwidth: screenWidth,
                initialObsecureText: false,
                ErrorText: "Fill the field",
                controller: textcomment,
                Textfieldheight: screenHeight / 15,
                dataType: 'str'),

            Container(
              height: 80,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      numberofstars.toString(),
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Starwidget(isActive: true)
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                height: 2,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                onPressed: () async {
                  setState(() {
                    isactive = !isactive;
                  });
                  await updateUserField(
                      email: widget.email, rate: numberofstars);

                  setState(() {
                    isactive = !isactive;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                    const Color.fromARGB(255, 36, 148, 40),
                  ),
                ),
                child: const Text(
                  "Send feedback",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> updateUserField({
    required String email,
    required int rate,
  }) async {
    try {
      // Reference to the user's document
      CollectionReference clients =
          FirebaseFirestore.instance.collection('Users');
      DocumentReference clientRef = clients.doc(email);

      // Fetch the current array of rates
      DocumentSnapshot snapshot = await clientRef.get();
      List<dynamic> currentRates = snapshot['rate'] ?? [];

      // Add the new rate to the array, allowing duplicates
      currentRates.add(rate);

      // Update the document with the new array
      await clientRef.update({
        'rate': currentRates,
      });

      SignUpLoginHelper.showAwesomeDialog(
        context: context,
        title: 'Feedback Success with $rate Stars',
        description: '',
        type: DialogType.success,
      );
    } catch (e) {
      SignUpLoginHelper.showAwesomeDialog(
        context: context,
        title: 'Error happened',
        description: '',
        type: DialogType.error,
      );
    }
  }
}
