import 'package:bloc_test/bloc_test.dart';
import 'package:family_cash_manager/application/providers/user_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserBloc', () {
    late UserBloc userBloc;

    setUp(() {
      userBloc = UserBloc();
    });

    tearDown(() {
      userBloc.close();
    });

    test('initial state is UserInitial', () {
      expect(userBloc.state, UserInitial());
    });

    blocTest<UserBloc, UserState>(
      'emits [UserLoading] when UserLogin is added',
      build: () => userBloc,
      act: (bloc) =>
          bloc.add(UserLogin(email: 'test@example.com', password: 'password')),
      expect: () => [
        UserLoading(),
      ],
    );

    blocTest<UserBloc, UserState>(
      'emits [UserLoading, UserError] when UserLogin fails',
      build: () => userBloc,
      act: (bloc) => bloc.add(
          UserLogin(email: 'tamiru@gmail.com', password: 'Aguero@1')),
      expect: () => [
        UserLoading()
      ],
    );

    blocTest<UserBloc, UserState>(
      'emits [UserLoading] when UserSignUp is added',
      build: () => userBloc,
      act: (bloc) => bloc.add(UserSignUp(
        name: 'Test User',
        email: 'test@example.com',
        password: 'password',
        role: 'user',
      )),
      expect: () => [
        UserLoading(),
      ],
    );

    blocTest<UserBloc, UserState>(
      'emits [UserLoading, UserError] when UserSignUp fails',
      build: () => userBloc,
      act: (bloc) => bloc.add(UserSignUp(
        name: 'Test User',
        email: 'test@example.com',
        password: 'password',
        role: 'user',
      )),
      expect: () => [
        UserLoading()
      ],
    );

    blocTest<UserBloc, UserState>(
      'emits [UserInitial] when Logout is added',
      build: () => userBloc,
      act: (bloc) => bloc.add(Logout()),
      expect: () => [
        UserInitial(),
      ],
    );
  });
}
