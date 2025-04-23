import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, travel, liesure, work }

class ExpensesModel {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  ExpensesModel({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();
}
