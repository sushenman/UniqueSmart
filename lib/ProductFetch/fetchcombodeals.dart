class fetchcomboDeals {
  final String title;
  final String image;
  final String slug;

  fetchcomboDeals({required this.title, required this.image, required this.slug});

  factory fetchcomboDeals.fromJson(Map<String, dynamic> json) {
    return fetchcomboDeals(title: json['title'], image: json['image'], slug: json['slug']);
  }
}
