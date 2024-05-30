import 'package:family_cash_manager/application/providers/category_bloc.dart';
import 'package:family_cash_manager/application/providers/expense_bloc.dart';
import 'package:family_cash_manager/application/providers/user_bloc.dart';
import 'package:family_cash_manager/presentation/screens/login_page.dart';
import 'package:family_cash_manager/presentation/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:family_cash_manager/presentation/screens/budgeting_goal.dart';
import 'package:family_cash_manager/presentation/screens/children.dart';
import 'package:family_cash_manager/presentation/screens/edit_category.dart';
import 'package:family_cash_manager/presentation/screens/expenses.dart';
import 'package:family_cash_manager/presentation/screens/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:family_cash_manager/application/providers/family_members_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(),
        ),
        BlocProvider<CategoryBloc>(
          create: (context) => CategoryBloc()
        ),
        BlocProvider<ExpenseBloc>(
          create: (context) => ExpenseBloc()
        ),
        BlocProvider<FamilyMembersBloc>(
          create: (context) => FamilyMembersBloc()
        ),
        ],
        
      child: MaterialApp(
        routes: {
          '/': (context) => LoginPage(),
          '/home': (context) => HomePage(),
          '/signUp': (context) => SignUp(),
          '/addExpense': (context) => EditExpensePage(),
          '/editCategories': (context) => EditCategoryPage(),
          '/manageChildren': (context) => ManageChildren(),
          '/budgetingGoal': (context) => BudgetAndGoal(),
        },
        title: 'Family Cash Manager',
        theme: ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }
}
