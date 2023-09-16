import 'package:flutter/material.dart';
import 'package:syntop_app/models/product_models.dart';
import 'package:syntop_app/services/product_services.dart';
import 'package:syntop_app/themes/themes.dart';
import '../widgets/produk_populer_widget.dart';

class SearchResultPage extends StatefulWidget {
  const SearchResultPage({super.key, required this.keyword});

  final String keyword;

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pencarian : ${widget.keyword} ",
          style: blackTextStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: whiteColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: blackColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            top: 10,
            left: 20,
            right: 20,
            bottom: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hasil Pencarian produk : ${widget.keyword} ",
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),

              FutureBuilder<List<ProductModel>>(
                future: ProductServices.searchProduct(widget.keyword),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.41),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    return // BODY menggunakan gridview
                        GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 5 / 7,
                      children: [
                        ...snapshot.data!.map((dataProduct) {
                          return ProdukPopulerWidget(dataProduct: dataProduct);
                        })
                      ],
                    );
                  }
                  return Container();
                }),
              ),

              // BODY menggunakan gridview
            ],
          ),
        ),
      ),
    );
  }
}
