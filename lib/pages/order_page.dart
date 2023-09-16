import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';
import 'package:syntop_app/models/checkout_model.dart';
import 'package:syntop_app/models/order_model.dart';
import 'package:syntop_app/pages/detail_transaksi_page.dart';
import 'package:syntop_app/pages/item_order_widget_page.dart';
import 'package:syntop_app/pages/shop_now_page.dart';
import 'package:syntop_app/pages/upload_bukti_bayar_page.dart';
import 'package:syntop_app/services/checkout_services.dart';
import 'package:syntop_app/services/order_services.dart';
import 'package:syntop_app/themes/themes.dart';
import 'package:syntop_app/widgets/item_checkout_widget.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage>
    with SingleTickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(
        length: 4, vsync: this); // Length = total tab yang akan dibuat
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pesananmu",
          style: blackTextStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: whiteColor,
        elevation: 0,
        bottom: TabBar(
          controller: controller,
          indicatorColor: primaryColor,
          labelColor: blackColor,
          labelStyle: blackTextStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
          tabs: const [
            Tab(
              text: "Keranjang",
            ),
            Tab(
              text: "Baru",
            ),
            Tab(
              text: "Diproses",
            ),
            Tab(
              text: "Selesai",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          Keranjang(),
          Baru(),
          Proses(),
          Selesai(),
        ],
      ),
    );
  }
}

// class-class untuk tampilan tabnya
class Keranjang extends StatelessWidget {
  const Keranjang({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: FutureBuilder<List<OrderModel>>(
            future: OrderServices()
                .listKeranjang(SpUtil.getInt('id_user').toString()),
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
                return ListView(
                  children: [
                    ...snapshot.data!.map((dataOrder) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(ShopNowPage(
                            dataOrder: dataOrder,
                          ));
                        },
                        child: ItemOrderWidget(
                          dataOrder: dataOrder,
                        ),
                      );
                    }),
                  ],
                );
              }
              return Container();
            }));
  }
}

class Baru extends StatelessWidget {
  const Baru({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: FutureBuilder<List<CheckoutModel>>(
          future: CheckoutServices()
              .listCheckoutNew(SpUtil.getInt("id_user").toString()),
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
              return ListView(
                children: [
                  ...snapshot.data!.map((dataCheckout) {
                    return InkWell(
                      onTap: () {
                        Get.to(BuktiBayarPage(
                          dataCheckout: dataCheckout,
                        ));
                      },
                      child: ItemCheckoutWidget(
                        label: "On Shipment",
                        dataCheckout: dataCheckout),
                    );
                  }),
                ],
              );
            }
            return Container();
          },
        ));
  }
}

class Proses extends StatelessWidget {
  const Proses({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: FutureBuilder<List<CheckoutModel>>(
          future: CheckoutServices()
              .listCheckoutProses(SpUtil.getInt("id_user").toString()),
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
              return ListView(
                children: [
                  ...snapshot.data!.map((dataCheckout) {
                    return InkWell(
                      onTap: () {
                        Get.to(DetailTransaksiPage(
                          status:'On Shipment',
                          checkoutModel: dataCheckout,
                        ));
                      },
                      child: ItemCheckoutWidget(
                        label: "On Shipment",
                        dataCheckout: dataCheckout),
                    );
                  }),
                ],
              );
            }
            return Container();
          },
        ));
  }
}

class Selesai extends StatelessWidget {
  const Selesai({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: FutureBuilder<List<CheckoutModel>>(
          future: CheckoutServices()
              .listCheckoutSelesai(SpUtil.getInt("id_user").toString()),
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
              return ListView(
                children: [
                  ...snapshot.data!.map((dataCheckout) {
                    return InkWell(
                      onTap: () {
                        Get.to(DetailTransaksiPage(
                          status: 'Selesai',
                          checkoutModel: dataCheckout,
                        ));
                      },
                      child: ItemCheckoutWidget(
                        label: 'Selesai',
                        dataCheckout: dataCheckout),
                    );
                  }),
                ],
              );
            }
            return Container();
          },
        ));
  }
}
