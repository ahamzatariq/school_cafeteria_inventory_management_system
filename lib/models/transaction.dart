import 'item.dart';

class Transaction {
  String id;
  Item item;
  int userId;
  int amount;
  int type;
  int quantity;
  String created;

  Transaction({
    this.id,
    this.item,
    this.userId,
    this.amount,
    this.type,
    this.quantity,
    this.created,
  });

  Transaction fromMap(Map<String, dynamic> transactionMap) {
    return Transaction(
      id: transactionMap['id'],
      item: Item(id: transactionMap['Item']),
      userId: transactionMap['User_id'],
      amount: transactionMap['Amount'],
      type: transactionMap['Type'],
      quantity: transactionMap['Qty'],
      created: transactionMap['Created'],
    );
  }
}
