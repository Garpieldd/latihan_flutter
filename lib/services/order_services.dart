import 'dart:convert';

import 'package:syntop_app/models/order_model.dart';
import 'package:http/http.dart' as http;

import '../config/config.dart';

class OrderServices {
  // function menampilkan keranjang
  Future<List<OrderModel>> listKeranjang(String userId) async {
    // siapkan variabel untuk menyimpan list prooduct
    List<OrderModel> listProductCart = [];

    try {
      // buat variabel untuk merequest web service
      var response = await http.get(Uri.parse(Config().urlKeranjangList + userId));

      // jika hasil output pd request status codenya adalah 200
      if (response.statusCode == 200) {
        // ambil isi body dari output json dan decode jsonnya
        var responseBody = json.decode(response.body);
        //print(responseBody);
        // buat variabel utk menampung data dari response body yg ingin diambil isinya
        List listProductCartResponse = responseBody['data'];
        // isikan variabel listProductCart di atas (pd baris 13) yg tadinya [] dengan isi dari variabel
        // listProductCartResponse yg sudah menerima response dr web service
        listProductCartResponse.forEach((data) {
          listProductCart.add(OrderModel.fromJson(data));
        });
      } else {
        listProductCart = [];
      }
    } catch (e) {
      print(e);
    }
    return listProductCart;
  }
}
