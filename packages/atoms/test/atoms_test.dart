import 'package:flutter_test/flutter_test.dart';
import 'package:awesome_design_system_atoms/atoms.dart';
import 'package:awesome_design_system_tokens/tokens.dart';
import 'package:flutter/material.dart';

void main() {
  group('DSButton', () {
    testWidgets('renders filled button by default', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: <ThemeExtension<dynamic>>[
              DesignTokens.light(brandPrimary: const Color(0xFF6750A4)),
            ],
          ),
          home: Scaffold(
            body: DSButton(onPressed: () {}, child: const Text('Test')),
          ),
        ),
      );

      expect(find.byType(FilledButton), findsOneWidget);
      expect(find.text('Test'), findsOneWidget);
    });

    testWidgets('renders outlined button when variant is outlined', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: <ThemeExtension<dynamic>>[
              DesignTokens.light(brandPrimary: const Color(0xFF6750A4)),
            ],
          ),
          home: Scaffold(
            body: DSButton(
              variant: ButtonVariant.outlined,
              onPressed: () {},
              child: const Text('Test'),
            ),
          ),
        ),
      );

      expect(find.byType(OutlinedButton), findsOneWidget);
    });

    testWidgets('shows loading indicator when isLoading', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: <ThemeExtension<dynamic>>[
              DesignTokens.light(brandPrimary: const Color(0xFF6750A4)),
            ],
          ),
          home: Scaffold(
            body: DSButton(
              isLoading: true,
              onPressed: () {},
              child: const Text('Test'),
            ),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('disabled button does not call onPressed', (
      WidgetTester tester,
    ) async {
      bool pressed = false;
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: <ThemeExtension<dynamic>>[
              DesignTokens.light(brandPrimary: const Color(0xFF6750A4)),
            ],
          ),
          home: Scaffold(
            body: DSButton(
              isDisabled: true,
              onPressed: () => pressed = true,
              child: const Text('Test'),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(DSButton));
      expect(pressed, isFalse);
    });
  });

  group('DSText', () {
    testWidgets('renders text with variant', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: <ThemeExtension<dynamic>>[
              DesignTokens.light(brandPrimary: const Color(0xFF6750A4)),
            ],
          ),
          home: const Scaffold(
            body: DSText('Hello', variant: TextVariant.headlineLarge),
          ),
        ),
      );

      expect(find.text('Hello'), findsOneWidget);
    });

    testWidgets('applies color role', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: <ThemeExtension<dynamic>>[
              DesignTokens.light(brandPrimary: const Color(0xFF6750A4)),
            ],
          ),
          home: const Scaffold(
            body: DSText('Error', colorRole: TextColorRole.error),
          ),
        ),
      );

      final Text text = tester.widget<Text>(find.byType(Text));
      expect(text.style?.color, isNotNull);
      expect(text.style?.color, isA<Color>());
    });
  });

  group('DSCard', () {
    testWidgets('renders card with child', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: <ThemeExtension<dynamic>>[
              DesignTokens.light(brandPrimary: const Color(0xFF6750A4)),
            ],
          ),
          home: const Scaffold(body: DSCard(child: Text('Card Content'))),
        ),
      );

      expect(find.byType(Card), findsOneWidget);
      expect(find.text('Card Content'), findsOneWidget);
    });

    testWidgets('elevated variant has elevation', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: <ThemeExtension<dynamic>>[
              DesignTokens.light(brandPrimary: const Color(0xFF6750A4)),
            ],
          ),
          home: const Scaffold(body: DSCard(child: Text('Test'))),
        ),
      );

      final Card card = tester.widget<Card>(find.byType(Card));
      expect(card.elevation, greaterThan(0));
    });

    testWidgets('outlined variant has border', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: <ThemeExtension<dynamic>>[
              DesignTokens.light(brandPrimary: const Color(0xFF6750A4)),
            ],
          ),
          home: const Scaffold(
            body: DSCard(variant: CardVariant.outlined, child: Text('Test')),
          ),
        ),
      );

      final Card card = tester.widget<Card>(find.byType(Card));
      expect(card.shape, isA<RoundedRectangleBorder>());
      final BorderSide border = (card.shape as RoundedRectangleBorder).side;
      expect(border.color, isNot(equals(Colors.transparent)));
    });
  });

  group('DSInput', () {
    testWidgets('renders input with label', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: <ThemeExtension<dynamic>>[
              DesignTokens.light(brandPrimary: const Color(0xFF6750A4)),
            ],
          ),
          home: const Scaffold(
            body: DSInput(label: 'Email', hint: 'Enter email'),
          ),
        ),
      );

      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Enter email'), findsOneWidget);
    });

    testWidgets('shows error text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: <ThemeExtension<dynamic>>[
              DesignTokens.light(brandPrimary: const Color(0xFF6750A4)),
            ],
          ),
          home: const Scaffold(body: DSInput(errorText: 'Invalid email')),
        ),
      );

      expect(find.text('Invalid email'), findsOneWidget);
    });

    testWidgets('password type shows obscure toggle', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: <ThemeExtension<dynamic>>[
              DesignTokens.light(brandPrimary: const Color(0xFF6750A4)),
            ],
          ),
          home: const Scaffold(
            body: DSInput(type: DSInputType.password, obscureText: true),
          ),
        ),
      );

      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
    });

    testWidgets('required indicator shows asterisk', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: <ThemeExtension<dynamic>>[
              DesignTokens.light(brandPrimary: const Color(0xFF6750A4)),
            ],
          ),
          home: const Scaffold(body: DSInput(label: 'Name', isRequired: true)),
        ),
      );

      final Finder richTexts = find.byType(RichText);
      expect(richTexts, findsWidgets);
      final RichText richText = tester.widget<RichText>(richTexts.first);
      final TextSpan textSpan = richText.text as TextSpan;
      expect(textSpan.text, equals('Name'));
      expect((textSpan.children!.first as TextSpan).text, equals(' *'));
    });
  });

  group('DSBadge', () {
    testWidgets('renders badge with label', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: <ThemeExtension<dynamic>>[
              DesignTokens.light(brandPrimary: const Color(0xFF6750A4)),
            ],
          ),
          home: const Scaffold(body: DSBadge(label: 'New')),
        ),
      );

      expect(find.text('New'), findsOneWidget);
    });

    testWidgets('outlined variant has border', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: <ThemeExtension<dynamic>>[
              DesignTokens.light(brandPrimary: const Color(0xFF6750A4)),
            ],
          ),
          home: const Scaffold(
            body: DSBadge(label: 'Test', variant: BadgeVariant.outlined),
          ),
        ),
      );

      final Container container = tester.widget<Container>(
        find.byType(Container).first,
      );
      expect(container.decoration, isA<BoxDecoration>());
      final BoxDecoration decoration = container.decoration as BoxDecoration;
      expect(decoration.border, isNotNull);
    });

    testWidgets('shows delete icon when onDeleted provided', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: <ThemeExtension<dynamic>>[
              DesignTokens.light(brandPrimary: const Color(0xFF6750A4)),
            ],
          ),
          home: Scaffold(
            body: DSBadge(label: 'Test', onDeleted: () {}),
          ),
        ),
      );

      expect(find.byIcon(Icons.close), findsOneWidget);
    });
  });

  group('DSAvatar', () {
    testWidgets('renders initials when no image', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: <ThemeExtension<dynamic>>[
              DesignTokens.light(brandPrimary: const Color(0xFF6750A4)),
            ],
          ),
          home: const Scaffold(body: DSAvatar(initials: 'John Doe')),
        ),
      );

      expect(find.text('JD'), findsOneWidget);
    });

    testWidgets('renders default person icon when no initials', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: <ThemeExtension<dynamic>>[
              DesignTokens.light(brandPrimary: const Color(0xFF6750A4)),
            ],
          ),
          home: const Scaffold(body: DSAvatar()),
        ),
      );

      expect(find.byIcon(Icons.person), findsOneWidget);
    });

    testWidgets('circle shape has circular border radius', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: <ThemeExtension<dynamic>>[
              DesignTokens.light(brandPrimary: const Color(0xFF6750A4)),
            ],
          ),
          home: const Scaffold(body: DSAvatar(initials: 'A')),
        ),
      );

      final Container container = tester.widget<Container>(
        find.byType(Container).first,
      );
      expect(container.decoration, isA<BoxDecoration>());
      final BoxDecoration decoration = container.decoration as BoxDecoration;
      expect(decoration.borderRadius, equals(BorderRadius.circular(9999)));
    });
  });

}
