import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:syntop_app/config/config.dart';
import 'package:syntop_app/models/product_models.dart';

class ProductServices {

  // function untuk merequest product-new
  static Future<List<ProductModel>> getProductNew() async {

    // siapkan variabel untuk menyimpan list prooduct
    List<ProductModel> listProductNew = [];

    try {
      // buat variabel untuk merequest web service
      var response = await http.get( Uri.parse(Config().urlProdNew) );

      // jika hasil output pd request status codenya adalah 200
      if(response.statusCode == 200){
        // ambil isi body dari output json dan decode jsonnya
        var responseBody = json.decode(response.body);
        //print(responseBody);
        // buat variabel utk menampung data dari response body yg ingin diambil isinya
        List listProductNewResponse = responseBody['data'];
        // isikan variabel listProductNew di atas (pd baris 13) yg tadinya [] dengan isi dari variabel
        // listProductNewResponse yg sudah menerima response dr web service
        listProductNewResponse.forEach((data) { 
          listProductNew.add(ProductModel.fromJson(data));
        });

      } else {
        listProductNew = [];
      }
    } catch (e) {
      print(e);
    }
    return listProductNew;
  }

  // function untuk merequest product-new
  static Future<List<ProductModel>> getProductRecomended() async {

    // siapkan variabel untuk menyimpan list prooduct
    List<ProductModel> listProductRecomended = [];

    try {
      // buat variabel untuk merequest web service
      var response = await http.get( Uri.parse(Config().urlProdRekomen) );

      // jika hasil output pd request status codenya adalah 200
      if(response.statusCode == 200){
        // ambil isi body dari output json dan decode jsonnya
        var responseBody = json.decode(response.body);
        print(responseBody);
        // buat variabel utk menampung data dari response body yg ingin diambil isinya
        List listProductRecomendedResponse = responseBody['data'];
        // isikan variabel listProductRecomended di atas (pd baris 13) yg tadinya [] dengan isi dari variabel
        // listProductRecomendedResponse yg sudah menerima response dr web service
        listProductRecomendedResponse.forEach((data) { 
          listProductRecomended.add(ProductModel.fromJson(data));
        });

      } else {
        listProductRecomended = [];
      }
    } catch (e) {
      print(e);
    }
    return listProductRecomended;
  }

   static Future<List<ProductModel>> searchProduct(String keyword) async {

    // siapkan variabel untuk menyimpan list prooduct
    List<ProductModel> listProductSearch = [];

    try {
      // buat variabel untuk merequest web service
      var response = await http.get( Uri.parse(Config().urlProdSearch + keyword) );

      // jika hasil output pd request status codenya adalah 200
      if(response.statusCode == 200){
        // ambil isi body dari output json dan decode jsonnya
        var responseBody = json.decode(response.body);
        //print(responseBody);
        // buat variabel utk menampung data dari response body yg ingin diambil isinya
        List listProductSearchResponse = responseBody['data'];
        // isikan variabel listProductSearch di atas (pd baris 13) yg tadinya [] dengan isi dari variabel
        // listProductSearchResponse yg sudah menerima response dr web service
        listProductSearchResponse.forEach((data) { 
          listProductSearch.add(ProductModel.fromJson(data));
        });

      } else {
        listProductSearch = [];
      }
    } catch (e) {
      print(e);
    }
    return listProductSearch;
  }
  

}