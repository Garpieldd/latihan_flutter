import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:syntop_app/config/config.dart';
import 'package:syntop_app/controllers/cart_controller.dart';
import 'package:syntop_app/models/product_models.dart';
import 'package:syntop_app/pages/shop_now_page.dart';
import 'package:syntop_app/themes/themes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class ProdukDetailPage extends StatefulWidget {
  const ProdukDetailPage({super.key, required this.dataProduct});

  final ProductModel dataProduct;

  @override
  State<ProdukDetailPage> createState() => _ProdukDetailState();
}

final List<String> imageList = [
  'assets/laptop1.png',
  'assets/laptop2.png',
  'assets/laptop3.png'
];

class _ProdukDetailState extends State<ProdukDetailPage> {
  final cartC = Get.put(CartController());

  int _qty = 1;

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

  int _current = 0;
  final CarouselController _controller = CarouselController();

  final List<Widget> imageSliders = imageList
      .map((item) => Container(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Text(
                            'No. ${imageList.indexOf(item)} image',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
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
          // Carousel
          Container(
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: CarouselSlider(
              carouselController: _controller,
              items: imageList
                  .map(
                    (itemImage) => Container(
                      child: Image.asset(itemImage, fit: BoxFit.cover),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                autoPlay: true,
                // enlargeCenterPage: true,
                // aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
            ),
          ),

          // Content
          Container(
            margin: EdgeInsets.only(
              left: 20,
              right: 15,
              top: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 250,
                      child: Text(
                        widget.dataProduct.namaProduct,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          minusQty();
                        },
                        icon: Icon(
                          Icons.remove_circle_outline,
                          color: blackColor,
                        )),
                    Text(
                      _qty.toString(),
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          addQty();
                        },
                        icon: Icon(
                          Icons.add_circle_outline,
                          color: blackColor,
                        )),
                  ],
                ),
                Text(
                  Config.convertToIdr(
                      double.parse(widget.dataProduct.harga), 0),
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    RatingBar.builder(
                      itemSize: 20,
                      initialRating: double.parse(widget.dataProduct.rating),
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
                      " " + widget.dataProduct.rating,
                      style: greyTextStyle,
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Deskripsi",
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                HtmlWidget(widget.dataProduct.spesifikasi),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 80,
        color: bgColor,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  cartC.postCartNow(widget.dataProduct.id.toString(), widget.dataProduct,  _qty.toString());
                },
                child: Container(
                  width: 150,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: primaryColor,
                        width: 2,
                      ),
                      color: whiteColor),
                  child: Center(
                    child: Text(
                      "Beli Sekarang",
                      style: primaryTextStyle,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  cartC.postCart(widget.dataProduct.id.toString(), _qty.toString());
                },
                child: Container(
                  width: 150,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: primaryColor),
                  child: Center(
                    child: Obx(() => cartC.isLoading == true ? Text("Processing...",
                      style: whiteTextStyle,) :
                      Text(
                          "+ Keranjang",
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