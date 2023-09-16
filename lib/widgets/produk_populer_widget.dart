import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:syntop_app/config/config.dart';
import 'package:syntop_app/models/product_models.dart';
import 'package:syntop_app/pages/produk_detail_page.dart';

import '../themes/themes.dart';

class ProdukPopulerWidget extends StatelessWidget {
  const ProdukPopulerWidget({super.key, required this.dataProduct});

  // untuk menerima data
  final ProductModel dataProduct;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: ((context) => ProdukDetailPage(
          dataProduct: dataProduct,
        ))));
      },
      child: Container(
        width: 170,
        padding: EdgeInsets.all(11),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: whiteColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.network(
                dataProduct.gambar,
                width: 170,
                height: 134,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              dataProduct.namaProduct,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: blackTextStyle.copyWith(fontSize: 12)),
            Text(
              Config.convertToIdr(int.parse(dataProduct.harga), 0) ,
              style: blackTextStyle.copyWith(
                  fontWeight: FontWeight.w600, fontSize: 12),
            ),
            Row(
              children: [
                RatingBar.builder(
                  itemSize: 20,
                  initialRating: double.parse(dataProduct.rating),
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                Text(
                  " " + dataProduct.rating,
                  style: greyTextStyle,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
