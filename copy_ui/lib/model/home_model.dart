class HomeModel {
  final String image;
  final String title;
  final bool visible;
  HomeModel({
    required this.image,
    required this.title,
    required this.visible,
  });
}

class ProductModel {
  final String name;
  final String price;
  final String image;
  ProductModel({
    required this.name,
    required this.price,
    required this.image,
  });
}
