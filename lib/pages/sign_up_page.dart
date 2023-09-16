import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:syntop_app/themes/themes.dart';

import '../controllers/auth_controllers.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authC = Get.put(AuthController());

    return Scaffold(
      backgroundColor: bgColor,
      body: ListView(
        children: [
          // SECTION 1
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.05,
            ),
            child: Column(
              children: [
                Text(
                  "Buat Akun",
                  style: primaryTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Temukan Laptop Impian mu di sini",
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
                  "Username",
                  style: blackTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  controller: authC.username,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: whiteColor,
                    hintText: "Masukkan Username",
                    hintStyle: greyTextStyle,
                    border: InputBorder.none,
                  ),
                ),
                SizedBox(
                  height: 23,
                ),
                Text(
                  "No Telepon",
                  style: blackTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  controller: authC.telepon,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: whiteColor,
                    hintText: "Masukkan Telepon",
                    hintStyle: greyTextStyle,
                    border: InputBorder.none,
                  ),
                ),
                SizedBox(
                  height: 23,
                ),
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
                SizedBox(
                  height: 29,
                ),
                InkWell(
                  onTap: () {
                    authC.register();
                  },
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: primaryColor),
                    child: Center(
                      child: Obx(() => 

                      authC.isLoading == true
                      ?
                        CircularProgressIndicator(
                          color: whiteColor,
                        )
                      :
                      Text(
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

          // SECTION 3 Text Masuk
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.25,
              left: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sudah punya akun? ",
                  style: greyTextStyle,
                ),
                Text(
                  "Masuk",
                  style: primaryTextStyle,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
