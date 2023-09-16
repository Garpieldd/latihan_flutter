import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syntop_app/controllers/auth_controllers.dart';
import 'package:syntop_app/pages/home_page.dart';
import 'package:syntop_app/pages/landing_page.dart';
import 'package:syntop_app/pages/sign_up_page.dart';
import 'package:syntop_app/themes/themes.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  // panggil AuthController
  final authC = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: ListView(
        children: [
          // SECTION 1
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.20,
            ),
            child: Column(
              children: [
                Text(
                  "Welcome Back!",
                  style: primaryTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Masuk untuk mulai eksplor dan belanja",
                  style: greyTextStyle,
                ),
              ],
            ),
          ),

          // SECTION 2 FORM INPUT
          Container(
            margin: EdgeInsets.only(top: 22, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Email",
                  style: blackTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  controller: authC.email,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: whiteColor,
                    hintText: "Masukkan Email",
                    hintStyle: greyTextStyle,
                    border: InputBorder.none,
                  ),
                ),
                SizedBox(
                  height: 23,
                ),
                Text(
                  "Password",
                  style: blackTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  controller: authC.password,
                  obscureText: true,
                  decoration: InputDecoration(
                    suffix: Icon(
                      Icons.visibility_off,
                      color: greyColor,
                    ),
                    filled: true,
                    fillColor: whiteColor,
                    hintText: "Masukkan Password",
                    hintStyle: greyTextStyle,
                    border: InputBorder.none,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "Lupa password ?",
                    style: primaryTextStyle,
                  ),
                ),
                SizedBox(
                  height: 29,
                ),
                InkWell(
                  onTap: () {
                    authC.login();
                  },
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: primaryColor),
                    child: Center(
                      child: Obx(
                        () => authC.isLoading == true
                            ? CircularProgressIndicator(
                                color: whiteColor,
                              )
                            : Text(
                                "Daftar",
                                style: whiteTextStyle.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // SECTION 3 Text Daftar
          Container(
            margin: EdgeInsets.only(
              top: 235,
              left: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Belum punya akun? ",
                  style: greyTextStyle,
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                    },
                    child: Text(
                      "Daftar",
                      style: primaryTextStyle,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
