import '../config/config.dart';

class OrderModel {
    String id;
    String userId;
    String productId;
    dynamic checkoutId;
    String jumlah;
    String totalharga;
    String status;
    DateTime createdAt;
    DateTime updatedAt;
    String namaProduct;
    String gambar;
    String hargaSatuan;
    String merkProduct;

    OrderModel({
        required this.id,
        required this.userId,
        required this.productId,
        this.checkoutId,
        required this.jumlah,
        required this.totalharga,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.namaProduct,
        required this.gambar,
        required this.hargaSatuan,
        required this.merkProduct,
    });

    factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["id"] ?? "1",
        userId: json["user_id"] ?? "1",
        productId: json["product_id"] ?? "1",
        checkoutId: json["checkout_id"] ?? 0,
        jumlah: json["jumlah"] ?? "0",
        totalharga: json["totalharga"] ?? "0",
        status: json["status"] ?? "0",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        namaProduct: json["nama_product"],
        gambar: Config.urlMain + 'storage/' + json["gambar"] ?? "https://syntop.airportslab.com/storage/product-images/9uNgLcbkp3W53ICBwaaS8HblOXKIuFwdUWHQ1aHJ.webp",
        hargaSatuan: json["harga_satuan"],
        merkProduct: json["merk_product"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "product_id": productId,
        "checkout_id": checkoutId,
        "jumlah": jumlah,
        "totalharga": totalharga,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "nama_product": namaProduct,
        "gambar": gambar,
        "harga_satuan": hargaSatuan,
        "merk_product": merkProduct,
    };
}