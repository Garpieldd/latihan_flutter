import 'package:flutter/material.dart';
import 'package:syntop_app/models/checkout_model.dart';

import '../config/config.dart';
import '../themes/themes.dart';

class ItemCheckoutWidget extends StatelessWidget {
  const ItemCheckoutWidget({super.key, required this.dataCheckout, this.label = ""});

  final String label;
  final CheckoutModel dataCheckout;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: ListTile(
        leading: Image.network(dataCheckout.item.gambar),
        title: Text(dataCheckout.item.namaProduct),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${dataCheckout.kodeTransaksi}"),
            Row(
              children: [
                Text(
                  Config.convertToIdr(int.parse(dataCheckout.grandTotal), 0),
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