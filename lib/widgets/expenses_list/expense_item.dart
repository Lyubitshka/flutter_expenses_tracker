import 'package:expenses_tracker_app_fifth_project/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(
      {super.key, required this.expense}); // <---- constructor function

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  '${expense.amount.toStringAsFixed(2)} zł',
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 8),
                    Text(
                      expense.formattedDate,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
