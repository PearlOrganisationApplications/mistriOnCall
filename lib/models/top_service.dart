class TopService {
  final int id;
  final String name;
  final int categoryId;
  final String description;
  final String image;
  final int status;
  final String createdAt;
  final String updatedAt;
  final String averageRating;
  final List<Review> reviews;

  TopService({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.description,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.averageRating,
    required this.reviews,
  });

  factory TopService.fromJson(Map<String, dynamic> json) {
    return TopService(
      id: json['id'],
      name: json['name'],
      categoryId: json['category_id'],
      description: json['description'],
      image: json['image'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      averageRating: json['average_rating'] ?? '0.0',
      reviews: (json['reviews'] as List)
          .map((reviewJson) => Review.fromJson(reviewJson))
          .toList(),
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
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      userName: json['user_name'],
    );
  }
}
