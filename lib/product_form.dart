// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_application/database.dart';
import 'package:flutter_application/product.dart';

class ProductForm extends StatelessWidget {
  ProductForm({Key? key}) : super(key: key);

  final productField = TextEditingController();
  final quantityField = TextEditingController();
  final DatabaseHandler databaseHandler = DatabaseHandler();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: TextFormField(
              controller: productField,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Product',
              ),
            )),
        Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: TextFormField(
              controller: quantityField,
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(), labelText: 'Quantity'),
            )),
        Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF0D47A1),
                            Color(0xFF1976D2),
                            Color(0xFF42A5F5),
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: OnPressed,
                    child: const Text('Add'),
                  ),
                ],
              ),
            )),
      ],
    );
  }

  Future<void> OnPressed() async {
    Product product =
        Product(product: productField.text, quantity: quantityField.text);

    databaseHandler.insertProduct(product);
    eraseFormInputs();
  }

  void eraseFormInputs() {
    productField.text = "";
    quantityField.text = "";
  }
}
