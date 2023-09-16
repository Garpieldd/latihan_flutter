import 'dart:convert';

import 'package:latihan_fatih/model/berita_model.dart';
import 'package:http/http.dart' as http;
import 'package:latihan_fatih/config/config.dart';

class BeritaService {
  Future<List<BeritaModel>> listBerita() async {
    List<BeritaModel> listNewsPage = [];

    try {
      var response = await http.get(Uri.parse(Config.urlApi));

      if (response.statusCode == 200) {
        var responseBody = json.decode(response.body);
        List listNewsPageResponse = responseBody['articles'];
        listNewsPageResponse.forEach((data) {
          listNewsPage.add(BeritaModel.fromJson(data));
        });
      } else {
        listNewsPage = [];
      }
    } catch (e) {
      print(e);
    }
    return listNewsPage;
  }
}