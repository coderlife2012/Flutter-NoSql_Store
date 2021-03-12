import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nosql_store/models/products/product_model.dart';
import 'package:nosql_store/utilities/styles.dart';
import 'package:nosql_store/viewmodels/products/product_view_model.dart';

class AddProductPage extends StatefulWidget {
  VoidCallback onPressed;
  AddProductPage({this.onPressed});
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final formKey = GlobalKey<FormState>();

  TextEditingController pNameController = TextEditingController();
  FocusNode _pNameFocus = FocusNode();
  bool haspNameFocused = false;

  TextEditingController rateController = TextEditingController();
  FocusNode _rateFocus = FocusNode();
  bool hasRateFocused = false;

  TextEditingController quantityController = TextEditingController();
  FocusNode _quantityFocus = FocusNode();
  bool hasquantityFocused = false;

  final viewModel = ProductViewModel();

  @override
  void initState() {
    // TODO: implement initState(

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: true,
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Add Product',
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    width: 80.0,
                  ),
                  IconButton(
                      alignment: Alignment.centerRight,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.grey,
                      )),
                ],
              ),
              // SizedBox(
              //   height: 16.0,
              // ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    productNameField(),
                    SizedBox(
                      height: 16.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(flex: 1, child: quantityTextField()),
                            SizedBox(
                              width: 16.0,
                            ),
                            Expanded(flex: 1, child: rateTextField()),
                          ],
                        ),
                        SizedBox(
                          height: 2.0,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () async {
                      final form = formKey.currentState;
                      form.save();
                      if (form.validate()) {
                        viewModel
                            .insert(_addProduct())
                            .whenComplete(() => widget.onPressed());
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                      primary: Colors.white,
                      // onSurface: Colors.red,
                    ),
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      alignment: Alignment.center,
                      width: 104.0,
                      height: 40.0,
                      child: Text('SUBMIT'),
                    ),
                  ),
                ],
              ),
              //Text('$_isvisible'),
            ],
          ),
        ),
      ),
    );
  }

  Widget productNameField() {
    return TextFormField(
      style: Styles.blackTextwithf12,
      focusNode: _pNameFocus,
      onChanged: (String value) async {
        if (value == ' ') {
          return;
        }

        formKey.currentState.validate();
      },
      onTap: () {
        setState(() {
          haspNameFocused = true;
        });
      },
      onFieldSubmitted: (value) {
        setState(() {
          haspNameFocused = false;
        });
      },
      validator: (value) => value.isNotEmpty ? null : 'Please enter name',
      minLines: 1,
      controller: pNameController,
      autocorrect: false,
      enableSuggestions: false,
      keyboardType: TextInputType.name,
      decoration: Styles.textFieldStyle(
          labelTextStr: 'Product Name',
          controller: pNameController,
          isFocus: haspNameFocused),
    );
  }

  Widget quantityTextField() {
    return TextFormField(
      style: Styles.blackTextwithf12,
      focusNode: _quantityFocus,
      onChanged: (String value) async {
        if (value == ' ') {
          return;
        }
        formKey.currentState.validate();
      },
      onTap: () {
        setState(() {
          hasquantityFocused = true;
        });
      },
      onFieldSubmitted: (value) {
        setState(() {
          hasquantityFocused = false;
        });
      },
      validator: (value) => value.isNotEmpty ? null : 'Please enter quantity',
      minLines: 1,
      controller: quantityController,
      autocorrect: false,
      enableSuggestions: false,
      keyboardType: TextInputType.numberWithOptions(
        signed: true,
        decimal: true,
      ),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      decoration: Styles.textFieldStyle(
          labelTextStr: 'Quantity (Kg)',
          controller: quantityController,
          isFocus: hasquantityFocused),
    );
  }

  Widget rateTextField() {
    return TextFormField(
      style: Styles.blackTextwithf12,
      focusNode: _rateFocus,
      onChanged: (String value) async {
        if (value == ' ') {
          return;
        }

        formKey.currentState.validate();
      },
      onTap: () {
        setState(() {
          hasRateFocused = true;
        });
      },
      onFieldSubmitted: (value) {
        setState(() {
          hasRateFocused = false;
        });
      },
      validator: (value) => value.isNotEmpty ? null : 'Please enter rate',
      minLines: 1,
      controller: rateController,
      autocorrect: false,
      enableSuggestions: false,
      keyboardType: TextInputType.numberWithOptions(
        signed: true,
        decimal: true,
      ),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      decoration: Styles.textFieldStyle(
          labelTextStr: 'Rate',
          controller: rateController,
          isFocus: hasRateFocused),
    );
  }

  Product _addProduct() {
    return Product(
        name: pNameController.text,
        quantity: double.parse(quantityController.text),
        rate: double.parse(rateController.text));
  }
}
