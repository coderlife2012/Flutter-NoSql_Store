import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nosql_store/viewmodels/products/product_view_model.dart';

void main() {
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    const TEST_MOCK_STORAGE = './test/fixtures/core';
    const channel = MethodChannel(
      'plugins.flutter.io/path\_provider',
    );
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return TEST_MOCK_STORAGE;
    });
  });

  final viewModel = ProductViewModel();
  group('Given Product List Page Loads', () {
    test('Page should load a list of products', () async {
      await viewModel.insertMainProducts({
        "products": [
          {"name": "Test", "quantity": 30.0, "rate": 9.0}
        ]
      });
      final dict = await viewModel.getMainProducts();

      expect(dict['products'].length, 1);
      expect(dict['products'][0]['name'], 'Test');
      expect(dict['products'][0]['quantity'], 30.0);
      expect(dict['products'][0]['rate'], 9.0);
    });
  });
}
