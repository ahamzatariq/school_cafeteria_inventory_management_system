import 'item.dart';

class Transaction {
  String id;
  Item item;
  String userId;
  int amount;
  int type;
  int quantity;
  DateTime created;

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
    return Transaction();
  }
}
