class Category {
  final String imageUrl;
  final String text;

  Category({
    required this.imageUrl,
    required this.text,
  });
}

final List<Category> categorylist = [
  Category(
    imageUrl: 'assets/svg/plumber.svg',
    text: 'Plumber',
  ),
  Category(
    imageUrl: 'assets/svg/carpenter.svg',
    text: 'Carpenter',
  ),
  Category(
    imageUrl: 'assets/svg/painter.svg',
    text: 'Painter',
  ),
  Category(
    imageUrl: 'assets/svg/salon.svg',
    text: 'Saloon',
  ),
  Category(
    imageUrl: 'assets/svg/smartHome.svg',
    text: 'Smart Home',
  ),
  Category(
    imageUrl: 'assets/svg/Ac.svg',
    text: 'AC Repair',
  ),
  // Add more items as needed
];
