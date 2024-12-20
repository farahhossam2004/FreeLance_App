import 'package:flutter/material.dart';
import 'package:upi_payment_qrcode_generator/upi_payment_qrcode_generator.dart';


/// Creates The UPI Payment QRCode
class Payments extends StatefulWidget {
  const Payments({super.key});

  @override
  State<Payments> createState() => _MyAppState();
}

class _MyAppState extends State<Payments> {
  //TODO Change UPI ID
  final upiDetails = UPIDetails(
      upiID: "9167877725@axl",
      payeeName: "Agnel Selvan",
      amount: 1,
      transactionNote: "Hello World");
  final upiDetailsWithoutAmount = UPIDetails(
    upiID: "9167877725@axl",
    payeeName: "Agnel Selvan",
    transactionNote: "Hello World",
  );

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('UPI Payment QRCode Generator' , style: TextStyle(color: Colors.white , fontSize: 20 , fontWeight: FontWeight.bold),)),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("UPI Payment QRCode without Amount",
                style: TextStyle(fontWeight: FontWeight.bold)),
            UPIPaymentQRCode(
              upiDetails: upiDetailsWithoutAmount,
              size: 220,
              embeddedImagePath: 'assets/images/logo.png',
              embeddedImageSize: const Size(60, 60),
              eyeStyle: const QrEyeStyle(
                eyeShape: QrEyeShape.circle,
                color: Colors.black,
              ),
              dataModuleStyle: const QrDataModuleStyle(
                dataModuleShape: QrDataModuleShape.circle,
                color: Colors.black,
              ),
            ),
            Text(
              "Scan QR to Pay",
              style: TextStyle(color: Colors.grey[600], letterSpacing: 1.2),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("UPI Payment QRCode with Amount",
                style: TextStyle(fontWeight: FontWeight.bold)),
            UPIPaymentQRCode(
              upiDetails: upiDetails,
              size: 220,
              upiQRErrorCorrectLevel: UPIQRErrorCorrectLevel.low,
            ),
            Text(
              "Scan QR to Pay",
              style: TextStyle(color: Colors.grey[600], letterSpacing: 1.2),
            ),
          ],
        ),
      ),
    );
  }
}
