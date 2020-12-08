class Item {
  String id;
  String name;
  int quantity;
  double buyingPrice;
  double sellingPrice;
  double profitPerPiece;
  String brand;

  Item(
      {this.id,
      this.name,
      this.quantity,
      this.buyingPrice,
      this.sellingPrice,
      this.profitPerPiece,
      this.brand});

  Item fromMap(Map<String, dynamic> itemMap) {
    return Item(
        id: itemMap['id'],
        name: itemMap['Name'],
        quantity: itemMap['QtyInStock'],
        buyingPrice: double.parse(itemMap['BuyingPrice']),
        sellingPrice: double.parse(itemMap['SellingPrice']),
        profitPerPiece: double.parse(itemMap['ProfitPerPiece']),
        brand: itemMap['Brand']);
  }
}
