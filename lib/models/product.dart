class Product {
  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.rating,
    required this.categoryId,
  });
  late final int id;
  late final String name;
  late final String image;
  late final double rating;
  late final int categoryId;
  late final String stock;
  late final String price;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    rating = json['rating'];
    categoryId = json['category_id'];
    stock = json['stock'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['rating'] = rating;
    data['category_id'] = categoryId;
    return data;
  }
}
