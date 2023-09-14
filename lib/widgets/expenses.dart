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
    final expenseIdx = _registeredExpenses.indexOf(expense);
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
              _registeredExpenses.insert(expenseIdx, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent =
        const Center(child: Text('No expenses found. Start adding some!'));

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

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
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
