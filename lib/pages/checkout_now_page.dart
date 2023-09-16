import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syntop_app/config/config.dart';
import 'package:syntop_app/controllers/checkout_controller.dart';
import 'package:syntop_app/pages/upload_bukti_bayar_page.dart';
import 'package:syntop_app/models/product_models.dart';
import 'package:syntop_app/themes/themes.dart';

class CheckoutNowPage extends StatelessWidget {
  const CheckoutNowPage(
      {super.key,
      this.dataProduct,
      required this.nama,
      required this.nohp,
      required this.alamat,
      required this.kota,
      required this.jenisPembayaran,
      required this.jenisPengiriman,
      required this.catatan, required this.idCart, required this.totHarga, required this.jumlah});

  final ProductModel? dataProduct;
  final String nama,
      nohp,
      alamat,
      kota,
      jenisPembayaran,
      jenisPengiriman,
      idCart,
      totHarga,
      jumlah,
      catatan;

  @override
  Widget build(BuildContext context) {
    final checkoutC = Get.put(CheckoutController());
    int totalHarga = int.parse(totHarga) + 25000;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          "Checkout",
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
                Text(
                  "*Ini adalah halaman informasi sebelum menekan tombol bayar pastikan data sudah benar",
                  style: primaryTextStyle,
                ),
                Row(
                  children: [
                    Image.network(
                      dataProduct!.gambar,
                      width: 100,
                      height: 100,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dataProduct!.namaProduct,
                          style: blackTextStyle,
                        ),
                        Text(
                          Config.convertToIdr(
                              int.parse(dataProduct!.harga), 0),
                          style: greyTextStyle,
                        ),
                        Text(
                          "1 item",
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
                      dataProduct!.namaProduct,
                      style: greyTextStyle,
                    ),
                    Spacer(),
                    Text(
                      Config.convertToIdr(int.parse(totHarga), 0),
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
                      Config.convertToIdr(totalHarga, 0),
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
                      nama,
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
                      nohp,
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
                      alamat,
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
                      kota,
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
                      "Catatan",
                      style: greyTextStyle,
                    ),
                    Spacer(),
                    Text(
                      catatan,
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
                      "Pembayaran",
                      style: greyTextStyle,
                    ),
                    Spacer(),
                    Text(
                      jenisPembayaran,
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
                      "Pengiriman",
                      style: greyTextStyle,
                    ),
                    Spacer(),
                    Text(
                      jenisPengiriman,
                      style: blackTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 110,
        decoration: BoxDecoration(
          color: whiteColor,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Total : ",
                    style: blackTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  Text(
                    Config.convertToIdr(totalHarga, 0),
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              GestureDetector(
                onTap: () {
                  checkoutC.postCheckoutById(idCart,
                      jenisPembayaran, jenisPengiriman);
                },
                child: Container(
                  width: 150,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: primaryColor),
                  child: Center(
                    child: Obx(() => checkoutC.isLoading.value == true
                        ? CircularProgressIndicator(
                            color: whiteColor,
                          )
                        : Text(
                            "Bayar Sekarang",
                            style: whiteTextStyle,
                          )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}