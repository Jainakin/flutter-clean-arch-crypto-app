import 'package:flutter_clean_arch_crypto_app/features/explore/presentation/pages/explore_page.dart';
import 'package:flutter_clean_arch_crypto_app/features/transactions/presentation/pages/tezos_transaction_details_page.dart';
import 'package:flutter_clean_arch_crypto_app/features/transactions/presentation/pages/tezos_transactions_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_clean_arch_crypto_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Tezos Transaction Details Integration Test:', () {
    testWidgets('User can navigate to Tezos transactions and view details',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Perform login
      await tester.enterText(find.byType(TextFormField).at(0), 'test@test.com');
      await tester.pump();
      await tester.enterText(find.byType(TextFormField).at(1), '123456');
      await tester.pump();
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      // Verify we are on the explore page
      expect(find.byType(ExplorePage), findsOneWidget);

      // Tap on Bitcoin in My Assets section
      await tester.tap(find.text('Tezos').first);
      await tester.pumpAndSettle();

      // Verify we are navigated to the Transactions List page
      expect(find.byType(TezosTransactionsListPage), findsOneWidget);

      // Wait for loading to complete
      await tester.pumpAndSettle();

      // Tap on the first item in the ListView
      await tester.tap(find.byType(GestureDetector).first);
      await tester.pumpAndSettle();

      // Verify we are navigated to the Transaction Details page
      expect(find.byType(TezosTransactionDetailsPage), findsOneWidget);
    });
  });
}
