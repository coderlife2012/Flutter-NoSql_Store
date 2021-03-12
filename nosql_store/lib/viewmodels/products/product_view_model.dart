import 'package:flutter/cupertino.dart';
import 'package:nosql_store/models/products/product_model.dart';
import 'package:nosql_store/utilities/database/app_database.dart';
import 'package:sembast/sembast.dart';

class ProductViewModel {
  static const String FRUIT_STORE_NAME = 'products';
  static const String DUMMY_STORE = 'dummy';
  // A Store with int keys and Map<String, dynamic> values.
  final _productStore = intMapStoreFactory.store(FRUIT_STORE_NAME);
  // dynamically typed store
  var _mainStore = StoreRef.main();

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(Product product) async {
    await _productStore.add(await _db, product.toMap());
  }

  Future update(Product product) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(product.id));
    await _productStore.update(
      await _db,
      product.toMap(),
      finder: finder,
    );
  }

  Future delete(Product product) async {
    final finder = Finder(filter: Filter.byKey(product.id));
    await _productStore.delete(
      await _db,
      finder: finder,
    );
  }

  Future<List<Product>> getAllSortedByName() async {
    // Finder object can also sort data.
    final finder = Finder(sortOrders: [
      SortOrder('name'),
    ]);

    final recordSnapshots = await _productStore.find(
      await _db,
      finder: finder,
    );

    // Making a List<Fruit> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final fruit = Product.fromMap(snapshot.value);
      // An ID is a key of a record from the database.
      fruit.id = snapshot.key;
      return fruit;
    }).toList();
  }

  Future insertMainProducts(Map<String, dynamic> products) async {
    await _mainStore.record('dynamic_products').put(await _db, products);
  }

  Future<Map<String, dynamic>> getMainProducts() async {
    return await _mainStore.record('dynamic_products').get(await _db) as Map;
  }

  Future<Map<String, dynamic>> deleteMainProducts() async {
    return await _mainStore.record('dynamic_products').delete(await _db);
  }
}
