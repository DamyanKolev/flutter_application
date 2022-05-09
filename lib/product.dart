class Product {
  final int? id;
  final String product;
  final String quantity;

  Product({this.id, required this.product, required this.quantity});

  Product.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        product = res["product"],
        quantity = res["quantity"];

  Map<String, Object?> toMap() => {
        'id': id,
        'product': product,
        'quantity': quantity,
      };
}
