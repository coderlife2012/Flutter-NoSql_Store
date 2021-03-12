import 'package:meta/meta.dart';

class Product {
  // Id will be gotten from the database.
  int id;

  final String name;
  final double quantity;
  final double rate;

  Product({@required this.name, @required this.quantity, @required this.rate});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'quantity': quantity,
      'rate': rate,
    };
  }

  static Product fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'],
      quantity: map['quantity'],
      rate: map['rate'],
    );
  }
}

class ProductList {
  List<Product> products;

  ProductList({
    @required this.products,
  });

  ProductList.fromJson(Map<String, dynamic> map)
      : products = List<Product>.from(
            map["products"].map((it) => Product.fromMap(it)));

  List<dynamic> toJson() {
    List<dynamic> data;
    data =
        products != null ? this.products.map((v) => v.toMap()).toList() : null;
    return data;
  }
}
