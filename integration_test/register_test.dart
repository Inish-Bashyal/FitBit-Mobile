import 'package:dartz/dartz.dart';
import 'package:fitbit/config/router/app_route.dart';
import 'package:fitbit/features/auth/domain/entity/user_entity.dart';
import 'package:fitbit/features/auth/domain/use_case/auth_usecase.dart';
import 'package:fitbit/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../test/features/auth/presentation/view/login_view_test.mocks.dart';

// import 'register_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AuthUseCase>()])
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  TestWidgetsFlutterBinding.ensureInitialized();

  late AuthUseCase mockAuthUsecase;

  late UserEntity authEntity;

  setUpAll(
    () async {
      mockAuthUsecase = MockAuthUseCase();

      authEntity = const UserEntity(
        userID: null,
        firstname: 'Inish',
        lastname: 'Bashyal',
        image: '',
        age: '22',
        email: 'inish.bashyal99@gmaill.com',
        gender: 'male',
        username: 'Inish',
        password: 'Inish123',
      );
    },
  );

  testWidgets('register view ...', (tester) async {
    when(mockAuthUsecase.registerUser(authEntity))
        .thenAnswer((_) async => const Right(true));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authViewModelProvider.overrideWith(
            (ref) => AuthViewModel(mockAuthUsecase),
          ),
        ],
        child: MaterialApp(
          initialRoute: AppRoute.registerRoute,
          routes: AppRoute.getAppRoutes(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Enter username in first textform field
    await tester.enterText(find.byType(TextFormField).at(0), 'Inish123');
    // Enter firstname in second textform field
    await tester.enterText(find.byType(TextFormField).at(1), 'Inish');
    // Enter lastname no
    await tester.enterText(find.byType(TextFormField).at(2), 'Bashyal');
    // Enter email
    await tester.enterText(
        find.byType(TextFormField).at(3), 'inish.bashyal99@gmail.com');
    // Enter password
    await tester.enterText(find.byType(TextFormField).at(4), 'Inish123');
    //Enter age
    await tester.enterText(find.byType(TextFormField).at(4), '22');

    //   //=========================== Find the dropdownformfield===========================

    //   // final dropdownFinder = find.byType(RadioListTile<Worko>);
    //   // //expect(dropdownFinder, findsOneWidget);
    //   // await tester.ensureVisible(dropdownFinder);

    //   // await tester.tap(dropdownFinder);

    //   // // Use this because the menu items are not visible
    //   // await tester.pumpAndSettle();

    //   // //tap on the first item in the dropdown
    //   // await tester.tap(find.byType(DropdownMenuItem<BatchEntity>).at(0));
    //   // //Use this to close the dropdown
    //   // await tester.pumpAndSettle();

    //=========================== Find the register button===========================
    final registerButtonFinder =
        find.widgetWithText(ElevatedButton, 'Register');

    await tester.tap(registerButtonFinder);

    await tester.pumpAndSettle();

    // Check weather the snackbar is displayed or not
    expect(find.widgetWithText(SnackBar, 'Registered successfully'),
        findsOneWidget);
  });
}
