class Service {
  final int id;
  final int categoryId;
  final String name;
  final String description;
  final String image;
  final int status;
  final String createdAt;
  final String updatedAt;
  final List<Review> reviews;

  Service({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.reviews,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'],
      categoryId: json['category_id'],
      name: json['name'],
      description: json['description'],
      image: json['image'] ?? 'https://placeholder.com/',
      status: json['status'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((reviewJson) => Review.fromJson(reviewJson))
          .toList() ??
          [],
    );
  }

  factory Service.empty() {
    return Service(
      id: 0,
      name: '',
      description: '',
      categoryId: 0,
      image: '',
      status: 0,
      createdAt: '',
      updatedAt: '',
      reviews: [],
    );
  }
}

class Review {
  final int id;
  final int userId;
  final int serviceId;
  final String review;
  final int rating;
  final String createdAt;
  final String updatedAt;
  final String userName;

  Review({
    required this.id,
    required this.userId,
    required this.serviceId,
    required this.review,
    required this.rating,
    required this.createdAt,
    required this.updatedAt,
    required this.userName,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      userId: json['user_id'],
      serviceId: json['service_id'],
      review: json['review'],
      rating: json['rating'],
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      userName: json['user_name'] ?? 'Anonymous',
    );
  }

  factory Review.empty() {
    return Review(
      id: 0,
      userId: 0,
      serviceId: 0,
      review: '',
      rating: 0,
      createdAt: '',
      updatedAt: '',
      userName: 'Anonymous',
    );
  }
}
