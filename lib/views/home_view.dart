import 'package:expenses_tracker_app/models/expenses_model.dart';
import 'package:expenses_tracker_app/widgets/expenses_list/expenses_list.dart';
import 'package:expenses_tracker_app/widgets/modal_sheet.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<ExpensesModel> expenses = [
    ExpensesModel(
      title: 'pizza',
      amount: 150,
      date: DateTime.now(),
      category: Category.food,
    ),
    ExpensesModel(
      title: 'cinema',
      amount: 200,
      date: DateTime.now(),
      category: Category.liesure,
    ),
    ExpensesModel(
      title: 'tour',
      amount: 1000,
      date: DateTime.now(),
      category: Category.travel,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense tracker'),
        actions: [
          IconButton(
            onPressed:
                () => showModalBottomSheet(
                  context: context,
                  builder:
                      (context) => ModalSheet(
                        onAddExpense: (ExpensesModel expense) {
                          setState(() {
                            expenses.add(expense);
                          });
                        },
                      ),
                ),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Text('The chart'),
          Expanded(child: ExpensesList(expenses: expenses)),
        ],
      ),
    );
  }
}
