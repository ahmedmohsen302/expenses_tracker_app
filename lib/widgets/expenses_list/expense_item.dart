import 'package:expenses_tracker_app/models/expenses_model.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});
  final ExpensesModel expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
        child: Column(
          children: [
            Text(expense.title),
            SizedBox(height: 5),
            Row(
              children: [
                Text('\$ ${expense.amount.toStringAsFixed(2)}'),
                Spacer(),
                Row(
                  children: [Icon(Icons.alarm), Text(expense.date.toString())],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
