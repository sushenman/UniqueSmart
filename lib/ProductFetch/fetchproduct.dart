// import 'package:flutter/foundation.dart';

class Product {
  final String slug;
  final String title;
  final String image;
  final String mrp_price;
  // final String category_name;
  final String retailer_price;

  Product(
      {required this.slug,
      required this.title,
      required this.image,
      required this.mrp_price,
      // required this.category_name
      required this.retailer_price
      });

    factory  Product.fromJson(Map<String, dynamic> json)
    {
      return Product(
        slug: json['slug'],
        title: json['title'],
        image: json['image'],
        mrp_price: json['mrp_price'],
        retailer_price: json['retailer_price'],
        // category_name: json['category_name'],
      );
    }
}


