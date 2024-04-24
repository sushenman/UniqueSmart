class BrandsList {
  final String title;
  final String image;

  BrandsList({required this.title, required this.image});

  factory BrandsList.fromJson(Map<String, dynamic> json) {
    return BrandsList(title: json['title'], image: json['image']);
  }
}
