import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:latihan_fatih/berita_detail_page.dart';
import 'package:latihan_fatih/model/berita_model.dart';
import 'package:get/get.dart';

class BeritaWidget extends StatelessWidget {
  const BeritaWidget({super.key, required this.dataBerita});

  final BeritaModel dataBerita;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(detailBerita());
      },
      child: Container(
        width: 350,
        padding: EdgeInsets.all(11),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 255, 255, 255)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: Image.network(
              dataBerita.urlToImage,
              width: 350,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            dataBerita.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Row(
            children: [
              Text(
                dataBerita.author,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              // Text(
              //   dataBerita.publishedAt,
              //   style: TextStyle(fontWeight: FontWeight.w300),
              // )
            ],
          )
        ]),
      ),
    );
  }
}
