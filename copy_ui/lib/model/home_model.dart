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

class PayoutsModel {
  final String orderId;
  final String dateTime;
  final String image;
  final String price;
  PayoutsModel({
    required this.orderId,
    required this.dateTime,
    required this.image,
    required this.price,
  });
}

class FeatureModel {
  final String image;
  final String title;
  final String subtitle;
  FeatureModel({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}
