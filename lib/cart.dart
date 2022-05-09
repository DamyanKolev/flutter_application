import 'package:flutter/material.dart';
import 'package:flutter_application/product.dart';
import 'package:flutter_application/side_navigation.dart';
import 'database.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  CartState createState() => CartState();
}

class CartState extends State<Cart> {
  final DatabaseHandler db = DatabaseHandler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Cart")),
        body: FutureBuilder(
          future: this.db.retrieveProducts(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
            // print(snapshot.data![0].product + " " + snapshot.data![0].quantity);
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: const Icon(Icons.delete_forever),
                    ),
                    key: ValueKey<int>(snapshot.data![index].id!),
                    onDismissed: (DismissDirection direction) async {
                      await db.deleteProduct(snapshot.data![index].id!);
                      setState(() {
                        snapshot.data!.remove(snapshot.data![index]);
                      });
                    },
                    child: Card(
                        child: ListTile(
                      contentPadding: const EdgeInsets.all(8.0),
                      title: Text("Product: " + snapshot.data![index].product),
                      subtitle: Text("Quantity: " + snapshot.data![index].quantity),
                    )),
                  );
                },
              );
            } 
            else {
              return const Center(child: Text("NO DATA!"));
              // CircularProgressIndicator());
            }
          },
        ),
        drawer: const SideNavigation());
  }
}
