
import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:freelance_app/widgets/customslider.dart';
import 'package:freelance_app/widgets/login_signup_helper.dart';
import 'package:freelance_app/widgets/payemnt_item.dart';
import 'package:freelance_app/widgets/profile_helpers.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  PaymentDetailsViewBody({super.key, required this.Personname});

  final String Personname;

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final List<String> images = ['assets/visa.png', 'assets/paypal.png'];
  int activeIndex = 0;
  double currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          const SizedBox(height: 30),
          SizedBox(
            height: 62,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                  child: Payemnt_item(
                    isActive: activeIndex == index,
                    image: images[index],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          const Divider(height: 2, color: Colors.black),
          const SizedBox(height: 20),

          if (activeIndex == 0)
            const Text(
              "This Feature not added yet :(",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            )
          else ...[
            Text("Send to " + widget.Personname,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Row(
              children: [
                Column(
                  children: [
                    Customslider(
                      text: "Enter the amount of money \$",
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
                  ],
                ),
                const Spacer(),
                ProfileHelpers().getProfileContainer(
                  title: "amount",
                  item: "$currentSliderValue \$",
                ),
              ],
            ),
          ],

          const SizedBox(height: 320),
          SizedBox(
            height: 40,
            width: screenwidth / 2,
            child: ElevatedButton(
              onPressed: () {
                // Validate payment details before proceeding
                if (activeIndex == 0) {
                  Navigator.pop(context);
                } else if (currentSliderValue <= 0) {
                  SignUpLoginHelper.showAwesomeDialog(
                    context: context,
                    title: 'Choose the amount of money',
                    description: 'Move the slider to select an amount.',
                    type: DialogType.error,
                  );
                } else {
                  // Proceed with PayPal payment
                  _processPayment();
                }
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(
                  const Color.fromARGB(255, 36, 148, 40),
                ),
              ),
              child: const Text(
                "continue",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _processPayment() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: "Afz6QdNNgu__zFAymgx3_-Icu7juIdZJUynXHaLtzryfqG3u4amTIpldgRIxojkHt95c5eOxuV8VzEcT",
        secretKey: "EJNkC1_4K979udn6hHspcLTVu97DxUaIq1c8yKt808imeA0HmguwIoY7XzbYFmkqT219N_dybhiFNe8Z",
        transactions: [
          {
            "amount": {
              "total": currentSliderValue.toString(),
              "currency": "USD",
              "details": {
                "subtotal": currentSliderValue.toString(),
                "shipping": '0',
                "shipping_discount": 0
              }
            },
            "description": "The payment transaction description.",
            "item_list": {
              "items": [
                {
                  "name": "Payment for ${widget.Personname}",
                  "quantity": '1',
                  "price": currentSliderValue.toString(),
                  "currency": "USD"
                },
              ],
            }
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) {
          // Handle successful payment
          SignUpLoginHelper.showAwesomeDialog(
                    context: context,
                    title: 'Transiction Success',
                    description: 'Thanks',
                    type: DialogType.success,
                  );
          Navigator.pop(context); // Go back after success
        },
        onError: (error) {
          // Handle payment error
          log("Payment Error: $error" );
          SignUpLoginHelper.showAwesomeDialog(
            context: context,
            title: 'Payment Error',
            description: 'An error occurred during payment. Please try again.',
            type: DialogType.error,
          );
          Navigator.pop(context);
        },
        onCancel: () {
          // Handle payment cancellation
          log("Payment Cancelled" );
          SignUpLoginHelper.showAwesomeDialog(
            context: context,
            title: 'Payment Cancelled',
            description: 'You have cancelled the payment process.',
            type: DialogType.warning,
          );
          Navigator.pop(context);
        },
      ),
    ));
  }
}
