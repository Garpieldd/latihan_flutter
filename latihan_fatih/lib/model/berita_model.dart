// To parse this JSON data, do
//
//     final beritaModel = beritaModelFromJson(jsonString);

import 'dart:convert';

BeritaModel beritaModelFromJson(String str) => BeritaModel.fromJson(json.decode(str));

String beritaModelToJson(BeritaModel data) => json.encode(data.toJson());

class BeritaModel {
    Source source;
    String author;
    String title;
    dynamic description;
    String url;
    dynamic urlToImage;
    DateTime publishedAt;
    dynamic content;

    BeritaModel({
        required this.source,
        required this.author,
        required this.title,
        required this.description,
        required this.url,
        required this.urlToImage,
        required this.publishedAt,
        required this.content,
    });

    factory BeritaModel.fromJson(Map<String, dynamic> json) => BeritaModel(
        source: Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"] ?? "deskripsi tidak tersedia",
        url: json["url"],
        urlToImage: json["urlToImage"] ?? "https://www.wolframalpha.com/_next/static/images/share_3eSzXbxb.png",
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"] ?? "konten tidak tersedia",
    );

    Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
    };
}

class Source {
    String id;
    String name;

    Source({
        required this.id,
        required this.name,
    });

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
