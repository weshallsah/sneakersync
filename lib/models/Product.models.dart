import 'dart:convert';

class Product {
  final String name;
  final String description;
  final int price;
  final String brand;
  final String material;
  final String image;

  Product(
      {
      required this.name,
      required this.description,
      required this.price,
      required this.brand,
      required this.material,
      required this.image});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        name: json['name'],
        description: json['description'],
        price: json['price'],
        brand: json['brand'],
        material: json['material'],
        image: json['image']);
  }
}
