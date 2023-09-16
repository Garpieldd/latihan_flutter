import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:sp_util/sp_util.dart';
import 'package:syntop_app/pages/home_page.dart';
import 'package:syntop_app/pages/upload_bukti_bayar_page.dart';

import '../config/config.dart';
import '../themes/themes.dart';

class CheckoutController extends GetxController {
  // siapkan variabel untuk menampung inputan
  TextEditingController nama = TextEditingController();
  TextEditingController nohp = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController kotaKecamatan = TextEditingController();
  TextEditingController catatan = TextEditingController();

  RxBool isLoading = false.obs;
  // function post checkout berdasarkan id keranjang yang dipilih dan sesuai dengan user login
  Future postCheckoutById(String keranjangId, String jenisPembayaran,
      String jenisPengiriman) async {
    var url = Uri.parse(Config().urlChekoutPostbyId);

    try {
      isLoading.value = true;
      final response = await http.post(url, body: {
        'keranjang_id': keranjangId,
        'user_id': SpUtil.getInt("id_user").toString(),
        'nama': nama.text,
        'nohp': nohp.text,
        'alamat': alamat.text,
        'kota_kecamatan': kotaKecamatan.text,
        'jenis_pembayaran': jenisPembayaran,
        'jenis_pengiriman': jenisPengiriman,
        'catatan': catatan.text
      });

      // print(response.body);

      // agar isi dari response body bisa dipakai, maka harus didecode dulu
      var responseDecode = json.decode(response.body);

      if (response.statusCode == 200) {
        isLoading.value = false;
        Get.snackbar("Success", responseDecode["message"]);

        // arahkan ke halaman landing/homepage dsb
        Get.to(HomePage());
      } else {
        isLoading.value = false;

        // tampilkan pesan error
        Get.snackbar(
          "Error",
          responseDecode["message"],
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

  // upload bukti bayar
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  void getImage(ImageSource imageSource) async {
    final _picker = ImagePicker();
    final PickedFile = await _picker.pickImage(
        source: imageSource, maxHeight: 720, maxWidth: 1280);

    if (PickedFile != null) {
      // mengisikan nilai pada variabel selectedImagePath dengan pickedFile.path
      selectedImagePath.value = PickedFile.path;

      // resize image
      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              "Mb";

      // selectedImagePath.value = pickedFile.path
      selectedImagePath.value = PickedFile.path;
    } else {
      // jika cancel pengambilan gambar
      Get.snackbar('Warning!', 'Tidak ada gambar yang dipilih',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color.fromARGB(255, 218, 113, 28),
          margin: const EdgeInsets.only(bottom: 6, right: 6, left: 6),
          colorText: Colors.white);
    }
  }

  // post upload bukti bayar
  Future<void> sendData(String checkoutId) async {
    var url = Uri.parse(Config().urlUploadBuktiBayar);
    try {
      isLoading.value = true;
      var request = http.MultipartRequest('POST', url);
      request.files.add(await http.MultipartFile.fromPath(
        'buktibayar', selectedImagePath.value));
      request.fields['checkout_id'] = checkoutId;

      http.Response response =
          await http.Response.fromStream(await request.send());
      var responseDecode = jsonDecode(response.body);

      if (responseDecode['success'] == true) {
        Get.snackbar("Success",
        responseDecode['message'],
        colorText: Colors.white,
        backgroundColor: Colors.green,
        margin: const EdgeInsets.only(
          top: 8,
          left: 6,
          right: 6,
        ),);
        isLoading.value = false;
        Get.off(HomePage());
        
      } else {
        isLoading.value = false;
        Get.snackbar(
          "Error", 
          responseDecode['message'] + ", Silahkan coba lagi",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          margin: const EdgeInsets.only(
            top: 8,
            left: 6,
            right: 6,
          ),);
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        "error", 
        "$e, Silahkan coba lagi",
        colorText: Colors.white,
        );
    }
  }
}
