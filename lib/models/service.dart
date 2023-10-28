class Service {
  Service({
    required this.id,
    required this.name,
    required this.image,
    required this.hospital,
    required this.location,
    required this.price,
    required this.categoryId,
  });
  late final int id;
  late final String name;
  late final String image;
  late final String hospital;
  late final String location;
  late final String price;
  late final int categoryId;

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    hospital = json['hospital'];
    location = json['location'];
    price = json['price'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['hospital'] = hospital;
    data['location'] = location;
    data['price'] = price;
    data['category_id'] = categoryId;
    return data;
  }
}
