import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integration_test_app/dummy_screen.dart';
import 'package:integration_test_app/home_screen.dart';
import 'package:integration_test_app/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
  });

  group('end-to-end test', () {
    testWidgets('no navigation', (tester) async {
      // run app widget.
      await tester.pumpWidget(
        const MainApp(),
      );

      await tester.pumpAndSettle();
      // Finds the LoginScreen.
      final dummyScreen = find.byType(DummyScreen);
      // Verify LoginScreen was actually found.
      expect(dummyScreen, findsOneWidget);

      final button = find.byType(ElevatedButton);
      await tester.tap(button);
       
      expect(find.text("Field can't be empty"), findsOneWidget);
    }, timeout: const Timeout(Duration(seconds: 90)));
    testWidgets('navigation', (tester) async {
      // run app widget.
      await tester.pumpWidget(
        const MainApp(),
      );

      await tester.pumpAndSettle();
      // Finds the LoginScreen.
      final dummyScreen = find.byType(DummyScreen);
      // Verify LoginScreen was actually found.
      expect(dummyScreen, findsOneWidget);

      final formField = find.byType(TextFormField);
      await tester.enterText(formField, "kjkjk");
      await tester.pumpAndSettle();

      final button = find.byType(ElevatedButton);
      await tester.tap(button);
      await tester.pumpAndSettle();
      expect(find.byType(HomeScreen), findsOneWidget);
    }, timeout: const Timeout(Duration(seconds: 90)));
  });
}
