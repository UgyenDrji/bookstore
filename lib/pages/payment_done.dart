import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class PaymentDone extends StatelessWidget {
  const PaymentDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/animation/done.json"),
          ],
        ),
      ),
    );
  }
}
