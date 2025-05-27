class User {
  int? id;
  String? name;
  String? email;
  int? phone;
  String? location;
  String? apiToken;
  String? image;
  String? packageValidTill;
  String? createdAt;
  String? updatedAt;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.location,
    this.apiToken,
    this.image,
    this.packageValidTill,
    this.createdAt,
    this.updatedAt,
  });

  // Factory constructor to create a User object from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      location: json['location'],
      apiToken: json['api_token'],
      image: json['image'],
      packageValidTill: json['package_valid_till'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
