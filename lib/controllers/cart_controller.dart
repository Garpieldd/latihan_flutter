import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';
import 'package:syntop_app/models/product_models.dart';
import 'package:syntop_app/pages/now_shop_page.dart';
import 'package:syntop_app/themes/themes.dart';

import '../config/config.dart';

class CartController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoading2 = false.obs;
  int grandTotal = 0;

  Future postCart(String productId, String jumlah) async {
    var url = Uri.parse(Config().urlKeranjangPost);

    try {
      isLoading.value = true;
      final response = await http.post(url, body: {
        'product_id': productId,
        'user_id': SpUtil.getInt("id_user").toString(),
        'jumlah': jumlah,
      });

      // print(response.body);

      // agar isi dari response body bisa dipakai, maka harus didecode dulu
      var responseDecode = json.decode(response.body);

      if (response.statusCode == 200) {
        isLoading.value = false;

        // tampilkan snackbar produk berhasil dimasukkan dalam keranjang
        Get.snackbar(
          "Success",
          responseDecode["message"],
          duration: Duration(seconds: 1),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: greenColor,
          colorText: whiteColor,
          showProgressIndicator: true,
          margin: EdgeInsets.only(
            bottom: 10,
            top: 10,
            right: 10,
            left: 10
          ),
        );
      } else {
        isLoading.value = false;

        // tampilkan pesan error
        Get.snackbar(
          "Error", responseDecode["message"],
          snackPosition: SnackPosition.TOP,
          backgroundColor: primaryColor,
          colorText: whiteColor,
        );
      }

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: primaryColor,
        colorText: whiteColor,
      );
    }
  }

  Future postCartNow(String productId, ProductModel dataProduct, String jumlah) async {
    var url = Uri.parse(Config().urlKeranjangPost);

    try {
      isLoading2.value = true;
      final response = await http.post(url, body: {
        'product_id': productId,
        'user_id': SpUtil.getInt("id_user").toString(),
        'jumlah': jumlah,
      });

      // print(response.body);

      // agar isi dari response body bisa dipakai, maka harus didecode dulu
      var responseDecode = json.decode(response.body);

      if (response.statusCode == 200) {
        // print(responseDecode["data"]["id"]);
        isLoading2.value = false;
        // ambil beberapa field/parameter dari response web service
        var idCart = responseDecode["data"]["id"];
        var jumlahBeli = responseDecode["data"]["jumlah"];
        var totalHarga = responseDecode["data"]["totalharga"];
       
        // tampilkan snackbar produk berhasil dimasukkan dalam keranjang
        Get.snackbar(
          "Success",
          responseDecode["message"],
          duration: Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: greenColor,
          colorText: whiteColor,
          showProgressIndicator: true,
          margin: EdgeInsets.only(
            bottom: 10,
            top: 10,
            right: 10,
            left: 10
          ),
        );

        Get.to(NowShopPage(dataProduct: dataProduct, idCart: idCart, jumlahBeli: jumlahBeli, totalHarga: totalHarga,));

      } else {
        
        isLoading2.value = false;

        // tampilkan pesan error
        Get.snackbar(
          "Error", responseDecode["message"],
          snackPosition: SnackPosition.TOP,
          backgroundColor: primaryColor,
          colorText: whiteColor,
        );
      }

      isLoading2.value = false;
    } catch (e) {
      isLoading2.value = false;
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: primaryColor,
        colorText: whiteColor,
      );
    }
  }

  // GET DATA KERANJANG
  void getCart() async {
    try {
      isLoading.value = true;

      var response = await http.get(Uri.parse(Config().urlKeranjangList + SpUtil.getInt("id_user").toString() ));

      if(response.statusCode == 200) {

        isLoading.value = false;
        // ambil isi body dari output json dan decode jsonnya
        var responseBody = json.decode(response.body);

        grandTotal = responseBody["grandtotal"];
        update();
        print(responseBody);
      }
    } catch (e) {
       isLoading.value = false;
      print(e);
    }
  }
}