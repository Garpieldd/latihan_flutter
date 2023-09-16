import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:syntop_app/models/checkout_model.dart';

import '../config/config.dart';

class CheckoutServices {
  // function menampilkan keranjang
  Future<List<CheckoutModel>> listCheckoutNew(String userId) async {
    // siapkan variabel untuk menyimpan list prooduct
    List<CheckoutModel> listCheckoutNew = [];

    try {
      // buat variabel untuk merequest web service
      var response = await http.get(Uri.parse(Config().urlCheckoutListBaru + userId));

      // jika hasil output pd request status codenya adalah 200
      if (response.statusCode == 200) {
        // ambil isi body dari output json dan decode jsonnya
        var responseBody = json.decode(response.body);
        //print(responseBody);
        // buat variabel utk menampung data dari response body yg ingin diambil isinya
        List listCheckoutNewResponse = responseBody['data'];
        // isikan variabel listCheckoutNew di atas (pd baris 13) yg tadinya [] dengan isi dari variabel
        // listCheckoutNewResponse yg sudah menerima response dr web service
        listCheckoutNewResponse.forEach((data) {
          listCheckoutNew.add(CheckoutModel.fromJson(data));
        });
      } else {
        listCheckoutNew = [];
      }
    } catch (e) {
      print(e);
    }
    return listCheckoutNew;
  }

  Future<List<CheckoutModel>> listCheckoutProses(String userId) async {
    // siapkan variabel untuk menyimpan list prooduct
    List<CheckoutModel> listCheckoutProses = [];

    try {
      // buat variabel untuk merequest web service
      var response = await http.get(Uri.parse(Config().urlCheckoutListProses + userId));

      // jika hasil output pd request status codenya adalah 200
      if (response.statusCode == 200) {
        // ambil isi body dari output json dan decode jsonnya
        var responseBody = json.decode(response.body);
        //print(responseBody);
        // buat variabel utk menampung data dari response body yg ingin diambil isinya
        List listCheckoutProsesResponse = responseBody['data'];
        // isikan variabel listCheckoutProses di atas (pd baris 13) yg tadinya [] dengan isi dari variabel
        // listCheckoutProsesResponse yg sudah menerima response dr web service
        listCheckoutProsesResponse.forEach((data) {
          listCheckoutProses.add(CheckoutModel.fromJson(data));
        });
      } else {
        listCheckoutProses = [];
      }
    } catch (e) {
      print(e);
    }
    return listCheckoutProses;

    
  }

  Future<List<CheckoutModel>> listCheckoutSelesai(String userId) async {
    // siapkan variabel untuk menyimpan list prooduct
    List<CheckoutModel> listCheckoutSelesai = [];

    try {
      // buat variabel untuk merequest web service
      var response = await http.get(Uri.parse(Config().urlCheckoutListSelesai + userId));

      // jika hasil output pd request status codenya adalah 200
      if (response.statusCode == 200) {
        // ambil isi body dari output json dan decode jsonnya
        var responseBody = json.decode(response.body);
        //print(responseBody);
        // buat variabel utk menampung data dari response body yg ingin diambil isinya
        List listCheckoutSelesaiResponse = responseBody['data'];
        // isikan variabel listCheckoutSelesai di atas (pd baris 13) yg tadinya [] dengan isi dari variabel
        // listCheckoutSelesaiResponse yg sudah menerima response dr web service
        listCheckoutSelesaiResponse.forEach((data) {
          listCheckoutSelesai.add(CheckoutModel.fromJson(data));
        });
      } else {
        listCheckoutSelesai = [];
      }
    } catch (e) {
      print(e);
    }
    return listCheckoutSelesai;

    
  }
}