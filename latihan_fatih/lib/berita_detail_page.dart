import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class detailBerita extends StatelessWidget {
  const detailBerita({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Image.asset('assets/garp.png',),
            SizedBox(height: 20,),
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sagittis augue arcu. Vestibulum ante ipsum primis in;", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            SizedBox(height: 20,),
            Text("placeholder")
          ],
        ),
      ),
    );
  }
}