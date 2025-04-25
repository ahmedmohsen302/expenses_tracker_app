import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

final formmater = DateFormat.yMd();

enum Category { food, travel, liesure, work }

const categoryIcon = {
  Category.food: Icons.lunch_dining_rounded,
  Category.travel: Icons.flight,
  Category.liesure: Icons.movie,
  Category.work: Icons.work,
};

class ExpensesModel {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formmater.format(date);
  }

  ExpensesModel({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();
}

class ExpensesBucket {
  final Category category;
  final List<ExpensesModel> expenses;

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }

  ExpensesBucket({required this.category, required this.expenses});

  ExpensesBucket.forCategory(List<ExpensesModel> allExpenses, this.category)
    : expenses =
          allExpenses.where((expense) => expense.category == category).toList();
}
