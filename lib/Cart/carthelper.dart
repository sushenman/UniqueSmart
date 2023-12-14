class Cart {
  final String title;
  final String price;
  final String image;
  // final  String quantity;
  final String slug;

  Cart(
      {required this.title,
      required this.price,
      required this.image,
      //  this.quantity,
      required this.slug});

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      title: json['title'],
      price: json['price'],
      image: json['image'],
      // quantity: json['quantity'],
      slug: json['slug'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price': price,
      'image': image,
      // 'quantity': quantity,
    };
  }
  }