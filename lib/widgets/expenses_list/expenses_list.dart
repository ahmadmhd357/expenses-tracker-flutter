import 'package:expenses_tracker/models/expense_model.dart';
import 'package:expenses_tracker/widgets/expenses_list/espenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onExpenseRemove,
  });
  final void Function(Expense expense) onExpenseRemove;
  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (cxt, i) => Dismissible(
        key: ValueKey(expenses[i]),
        onDismissed: (direction) {
          onExpenseRemove(expenses[i]);
        },
        child: ExpenseItem(expense: expenses[i]),
      ),
    );
  }
}
