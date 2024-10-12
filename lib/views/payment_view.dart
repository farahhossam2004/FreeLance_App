// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:freelance_app/widgets/payment_details_view_body.dart';

class PaymentView extends StatelessWidget {
  PaymentView({super.key, required this.Personname});

  String Personname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Center(
            child: Text(
          "Payement Method",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        )),
      ),
      body: Column(
        children: [PaymentDetailsViewBody(Personname: Personname)],
      ),
    );
  }
}
