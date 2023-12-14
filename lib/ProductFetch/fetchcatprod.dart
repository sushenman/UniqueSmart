class CategoryProduct
{
    final String slug;
    final String title; 
    final String image;
    final String mrpPrice; 
    final String retailer_price; 

    CategoryProduct({
      required this.slug,
      required this.title,
      required this.image,
      required this.mrpPrice,
      required this.retailer_price,
    });

    factory CategoryProduct.fromJson(Map<String, dynamic> json) {
      return CategoryProduct(
        slug: json['slug'],
        title: json['title'],
        image: json['image'],
        mrpPrice: json['mrp_price'],
        retailer_price: json['retailer_price'],
      );
    }
}