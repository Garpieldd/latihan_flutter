import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_fatih/berita_detail_page.dart';
import 'package:latihan_fatih/model/berita_model.dart';
import 'package:latihan_fatih/services/berita_service.dart';
import 'package:latihan_fatih/widget/berita_widget.dart';

class beritaPage extends StatelessWidget {
  const beritaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("News Page"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              FutureBuilder<List<BeritaModel>>(
                future: BeritaService().listBerita(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.41),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: const Color(0xFF151026),
                        ),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    return Column(
                      children: [
                        ...snapshot.data!.map((dataBerita) {
                          var index = snapshot.data!.indexOf(dataBerita);
                          return BeritaWidget(
                            dataBerita: dataBerita,
                          );
                        })
                      ],
                    );
                  }

                  return Container();
                },
              ),
              SizedBox(
                height: 20,
              ),
              
            ],
          ),
        ));
  }
}

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: color,
      ),
      child: Center(
        child: Text(title),
      ),
    );
  }
}
