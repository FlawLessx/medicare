class Resource {
  Resource({
    required this.id,
    required this.name,
    required this.year,
    required this.color,
    required this.pantoneValue,
  });
  late final int id;
  late final String name;
  late final int year;
  late final String color;
  late final String pantoneValue;

  Resource.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    year = json['year'];
    color = json['color'];
    pantoneValue = json['pantone_value'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['year'] = year;
    data['color'] = color;
    data['pantone_value'] = pantoneValue;
    return data;
  }
}
