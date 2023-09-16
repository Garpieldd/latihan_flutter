import 'package:flutter/material.dart';
import 'package:syntop_app/pages/sign_in_page.dart';
import 'package:syntop_app/themes/themes.dart';

class OnBoardPage extends StatelessWidget {
  const OnBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img-splash2.png',
              width: 250,
              height: 250,
            ),
            Text("Temukan Laptop terbaik\nhanya disini!", style: blackTextStyle.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ), textAlign: TextAlign.center, ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) => SignInPage() ));
              },
              child: Container(
                width: 150,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: primaryColor
                ),
                child: Center(
                  child: Text("Masuk", style: whiteTextStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ), ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text("Eksplor sekarang >", style: blackTextStyle.copyWith(
              decoration: TextDecoration.underline
            ), ),
          ],
        ),
      ),
    );
  }
}