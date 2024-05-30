import 'package:bloc_test/bloc_test.dart';
import 'package:family_cash_manager/application/providers/expense_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ExpenseBloc', () {
    late ExpenseBloc expenseBloc;

    setUp(() {
      expenseBloc = ExpenseBloc();
    });

    tearDown(() {
      expenseBloc.close();
    });

    test('initial state is ExpenseInitial', () {
      expect(expenseBloc.state, ExpenseInitial());
    });

    blocTest<ExpenseBloc, ExpenseState>(
      'emits [ExpenseLoading] when AddExpense is added',
      build: () => expenseBloc,
      act: (bloc) => bloc.add(AddExpense(
        userId: 1,
        category: 'Food',
        amount: '100',
        date: '2024-06-18',
      )),
      expect: () => [
        ExpenseLoading(),
      ],
    );

    blocTest<ExpenseBloc, ExpenseState>(
      'emits [ExpenseLoading] when UpdateExpense is added',
      build: () => expenseBloc,
      act: (bloc) => bloc.add(UpdateExpense(
        id: 1,
        userId: 1,
        category: 'Food',
        amount: '200',
        date: '2024-06-18',
      )),
      expect: () => [
        ExpenseLoading(),
      ],
    );

    blocTest<ExpenseBloc, ExpenseState>(
      'emits [ExpenseLoading] when DeleteExpense is added with an invalid id',
      build: () => expenseBloc,
      act: (bloc) => bloc.add(DeleteExpense(id: 999)),
      expect: () => [
        ExpenseLoading(),
      ],
    );

  //   blocTest<ExpenseBloc, ExpenseState>(
  //     'emits [ExpenseLoading, ExpenseError] when GetExpenses is added and HTTP call fails',
  //     build: () => expenseBloc,
  //     act: (bloc) => bloc.add(GetExpenses()),
  //        expect: () => [
  //       ExpenseLoading(),
  //       isA<ExpenseError>(), 
  //     ],
  //   );
  });
  
}
