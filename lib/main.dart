import 'package:expenses_tracker_app/constants.dart';
import 'package:expenses_tracker_app/views/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: ExpensesTrackerApp(),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kDarkColorScheme.onPrimary,
          centerTitle: true,
          foregroundColor: kDarkColorScheme.primary,
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        cardTheme: CardTheme().copyWith(
          color: kDarkColorScheme.onPrimary,
          shadowColor: kDarkColorScheme.primary,
          margin: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          surfaceTintColor: kDarkColorScheme.surfaceTint,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
        bottomSheetTheme: BottomSheetThemeData().copyWith(
          // backgroundColor: kDarkColorScheme.onPrimary,
          surfaceTintColor: kDarkColorScheme.surfaceTint,
          dragHandleColor: kDarkColorScheme.inversePrimary,
        ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kColorScheme.primary,
          centerTitle: true,
          foregroundColor: kColorScheme.onPrimary,
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        cardTheme: CardTheme().copyWith(
          color: kColorScheme.surfaceContainer,
          shadowColor: kColorScheme.onSurface,
          margin: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          elevation: 6,
          surfaceTintColor: kColorScheme.surfaceTint,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
            foregroundColor: kColorScheme.onPrimaryContainer,
          ),
        ),
        bottomSheetTheme: BottomSheetThemeData().copyWith(
          backgroundColor: kColorScheme.onPrimary,
          surfaceTintColor: kColorScheme.primary,
          dragHandleColor: kColorScheme.inversePrimary,
        ),
      ),
    ),
  );
}

class ExpensesTrackerApp extends StatelessWidget {
  const ExpensesTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeView();
  }
}
