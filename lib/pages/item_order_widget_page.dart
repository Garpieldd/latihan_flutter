import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syntop_app/models/order_model.dart';
import 'package:syntop_app/pages/checkout_page.dart';
import 'package:syntop_app/pages/detail_transaksi_page.dart';
import 'package:syntop_app/themes/themes.dart';
import 'package:syntop_app/config/config.dart';

class ItemOrderWidget extends StatelessWidget {
  const ItemOrderWidget({super.key, this.label = "", this.dataOrder});

  final String label;
  final OrderModel? dataOrder;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: ListTile(
        leading: Image.network(dataOrder!.gambar),
        title: Text(dataOrder!.namaProduct),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  Config.convertToIdr(int.parse(dataOrder!.hargaSatuan), 0),
                  style: greyTextStyle,
                ),
                Spacer(),
                Text(label, style: label == 'On Shipment' ? yellowTextStyle : label == "Selesai" ? greenTextStyle : blackTextStyle),
              ],
            ),
          ],
        ),
      ),
    );
  }
}