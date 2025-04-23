import 'package:expenses_tracker_app/views/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: ExpensesTrackerApp()));
}

class ExpensesTrackerApp extends StatelessWidget {
  const ExpensesTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeView();
  }
}
