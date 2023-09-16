import 'package:flutter/material.dart';
import 'package:syntop_app/pages/search_result_page.dart';
import 'package:syntop_app/themes/themes.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // variabel penampung nilai pd kolom
  TextEditingController keyword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Container(
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.15,
            left: 20,
            right: 20),
        child: Center(
          child: Column(
            children: [
              Text(
                "Cari Laptop Impianmu Sekarang",
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: keyword,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      if (keyword.text != "") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) =>
                                    SearchResultPage(keyword: keyword.text)));

                      }
                    },
                    icon: Icon(Icons.search),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: greyColor, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                      color: greyColor,
                    ),
                  ),
                  fillColor: whiteColor,
                  hintStyle: TextStyle(fontSize: 15),
                  border: InputBorder.none,
                  hintText: "Cari produk...",
                  contentPadding: EdgeInsets.all(15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}