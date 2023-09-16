import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:syntop_app/models/product_models.dart';
import 'package:syntop_app/services/product_services.dart';
import 'package:syntop_app/themes/themes.dart';
import 'package:syntop_app/widgets/produk_populer_widget.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: ListView(
        children: [
          // SECTION 1 BANNER
          Container(
            margin: EdgeInsets.only(
              top: 28,
              left: 20,
              right: 20,
            ),
            child: Image.asset("assets/img-promo.png"),
          ),

          // SECTION 2 Produk Populer
          Container(
            margin: EdgeInsets.only(
              top: 23,
              left: 20,
              right: 20,
            ),
            child: Text(
              "Produk Populer",
              style: blackTextStyle.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // Banner Scroll
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: EdgeInsets.only(
                top: 10,
                left: 20,
                right: 20,
              ),
              child: FutureBuilder<List<ProductModel>>(
                future: ProductServices.getProductNew(),
                builder: (context, snapshot) {
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
                    return Row(
                      children: [
                        ...snapshot.data!.map((dataProduct) {
                          // mengambil index dari perulangan map
                          var index = snapshot.data!.indexOf(dataProduct);
                          return Container(
                            margin: EdgeInsets.only(left: index > 0 ? 12 : 0),
                            child: ProdukPopulerWidget(
                              dataProduct: dataProduct,
                            ),
                          );
                        })
                      ],
                    );
                  }

                  return Container();
                },
              ),
            ),
          ),

          SizedBox(
            height: 30,
          ),

          Container(
            margin: EdgeInsets.only(
              top: 23,
              left: 20,
              right: 20,
            ),
            child: Text(
              "Produk Rekomendasi",
              style: blackTextStyle.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          FutureBuilder<List<ProductModel>>(
            future: ProductServices.getProductRecomended(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  ),
                );
              } else if (snapshot.hasData) {
                // tampilkan datanya dengan widget grid view
                return Padding(padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                  bottom: 10
                ),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 5/7,
                  children: [
                    ...snapshot.data!.map((dataProduct) {
                      return ProdukPopulerWidget(dataProduct: dataProduct);
                    })
                  ],
                )
                );
              }

              return Container();
            },
          ),

          // Container(
          //   margin: EdgeInsets.only(
          //     top: 10,
          //     left: 20,
          //     right: 20,
          //     bottom: 20,
          //   ),
          //   child: Column(
          //     children: [
          //       Row(
          //         children: [
          //           Expanded(child: ProdukPopulerWidget()),
          //           SizedBox(
          //             width: 12,
          //           ),
          //           Expanded(child: ProdukPopulerWidget()),
          //         ],
          //       ),
          //       SizedBox(
          //         height: 12,
          //       ),
          //       Row(
          //         children: [
          //           Expanded(child: ProdukPopulerWidget()),
          //           SizedBox(
          //             width: 12,
          //           ),
          //           Expanded(child: ProdukPopulerWidget()),
          //         ],
          //       ),
          //       SizedBox(
          //         height: 12,
          //       ),
          //       Row(
          //         children: [
          //           Expanded(child: ProdukPopulerWidget()),
          //           SizedBox(
          //             width: 12,
          //           ),
          //           Expanded(child: ProdukPopulerWidget()),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}