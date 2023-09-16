import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syntop_app/config/config.dart';
import 'package:syntop_app/controllers/checkout_controller.dart';
import 'package:syntop_app/themes/themes.dart';

import '../models/checkout_model.dart';

class BuktiBayarPage extends StatefulWidget {
  const BuktiBayarPage({super.key, required this.dataCheckout});

  final CheckoutModel dataCheckout;

  @override
  State<BuktiBayarPage> createState() => _BuktiBayarPageState();
}

class _BuktiBayarPageState extends State<BuktiBayarPage> {
  // panggil controller
  final checkoutC = Get.put(CheckoutController());

  // function pilih source untuk gambar
  takeImage(mContext) {
    return showDialog(
      context: mContext,
      builder: (context) {
        return SimpleDialog(
          title: Text(
            'Pilih',
            style: TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
            ),
          ),
          children: [
            SimpleDialogOption(
              child: Row(
                children: const [
                  Icon(Icons.camera_alt),
                  Text(
                    'Kamera',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.pop(context);
                checkoutC.getImage(ImageSource.camera);
              },
            ),
            SimpleDialogOption(
              child: Row(
                children: const [
                  Icon(Icons.image),
                  Text(
                    'Galeri ',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              onPressed: () {
                Get.back();
                checkoutC.getImage(ImageSource.gallery);
              },
            ),
            SimpleDialogOption(
              child: Container(
                alignment: Alignment.bottomRight,
                child: const Text(
                  'Batal',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          "Upload Bukti Bayar",
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
            height: 15,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  widget.dataCheckout.item.gambar,
                  width: 180,
                  height: 56,
                ),
                SizedBox(
                  height: 35,
                ),
                Text(
                  "Mandiri Virtual Account",
                  textAlign: TextAlign.center,
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "900100200300",
                  style: blackTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "a.n.Syntop Laptopindo",
                  style: blackTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 15),
              padding: EdgeInsets.all(35),
              decoration: BoxDecoration(
                  color: whiteColor, borderRadius: BorderRadius.circular(5)),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Obx(
                    () => checkoutC.selectedImagePath.value == ''
                        ? Image.asset(
                            'assets/logo.png',
                            width: 100,
                            height: 100,
                            fit: BoxFit.contain,
                          )
                        : Image.file(
                            File(checkoutC.selectedImagePath.value),
                            fit: BoxFit.contain,
                            height: 100,
                            width: 300,
                          ),
                  ),
                  InkWell(
                    onTap: () {
                      takeImage(context);
                    },
                    child: Container(
                      width: 150,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: primaryColor),
                      child: Center(
                        child: Text(
                          "Upload Bukti Bayar",
                          style: whiteTextStyle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
                Row(
                  children: [
                    Image.network(
                      widget.dataCheckout.item.gambar,
                      width: 100,
                      height: 100,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.dataCheckout.item.namaProduct,
                          style: blackTextStyle,
                        ),
                        Text(
                          Config.convertToIdr(
                              int.parse(widget.dataCheckout.item.hargaSatuan),
                              0),
                          style: greyTextStyle,
                        ),
                        Text(
                          "${widget.dataCheckout.item.jumlah} item",
                          style: greyTextStyle,
                        ),
                      ],
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
                    Text(
                      "${widget.dataCheckout.item.namaProduct}",
                      style: greyTextStyle,
                    ),
                    Spacer(),
                    Text(
                      Config.convertToIdr(
                          int.parse(widget.dataCheckout.item.totalharga), 0),
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
                      "Rp. 25.000",
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
                      Config.convertToIdr(
                          int.parse(widget.dataCheckout.grandTotal), 0),
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
                      "${widget.dataCheckout.nama}",
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
                      "${widget.dataCheckout.nohp}",
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
                      "${widget.dataCheckout.alamat}",
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
                      "${widget.dataCheckout.kotaKecamatan}",
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
                      "Bukti Bayar",
                      style: greyTextStyle,
                    ),
                    Spacer(),
                    widget.dataCheckout.buktibayar == null
                        ? Text('-')
                        : Image.network(
                            Config.urlMain +
                                'storage/' +
                                widget.dataCheckout.buktibayar,
                            width: 200,
                          ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          color: bgColor,
          child: Center(
            child: GestureDetector(
              onTap: () {
                if (checkoutC.selectedImagePath.value == '') {
                  Get.snackbar(
                    "Error",
                    "Harap upload bukti bayar!",
                    backgroundColor: primaryColor,
                    colorText: whiteColor,
                  );
                } else {
                  checkoutC.sendData(widget.dataCheckout.id.toString());
                }
              },
              child: Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: primaryColor,
                      width: 2,
                    ),
                    color: whiteColor),
                child: Center(
                  child: Obx(() => checkoutC.isLoading.value == true
                      ? CircularProgressIndicator(
                          color: primaryColor,
                        )
                      : Text(
                          "Kirim Bukti Bayar",
                          style: primaryTextStyle,
                        )),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
