import 'package:flutter/material.dart';
import 'package:family_cash_manager/widgets/drop_down.dart';
import 'package:family_cash_manager/widgets/date_selector.dart';
import 'package:flutter/widgets.dart';

class ExpensePage extends StatefulWidget {
  const ExpensePage({Key? key});

  @override
  _ExpensePageState createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  List<Expense> expenses = [];
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(

  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      const DrawerHeader(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/logo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Text('Family Cash Manager'),
      ),
       ListTile(
              title: const Text('Home page'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
      ListTile(
        title: const Text('Add Expense'),
        onTap: () {
         
        },
      ),
      ListTile(
        title: const Text('Edit Category'),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ),
     
    ],
  ),
)
      ,
      appBar: AppBar(
        title: const Text('Add Expense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Category',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                DropdownMenus(),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Amount',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter amount',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Date',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            DateSelector(),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
                    alignment: Alignment.center,
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 36, 120, 109))),
                onPressed: () {
                  setState(() {
                    expenses.add(Expense(
                      category: DropdownMenus.dropdownValue,
                      amount: 100,
                      date: _selectedDate ?? DateTime.now(),
                    ));
                  });
                },
                child: Text(
                  'Add Expense',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Selected Expenses',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: DataTable(
                  headingRowColor: MaterialStateColor.resolveWith(
                      (states) => Colors.green[300]!),
                  columns: const [
                    DataColumn(
                        label: Text('Category',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Amount',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Date',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                  rows: expenses.map((expense) {
                    return DataRow(
                      cells: [
                        DataCell(Text(expense.category)),
                        DataCell(Text(expense.amount.toString())),
                        DataCell(Text(expense.date.toString())),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Expense {
  final String category;
  final double amount;
  final DateTime date;

  Expense({
    required this.category,
    required this.amount,
    required this.date,
  });
}