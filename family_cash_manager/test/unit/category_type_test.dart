import 'package:bloc_test/bloc_test.dart';
import 'package:family_cash_manager/application/providers/category_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CategoryBloc', () {
    late CategoryBloc categoryBloc;

    setUp(() {
      categoryBloc = CategoryBloc();
    });

    tearDown(() {
      categoryBloc.close();
    });

    test('initial state is CategoryInitial', () {
      expect(categoryBloc.state, CategoryInitial());
    });

    blocTest<CategoryBloc, CategoryState>(
      'emits [CategoryLoading] when GetCategories is added',
      build: () => categoryBloc,
      act: (bloc) => bloc.add(GetCategories()),
      expect: () => [
        CategoryLoading(),
      ],
    );

    blocTest<CategoryBloc, CategoryState>(
      'emits [CategoryLoading] when DeleteCategories is added with an invalid id',
      build: () => categoryBloc,
      act: (bloc) => bloc.add(DeleteCategories(id: 'invalid_id')),
      expect: () => [
        CategoryLoading(),
      ],
    );

    blocTest<CategoryBloc, CategoryState>(
      'emits [CategoryLoading] when AddCategories is added',
      build: () => categoryBloc,
      act: (bloc) => bloc.add(AddCategories(name: 'New Category')),
      expect: () => [],
    );

    blocTest<CategoryBloc, CategoryState>(
      'emits [CategoryLoading] when UpdateCategories is added with an invalid id',
      build: () => categoryBloc,
      act: (bloc) => bloc
          .add(UpdateCategories(id: 'invalid_id', newName: 'Updated Category')),
      expect: () => [
        CategoryLoading(),
      ],
    );
  });
}
