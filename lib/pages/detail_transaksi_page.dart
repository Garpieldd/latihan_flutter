import 'package:flutter/material.dart';
import 'package:syntop_app/config/config.dart';
import 'package:syntop_app/models/checkout_model.dart';
import 'package:syntop_app/themes/themes.dart';

class DetailTransaksiPage extends StatefulWidget {
  const DetailTransaksiPage({super.key, this.status = "", required this.checkoutModel});

  final String status;

  final CheckoutModel checkoutModel;

  @override
  State<DetailTransaksiPage> createState() => _DetailTransaksiPageState();
}

class _DetailTransaksiPageState extends State<DetailTransaksiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          "Detail Transaksi",
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
      body: ListView(
        children: [
          SizedBox(
            height: 28,
          ),
          Container(
            padding: EdgeInsets.only(
              top: 15,
              right: 20,
              left: 20,
              bottom: 60,
            ),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.network(
                      widget.checkoutModel.item.gambar,
                      width: 100,
                      height: 100,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.60,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.checkoutModel.item.namaProduct,
                            style: blackTextStyle,
                          ),
                          Text(
                            Config.convertToIdr(int.parse(widget.checkoutModel.item.hargaSatuan), 0),
                            style: greyTextStyle,
                          ),
                          Text(
                            "${widget.checkoutModel.item.jumlah} item",
                            style: greyTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Text(
                  "Detail Transaksi",
                  style: blackTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        widget.checkoutModel.item.namaProduct,
                        style: greyTextStyle,
                      ),
                    ),
                    Spacer(),
                    Text(
                      Config.convertToIdr(int.parse(widget.checkoutModel.item.totalharga), 0),
                      style: blackTextStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "Pengiriman Instan",
                      style: greyTextStyle,
                    ),
                    Spacer(),
                    Text(
                      "Rp. 50.000",
                      style: blackTextStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "Total Biaya",
                      style: greyTextStyle,
                    ),
                    Spacer(),
                    Text(
                      Config.convertToIdr(int.parse(widget.checkoutModel.grandTotal), 0),
                      style: primaryTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // SECTION 2
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(
              top: 15,
              right: 20,
              left: 20,
              bottom: 60,
            ),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dikirim ke",
                  style: blackTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "Nama Penerima",
                      style: greyTextStyle,
                    ),
                    Spacer(),
                    Text(
                      widget.checkoutModel.nama,
                      style: blackTextStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "No Telepon",
                      style: greyTextStyle,
                    ),
                    Spacer(),
                    Text(
                      widget.checkoutModel.nohp,
                      style: blackTextStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "Alamat Pengiriman",
                      style: greyTextStyle,
                    ),
                    Spacer(),
                    Text(
                      widget.checkoutModel.alamat,
                      style: blackTextStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "Kota",
                      style: greyTextStyle,
                    ),
                    Spacer(),
                    Text(
                      widget.checkoutModel.kotaKecamatan,
                      style: blackTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(
              top: 15,
              right: 20,
              left: 20,
              bottom: 60,
            ),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Status Pemesanan",
                  style: blackTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "#${widget.checkoutModel.kodeTransaksi}",
                      style: greyTextStyle,
                    ),
                    Spacer(),
                    Text(
                      widget.status,
                      style: yellowTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
        ],
      ),
      
    );
  }
}
