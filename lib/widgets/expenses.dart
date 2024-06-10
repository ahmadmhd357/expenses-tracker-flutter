import 'package:expenses_tracker/models/expense_model.dart';
import 'package:expenses_tracker/widgets/chart/chart.dart';
import 'package:expenses_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expenses_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [];

  void _openAddExpense() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onSave: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text(
        'there is no expenses found! Click on the + icon to add new expenses...',
      ),
    );
    if (_registeredExpenses.isNotEmpty) {
      content = ExpensesList(
        expenses: _registeredExpenses.reversed.toList(),
        onExpenseRemove: _removeExpense,
      );
    }
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpense,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: width < 600
              ? Column(
                  children: [
                    Chart(expenses: _registeredExpenses),
                    Expanded(child: content)
                  ],
                )
              : Row(
                  children: [
                    Expanded(child: Chart(expenses: _registeredExpenses)),
                    Expanded(child: content)
                  ],
                )),
    );
  }
}
