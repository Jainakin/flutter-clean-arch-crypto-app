import 'package:flutter_clean_arch_crypto_app/features/explore/presentation/pages/explore_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_clean_arch_crypto_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Authentication Integration Test:', () {
    testWidgets('User can log in successfully', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify we are on the login page
      expect(find.text('Log in to your account'), findsOneWidget);

      // Enter email
      await tester.enterText(find.byType(TextFormField).at(0), 'test@test.com');
      await tester.pump();

      // Enter password
      await tester.enterText(find.byType(TextFormField).at(1), '123456');
      await tester.pump();

      // Tap the 'Continue' button
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      // Verify we are navigated to the explore page
      expect(find.byType(ExplorePage), findsOneWidget);
    });
  });
}
