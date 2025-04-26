import 'package:expenses_tracker_app/models/expenses_model.dart';
import 'package:expenses_tracker_app/widgets/chart/chart.dart';
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
                  isScrollControlled: true,
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
          Chart(expenses: expenses),
          Expanded(
            child:
                expenses.isNotEmpty
                    ? ExpensesList(
                      expenses: expenses,
                      onRemoveExpense: (ExpensesModel expense) {
                        final expenseIndex = expenses.indexOf(expense);
                        setState(() {
                          expenses.remove(expense);
                        });
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(seconds: 3),
                            content: Text('Expense deleted'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed:
                                  () => setState(() {
                                    expenses.insert(expenseIndex, expense);
                                  }),
                            ),
                          ),
                        );
                      },
                    )
                    : Center(child: Text('There is no expenses, try add some')),
          ),
        ],
      ),
    );
  }
}
