class MyWalletModel {
  const MyWalletModel({
  required this.userId,
  required this.totalAmount,
  required this.transactions,
});

  final String userId;
  final String totalAmount;
  final List<Transaction> transactions;

  factory MyWalletModel.fromJson(Map<String, dynamic> json) => MyWalletModel(
    userId: json["userId"],
    totalAmount: json["totalAmount"],
    transactions: json["transactions"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "totalAmount": totalAmount,
    "transactions": transactions,
  };
}

class Transaction {
  const Transaction({
    required this.transactionId,
    required this.name,
    required this.date,
    required this.amount,
    required this.isSuccess,
  });
  final String transactionId;
  final String name;
  final DateTime date;
  final double amount;
  final bool isSuccess;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    transactionId: json["transactionId"],
    name: json["name"],
    date: DateTime.parse(json["date"]),
    amount: json["amount"],
    isSuccess: json["isSuccess"],
  );

  Map<String, dynamic> toJson() => {
    "transactionId": transactionId,
    "name": name,
    "date": date.toIso8601String(),
    "amount": amount,
    "isSuccess": isSuccess,
  };
}