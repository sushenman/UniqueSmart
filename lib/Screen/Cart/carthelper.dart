class Cart {
  
  final String title;
  final String price;
  final String image;
    String quantity;
    final String description;
  final String slug;
   String? isChecked;
   int? id;
  

  Cart(
      {required this.title,
      required this.price,
      required this.image,
      required  this.quantity,
      required this.description,
      required this.slug,
       this.id,
       this.isChecked,
      });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      title: json['title'],
      price: json['price'],
      image: json['image'],
      quantity: json['quantity'],
      description: json['description'],
      slug: json['slug'],
      isChecked: json['isChecked'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price': price,
      'image': image,
      'quantity': quantity,
      'slug': slug,
      'description': description,
      'isChecked': isChecked,
      'id': id,
    };
  }
  }