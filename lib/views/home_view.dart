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
  @override
  Widget build(BuildContext context) {
    List<ExpensesModel> expense = [
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense tracker'),
        actions: [
          IconButton(
            onPressed:
                () => showModalBottomSheet(
                  context: context,
                  builder: (context) => ModalSheet(),
                ),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Text('The chart'),
          Expanded(child: ExpensesList(expenses: expense)),
        ],
      ),
    );
  }
}
