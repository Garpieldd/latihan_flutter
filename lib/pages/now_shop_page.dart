import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syntop_app/config/config.dart';
import 'package:syntop_app/controllers/cart_controller.dart';
import 'package:syntop_app/controllers/checkout_controller.dart';
import 'package:syntop_app/models/product_models.dart';
import 'package:syntop_app/pages/checkout_now_page.dart';

import '../themes/themes.dart';

class NowShopPage extends StatefulWidget {
  const NowShopPage({super.key, required this.dataProduct, required this.idCart, required this.jumlahBeli, required this.totalHarga});

  final ProductModel dataProduct;
  final int idCart;
  final String jumlahBeli;
  final int totalHarga;

  @override
  State<NowShopPage> createState() => _NowShopPageState();
}

class _NowShopPageState extends State<NowShopPage> {
  int _qty = 1;

  // untuk isian dropdown
  String metodePembayaran = "Transfer Bank";
  String metodePengiriman = "Pengiriman Instan";

  final cartC = Get.put(CartController());

  // fucntion tambah qty
  void addQty() {
    setState(() {
      _qty++;
    });
  }

  // fucntion kurang qty
  void minusQty() {
    setState(() {
      if (_qty > 1) {
        _qty--;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    cartC.getCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final checkoutC = Get.put(CheckoutController());

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          "Beli Sekarang",
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
            height: 16,
          ),
          // SECTION 1
          Container(
            padding: EdgeInsets.only(
              top: 29,
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
                      widget.dataProduct.gambar,
                      width: 100,
                      height: 100,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          child: Text(
                            widget.dataProduct.namaProduct,
                            style: blackTextStyle,
                          ),
                        ),
                        Text(
                          Config.convertToIdr(
                              int.parse(widget.dataProduct.harga), 0),
                          style: greyTextStyle,
                        ),
                        // Row(
                        //   children: [
                        //     IconButton(
                        //         onPressed: () {
                        //           minusQty();
                        //         },
                        //         icon: Icon(
                        //           Icons.remove_circle_outline,
                        //           color: blackColor,
                        //         )),
                        //     Text(
                        //       _qty.toString(),
                        //       style: blackTextStyle.copyWith(
                        //         fontSize: 16,
                        //       ),
                        //     ),
                        //     IconButton(
                        //       onPressed: () {
                        //         addQty();
                        //       },
                        //       icon: Icon(
                        //         Icons.add_circle_outline,
                        //         color: blackColor,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      "${widget.jumlahBeli} item",
                      style: greyTextStyle,
                    ),
                  ],
                ),

                // INPUTAN
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Catatan",
                  style: blackTextStyle,
                ),
                TextFormField(
                  controller: checkoutC.catatan,
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  decoration: InputDecoration(
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
                    contentPadding: EdgeInsets.all(15),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Metode Pembayaran",
                  style: blackTextStyle,
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: greyColor, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: greyColor,
                      ),
                    ),
                  ),
                  value: metodePembayaran,
                  items: <String>['Transfer Bank', 'COD']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: blackTextStyle,
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      metodePembayaran = newValue!;
                    });
                  },
                ),

                SizedBox(
                  height: 20,
                ),
                Text(
                  "Pilih Pengiriman",
                  style: blackTextStyle,
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: greyColor, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: greyColor,
                      ),
                    ),
                  ),
                  value: metodePengiriman,
                  items: <String>['Pengiriman Instan', 'Regular']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: blackTextStyle,
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      metodePengiriman = newValue!;
                    });
                  },
                ),
              ],
            ),
          ),

          // SECTION 2
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(
              top: 20,
              right: 20,
              left: 20,
              bottom: 15,
            ),
            decoration: BoxDecoration(
              color: whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Informasi Pembayaran",
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Nama Lengkap",
                  style: blackTextStyle,
                ),
                TextFormField(
                  controller: checkoutC.nama,
                  decoration: InputDecoration(
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
                    hintText: "Masukkan Nama Lengkap",
                    contentPadding: EdgeInsets.all(15),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "No Telepon",
                  style: blackTextStyle,
                ),
                TextFormField(
                  controller: checkoutC.nohp,
                  decoration: InputDecoration(
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
                    hintText: "Masukkan No Telepon",
                    contentPadding: EdgeInsets.all(15),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Alamat Pengiriman",
                  style: blackTextStyle,
                ),
                TextFormField(
                  controller: checkoutC.alamat,
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  decoration: InputDecoration(
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
                    contentPadding: EdgeInsets.all(15),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Kota",
                  style: blackTextStyle,
                ),
                TextFormField(
                  controller: checkoutC.kotaKecamatan,
                  decoration: InputDecoration(
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
                    hintText: "Masukkan Nama Kota",
                    contentPadding: EdgeInsets.all(15),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
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
                    Config.convertToIdr(int.parse(widget.totalHarga.toString()), 0)  ,
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CheckoutNowPage(
                        idCart: widget.idCart.toString(),
                        totHarga:widget.totalHarga.toString(),
                        jumlah: widget.jumlahBeli,
                        dataProduct: widget.dataProduct,
                        nama: checkoutC.nama.text,
                        nohp: checkoutC.nohp.text,
                        alamat: checkoutC.alamat.text,
                        kota: checkoutC.kotaKecamatan.text,
                        catatan: checkoutC.catatan.text,
                        jenisPembayaran: metodePembayaran,
                        jenisPengiriman: metodePengiriman,
                      )));
                },
                child: Container(
                  width: 150,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: primaryColor),
                  child: Center(
                    child: Text(
                      "Bayar Sekarang",
                      style: whiteTextStyle,
                    ),
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