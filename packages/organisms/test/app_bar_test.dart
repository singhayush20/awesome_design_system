import 'package:awesome_design_system_organisms/organisms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('renders the default back button when required', (
    WidgetTester tester,
  ) async {
    bool pressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: DSAppBar(
            title: 'Details',
            backButtonRequired: true,
            onBackPressed: () => pressed = true,
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.arrow_back_ios_new), findsOneWidget);
    await tester.tap(find.byIcon(Icons.arrow_back_ios_new));
    expect(pressed, isTrue);
  });

  testWidgets(
    'does not render a leading widget when back button is not required',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(appBar: DSAppBar(title: 'Home')),
        ),
      );

      expect(find.byIcon(Icons.arrow_back_ios_new), findsNothing);
    },
  );

  testWidgets('uses a custom leading widget when provided', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          appBar: DSAppBar(
            title: 'Details',
            backButtonRequired: true,
            leading: Icon(Icons.close),
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.close), findsOneWidget);
    expect(find.byIcon(Icons.arrow_back_ios_new), findsNothing);
  });
}
