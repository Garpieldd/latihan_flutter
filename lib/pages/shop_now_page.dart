import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syntop_app/config/config.dart';
import 'package:syntop_app/controllers/cart_controller.dart';
import 'package:syntop_app/controllers/checkout_controller.dart';
import 'package:syntop_app/models/order_model.dart';
import 'package:syntop_app/pages/checkout_page.dart';
import 'package:syntop_app/themes/themes.dart';

class ShopNowPage extends StatefulWidget {
  const ShopNowPage({super.key, required this.dataOrder});

  final OrderModel dataOrder;

  @override
  State<ShopNowPage> createState() => _ShopNowPageState();
}

class _ShopNowPageState extends State<ShopNowPage> {
  int _qty = 1;

  // untuk isian dropdown
  String metodePembayaran = "Transfer Bank";
  String metodePengiriman = "Pengiriman Instan";


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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final cartC = Get.put(CartController());
    final checkoutC = Get.put(CheckoutController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Beli sekarang",
            style: blackTextStyle.copyWith(fontWeight: FontWeight.bold)),
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
          // Section 1
          Container(
            padding: EdgeInsets.only(
              top: 29,
              right: 20,
              left: 20,
              bottom: 60,
            ),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: whiteColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.network(
                      widget.dataOrder.gambar,
                      width: 100,
                      height: 100,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          child: Text(
                            widget.dataOrder.namaProduct,
                            style: blackTextStyle,
                          ),
                        ),
                        Text(
                          Config.convertToIdr(int.parse(widget.dataOrder.hargaSatuan), 0),
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
                        //         onPressed: () {
                        //           addQty();
                        //         },
                        //         icon: Icon(
                        //           Icons.add_circle_outline,
                        //           color: blackColor,
                        //         )),
                        //   ],
                        // )
                      ],
                    ),
                    Spacer(),
                    Text(
                      "${widget.dataOrder.jumlah} item",
                      style: greyTextStyle,
                    ),
                  ],
                ),

                // Inspector
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
                  "Metode Pengiriman",
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
                  items: <String>['Pengiriman Reguler', 'Pengiriman Instan']
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
              ],
            ),
          ),

          // Section 2
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(
              top: 29,
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
                      fontSize: 16, fontWeight: FontWeight.bold),
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
                    hintText: "Masukkan nama lengkap",
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
        margin: EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width,
        height: 115,
        decoration: BoxDecoration(color: whiteColor),
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
                    style: blackTextStyle.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                        Config.convertToIdr(int.parse(widget.dataOrder.totalharga), 0),
                        style: blackTextStyle.copyWith(
                            fontSize: 16,
                             fontWeight: FontWeight.bold),
                      ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => CheckoutPage(
                            dataOrder: widget.dataOrder,
                            nama: checkoutC.nama.text,
                            nohp: checkoutC.nohp.text,
                            alamat: checkoutC.alamat.text,
                            kota: checkoutC.kotaKecamatan.text,
                            catatan: checkoutC.catatan.text,
                            jenisPembayaran: metodePembayaran,
                            jenisPengiriman: metodePengiriman,
                          ))));
                },
                child: Container(
                  width: 150,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: primaryColor),
                  child: Center(
                    child: Text(
                      "+ Keranjang",
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
