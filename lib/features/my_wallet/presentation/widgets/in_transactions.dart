import 'package:flutter/material.dart';
import 'package:pile_up/features/my_wallet/presentation/widgets/transaction_example.dart';

class InTransactions extends StatelessWidget {
  const InTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 4,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index){
          return const TransactionExample(
            isTransactionIn: true,
            name: 'Mohamed Ahmed',
            date: '28/3/2024',
            isSuccess: true,
            amount: 800,
          );
        });
  }
}
