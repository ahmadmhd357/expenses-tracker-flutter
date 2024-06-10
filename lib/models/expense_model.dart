import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMd();
const uuid = Uuid();

enum Catgory { food, entertainment, travel, bills }

const categoryIcons = {
  Catgory.food: Icons.restaurant_rounded,
  Catgory.entertainment: Icons.music_note_rounded,
  Catgory.travel: Icons.flight_takeoff_rounded,
  Catgory.bills: Icons.library_books,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Catgory category;

  String get formatedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.cat, required this.expenses});
  final Catgory cat;
  final List<Expense> expenses;

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.cat)
      : expenses =
            allExpenses.where((expense) => expense.category == cat).toList();

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
