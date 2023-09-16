import 'package:flutter/material.dart';
import 'package:syntop_app/themes/themes.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/bro.png',
              width: 320,
              height: 257,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Pesananmu\nTerkonfirmasi",
              style: blackTextStyle.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Silahkan tunggu barangmu sampai di tujuan",
              style: blackTextStyle,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 180,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: primaryColor),
              child: Center(
                child: Text(
                  "kembali ke beranda",
                  style: whiteTextStyle.copyWith(
                      fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
