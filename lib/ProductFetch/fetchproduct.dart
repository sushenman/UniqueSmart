// import 'package:flutter/foundation.dart';

class Product {
  final String slug;
  final String title;
  final String image;
  final String price;
  final String category_name;

  Product(
      {required this.slug,
      required this.title,
      required this.image,
      required this.price,
      required this.category_name});

    factory  Product.fromJson(Map<String, dynamic> json)
    {
      return Product(
        slug: json['slug'],
        title: json['title'],
        image: json['image'],
        price: json['price'],
        category_name: json['category_name'],
      );
    }
}


