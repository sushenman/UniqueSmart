class Category {
  final String slug;
  final String title;
  final List<SubCategory> subCategory;
  final String images;

  Category({
    required this.slug,
    required this.title,
    required this.subCategory,
    required this.images,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    List<SubCategory> subCategories = [];
    if (json['subCategory'] != null) {
      subCategories = (json['subCategory'] as List)
          .map((subCategory) => SubCategory.fromJson(subCategory))
          .toList();
    }

    return Category(
      slug: json['slug'],
      title: json['title'],
      subCategory: subCategories,
      images: json['images'],
    );
  }
}

class SubCategory {
  final String slug;
  final String title;
  final List<ChildCategory> childCategory;
  final String? images;

  SubCategory({
    required this.slug,
    required this.title,
    required this.childCategory,
    this.images ,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    List<ChildCategory> childCategories = [];
    if (json['childCategory'] != null) {
      childCategories = (json['childCategory'] as List)
          .map((childCategory) => ChildCategory.fromJson(childCategory))
          .toList();
    }

    return SubCategory(
      slug: json['slug'],
      title: json['title'],
      childCategory: childCategories,
      images: json['images'],
    );
  }
}

class ChildCategory {
  final String slug;
  final String title;
  final List<ChildCategory> childCategory;
  final String images;

  ChildCategory({
    required this.slug,
    required this.title,
    required this.childCategory,
    required this.images,
  });

  factory ChildCategory.fromJson(Map<String, dynamic> json) {
    List<ChildCategory> childCategories = [];
    if (json['childCategory'] != null) {
      childCategories = (json['childCategory'] as List)
          .map((childCategory) => ChildCategory.fromJson(childCategory))
          .toList();
    }

    return ChildCategory(
      slug: json['slug'],
      title: json['title'],
      childCategory: childCategories,
      images: json['images'],
    );
  }
}
