import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';
import 'package:syntop_app/config/config.dart';
import 'package:http/http.dart' as http;
import 'package:syntop_app/pages/home_page.dart';
import 'package:syntop_app/pages/splash_screen_page.dart';
import 'package:syntop_app/themes/themes.dart';

class AuthController extends GetxController {
  // siapkan variabel untuk menampung inputan
  TextEditingController username = TextEditingController();
  TextEditingController telepon = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  // siapkan loading saat proses terjadi
  // dengan menyiapkan satu variabel yg bertipe boolean
  RxBool isLoading = false.obs;

  // function utk menghapus inputan setelah proses terjadi
  void clearInputan(){
    username.clear();
    telepon.clear();
    email.clear();
    password.clear();
  }

  // function register
  Future register() async {
    print(Config().urlRegister);
    // url endpoint
    var url = Uri.parse(Config().urlRegister);

    try {
      isLoading.value = true;
      final response = await http.post(url, body: {
        'name' : username.text,
        'email' : email.text,
        'password' : password.text,
        'telepon' : telepon.text,
      } );

      // print(response.body);
      
      // agar isi dari response body bisa dipakai, maka harus didecode dulu
      var responseDecode = json.decode(response.body);

      // handle error Validation
      Map<String, dynamic> dataError = responseDecode["data"];   

      if(response.statusCode == 200){
        // simpan datanya di memori telepon
        SpUtil.putInt("id_user", responseDecode["data"]["id"]);
        SpUtil.putString("nama_user", responseDecode["data"]["name"]);
        SpUtil.putString("email_user", responseDecode["data"]["email"]);
        SpUtil.putString("telepon", responseDecode["data"]["telepon"]);

        clearInputan();

        isLoading.value = false;

        // arahkan ke halaman landing/homepage dsb
        Get.offAll(HomePage());
      } else {
        isLoading.value = false;

        // tampilkan pesan error
        Get.snackbar("Error", responseDecode["message"] == "Error Validation" ? dataError.toString() : responseDecode["message"], snackPosition: SnackPosition.TOP, backgroundColor: primaryColor, colorText: whiteColor,  );
      }

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.TOP, backgroundColor: primaryColor, colorText: whiteColor,);
    }
  }

  // function login
  Future login() async {
    print(Config().urlRegister);
    // url endpoint
    var url = Uri.parse(Config().urlLogin);

    try {
      isLoading.value = true;
      final response = await http.post(url, body: {
        'email' : email.text,
        'password' : password.text,
      } );

      // print(response.body);
      
      // agar isi dari response body bisa dipakai, maka harus didecode dulu
      var responseDecode = json.decode(response.body);

      // handle error Validation
      Map<String, dynamic> dataError = responseDecode["data"];   

      if(response.statusCode == 200){
        // simpan datanya di memori telepon
        SpUtil.putInt("id_user", responseDecode["data"]["id"]);
        SpUtil.putString("nama_user", responseDecode["data"]["name"]);
        SpUtil.putString("email_user", responseDecode["data"]["email"]);
        SpUtil.putString("telepon", responseDecode["data"]["telepon"]);

        clearInputan();

        isLoading.value = false;

        // arahkan ke halaman landing/homepage dsb
        Get.offAll(HomePage());
      } else {
        isLoading.value = false;

        // tampilkan pesan error
        Get.snackbar("Error", responseDecode["message"] == "Error Validation" ? dataError.toString() : responseDecode["message"], snackPosition: SnackPosition.TOP, backgroundColor: primaryColor, colorText: whiteColor,  );
      }

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.TOP, backgroundColor: primaryColor, colorText: whiteColor,);
    }
  }

  // function logout
  Future logout() async {
    // url endpoint
    var url = Uri.parse(Config().urlLogout);

    try {
      isLoading.value = true;
      final response = await http.get(url);

      // print(response.body);
      
      // agar isi dari response body bisa dipakai, maka harus didecode dulu
      var responseDecode = json.decode(response.body);

      // handle error Validation 

      if(response.statusCode == 200){
        SpUtil.clear();

        Get.snackbar("Success", responseDecode["message"], snackPosition: SnackPosition.TOP, backgroundColor: greenColor, colorText: whiteColor,);
        // arahkan ke halaman landing/homepage dsb
        Get.offAll(SplashScreenPage());
      } else {
        isLoading.value = false;

        // tampilkan pesan error
        Get.snackbar("Error", responseDecode["message"], snackPosition: SnackPosition.TOP, backgroundColor: primaryColor, colorText: whiteColor,  );
      }

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.TOP, backgroundColor: primaryColor, colorText: whiteColor,);
    }
  }


}