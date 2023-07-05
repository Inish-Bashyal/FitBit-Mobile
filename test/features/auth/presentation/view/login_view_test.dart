import 'package:dartz/dartz.dart';
import 'package:fitbit/config/router/app_route.dart';
import 'package:fitbit/features/auth/domain/use_case/auth_usecase.dart';
import 'package:fitbit/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_view_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AuthUseCase>(),
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AuthUseCase mockAuthUsecase;
  late bool isLogin;

  setUpAll(() async {
    // Because these mocks are already created in the register_view_test.dart file
    mockAuthUsecase = MockAuthUseCase();

    isLogin = true;
  });

  testWidgets('login test with username and password and open dashboard',
      (WidgetTester tester) async {
    when(mockAuthUsecase.loginUser('Inish', 'Inish123'))
        .thenAnswer((_) async => Right(isLogin));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authViewModelProvider
              .overrideWith((ref) => AuthViewModel(mockAuthUsecase)),
        ],
        child: MaterialApp(
          initialRoute: AppRoute.loginRoute,
          routes: AppRoute.getAppRoutes(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    // Type in first textformfield/TextField
    await tester.enterText(find.byType(TextField).at(0), 'Inish');
    // Type in second textformfield
    await tester.enterText(find.byType(TextField).at(1), 'Inish123');

    await tester.tap(
      find.widgetWithText(ElevatedButton, 'LOGIN'),
    );

    await tester.pumpAndSettle();

    expect(find.text('Popular Routines'), findsOneWidget);
  });
}
