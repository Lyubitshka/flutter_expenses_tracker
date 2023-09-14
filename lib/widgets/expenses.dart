import 'package:expenses_tracker_app_fifth_project/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expenses_tracker_app_fifth_project/models/expense.dart';
import 'package:expenses_tracker_app_fifth_project/widgets/expenses_list/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Books',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Korfu trip - villa',
      amount: 2720,
      date: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: 'CinemaCity',
      amount: 29.50,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Gluten free Oat Milk',
      amount: 6.59,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(onAddExpense: _addExpense));
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Expenses Tracker',
        ),
        // backgroundColor: const Color.fromARGB(255, 2, 166, 57),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          const Text(
            'The chart',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          //widget list
          Expanded(
            child: ExpensesList(
              expenses: _registeredExpenses,
              onRemoveExpense: _removeExpense,
            ),
          ),
        ],
      ),
    );
  }
}
