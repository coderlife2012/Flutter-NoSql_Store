import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nosql_store/models/products/product_model.dart';
import 'package:nosql_store/utilities/styles.dart';
import 'package:nosql_store/screens/add_product_page.dart';
import 'package:nosql_store/viewmodels/products/product_view_model.dart';
import 'package:flutter/services.dart' show rootBundle;

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> products = [];
  final viewModel = ProductViewModel();
  bool isFromJson = true;

  getProductsJson() async {
    final list = await rootBundle.loadString('assets/jsons/products.json');
    final jsonData = json.decode(list);
    await viewModel.insertMainProducts(jsonData).whenComplete(() => read());
  }

  read() async {
    final ff = await viewModel.getAllSortedByName();
    debugPrint('json: ${jsonEncode(ProductList(products: ff))}');
    if (ff.isEmpty) {
      await viewModel.getMainProducts().then((value) {
        setState(() {
          products = ProductList.fromJson(value).products;
          isFromJson = true;
        });
      });
    } else {
      setState(() {
        isFromJson = false;
        products = ff;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    getProductsJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NoSql Store Demo'),
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          addProductWidget();
        },
      ),
    );
  }

  @override
  Widget _buildBody() {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ListTile(
          title: Text(
            product.name,
            style: Styles.blackTextwithf16w6,
          ),
          subtitle: Text(
            'Quantity: ${product.quantity} \Kg \n Rate: Start from Rs ${product.rate}',
            style: Styles.blackTextwithf12,
          ),
          trailing: !isFromJson
              ? _buildUpdateDeleteButtons(product)
              : SizedBox(
                  width: 0,
                ),
        );
      },
    );
  }

  Row _buildUpdateDeleteButtons(Product product) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.delete_outline),
          onPressed: () async {
            setState(() {
              viewModel.delete(product).whenComplete(() => read());
            });
          },
        ),
      ],
    );
  }

  addProductWidget() {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return AddProductPage(onPressed: () {
            Navigator.of(context).pop();
            read();
          });
        });
  }
}
