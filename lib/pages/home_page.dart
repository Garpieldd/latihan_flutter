import 'package:flutter/material.dart';
import 'package:syntop_app/pages/landing_page.dart';
import 'package:syntop_app/pages/on_board_page.dart';
import 'package:syntop_app/pages/order_page.dart';
import 'package:syntop_app/pages/profile_page.dart';
import 'package:syntop_app/pages/search_result_page.dart';
import 'package:syntop_app/pages/sign_in_page.dart';
import 'package:syntop_app/pages/sign_up_page.dart';
import 'package:syntop_app/themes/themes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // indexing page
  int _selectedIndex = 0;

  // siapkan list halaman sesuai index
  static List<Widget> _screenList = [
    LandingPage(),
    SearchResultPage(keyword: '',),
    OrderPage(),
    ProfilePage(),
  ];

  // function merubah posisi index saat menu diklik
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenList.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Cari',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Keranjang',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_sharp),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        onTap: _onItemTapped,
        backgroundColor: bgColor,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}