class fetchBannerDetails {
  final String title;
  final String image;

  fetchBannerDetails({required this.title, required this.image});

  factory fetchBannerDetails.fromJson(Map<String, dynamic> json) {
    return fetchBannerDetails(title: json['title'], image: json['image']);
  }
}
