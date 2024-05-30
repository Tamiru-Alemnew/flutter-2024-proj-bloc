
import 'package:bloc_test/bloc_test.dart';
import 'package:family_cash_manager/application/providers/family_members_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FamilyMembersBloc', () {
    late FamilyMembersBloc familyMembersBloc;

    setUp(() {
      familyMembersBloc = FamilyMembersBloc();
    });

    tearDown(() {
      familyMembersBloc.close();
    });

    test('initial state is FamilyMembersInitial', () {
      expect(familyMembersBloc.state, FamilyMembersInitial());
    });

    blocTest<FamilyMembersBloc, FamilyMembersState>(
      'emits [FamilyMembersLoading] when GetAllFamilyMembers is added',
      build: () => familyMembersBloc,
      act: (bloc) => bloc.add(GetAllFamilyMembers()),
      expect: () => [
        FamilyMembersLoading(),
      ],
    );

    // blocTest<FamilyMembersBloc, FamilyMembersState>(
    //   'emits [FamilyMembersLoading, FamilyMembersError] when GetAllFamilyMembers fails',
    //   build: () => familyMembersBloc,
    //   act: (bloc) => bloc.add(GetAllFamilyMembers()),
    //   expect: () => [
    //     FamilyMembersLoading(),
    //     isA<FamilyMembersError>(), 
    //   ],
    // );

    // blocTest<FamilyMembersBloc, FamilyMembersState>(
    //   'emits [FamilyMembersLoading] when UpdateRole is added',
    //   build: () => familyMembersBloc,
    //   act: (bloc) => bloc.add(UpdateRole(id: 1, role: 'admin')),
    //   expect: () => [
    //     FamilyMembersLoading(),
    //   ],
    // );
  });
}
