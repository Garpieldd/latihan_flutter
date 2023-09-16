import 'package:intl/intl.dart';

class Config {
  // sediakan variabel penampung alamat url
  static String urlApi = "https://syntop.airportslab.com/api";
  static String urlMain = "https://syntop.airportslab.com/";

  // url End point yg akan dipakai
  String urlProdRekomen = "$urlApi/product-rekomendasi";
  String urlProdAll = "$urlApi/product-list";
  String urlProdNew = "$urlApi/product-new";
  String urlProdSearch = "$urlApi/product-search?keyword=";
  String urlKeranjangPost = "$urlApi/keranjang-post";
  String urlKeranjangList = "$urlApi/keranjang-list?user_id=";
  String urlKeranjangDelete = "$urlApi/keranjang-delete";
  String urlChekoutPost = "$urlApi/checkout-post";
  String urlChekoutPostbyId = "$urlApi/checkout-post-by-id";
  String urlUploadBuktiBayar = "$urlApi/upload-bukti-bayar";
  String urlRegister = "$urlApi/register";
  String urlLogin = "$urlApi/login";
  String urlLogout = "$urlApi/logout";
  String urlCheckoutListBaru = "$urlApi/checkout-list-baru?user_id=";
  String urlCheckoutListProses = "$urlApi/checkout-list-proses?user_id=";
  String urlCheckoutListSelesai = "$urlApi/checkout-list-selesai?user_id=";

  // membuat fungsi untuk format currency
  static String convertToIdr(dynamic number, int decimalDigit){
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp. ',
      decimalDigits: decimalDigit,
    );

    return currencyFormatter.format(number);
  }
  
}