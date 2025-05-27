class Package {
  final int id;
  final String name;
  final String description;
  final int price;
  final int validity;

  Package({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.validity,
  });

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      validity: json['validity'],
    );
  }
}