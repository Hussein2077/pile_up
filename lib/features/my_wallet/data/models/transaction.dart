class Transaction {
  const Transaction({
    required this.id,
    required this.name,
    required this.date,
    required this.amount,
    required this.isSuccess,
  });
  final String id;
  final String name;
  final DateTime date;
  final double amount;
  final bool isSuccess;
}
