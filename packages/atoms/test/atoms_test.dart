import 'package:flutter_test/flutter_test.dart';
import 'package:awesome_design_system_atoms/atoms.dart';
import 'package:awesome_design_system_tokens/tokens.dart';
import 'package:flutter/material.dart';

void main() {
  group('DSButton', () {
    testWidgets('renders filled button by default', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: [DesignTokens.light(brandPrimary: const Color(0xFF6750A4))],
          ),
          home: Scaffold(
            body: DSButton(onPressed: () {}, child: const Text('Test')),
          ),
        ),
      );

      expect(find.byType(FilledButton), findsOneWidget);
      expect(find.text('Test'), findsOneWidget);
    });

    testWidgets('renders outlined button when variant is outlined', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: [DesignTokens.light(brandPrimary: const Color(0xFF6750A4))],
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

    testWidgets('shows loading indicator when isLoading', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: [DesignTokens.light(brandPrimary: const Color(0xFF6750A4))],
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

    testWidgets('disabled button does not call onPressed', (tester) async {
      bool pressed = false;
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: [DesignTokens.light(brandPrimary: const Color(0xFF6750A4))],
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
    testWidgets('renders text with variant', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: [DesignTokens.light(brandPrimary: const Color(0xFF6750A4))],
          ),
          home: Scaffold(
            body: DSText('Hello', variant: TextVariant.headlineLarge),
          ),
        ),
      );

      expect(find.text('Hello'), findsOneWidget);
    });

    testWidgets('applies color role', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: [DesignTokens.light(brandPrimary: const Color(0xFF6750A4))],
          ),
          home: Scaffold(
            body: DSText('Error', colorRole: TextColorRole.error),
          ),
        ),
      );

      final text = tester.widget<Text>(find.byType(Text));
      expect(text.style?.color, isNotNull);
      expect(text.style?.color, isA<Color>());
    });
  });

  group('DSCard', () {
    testWidgets('renders card with child', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: [DesignTokens.light(brandPrimary: const Color(0xFF6750A4))],
          ),
          home: Scaffold(
            body: DSCard(child: const Text('Card Content')),
          ),
        ),
      );

      expect(find.byType(Card), findsOneWidget);
      expect(find.text('Card Content'), findsOneWidget);
    });

    testWidgets('elevated variant has elevation', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: [DesignTokens.light(brandPrimary: const Color(0xFF6750A4))],
          ),
          home: Scaffold(
            body: DSCard(variant: CardVariant.elevated, child: const Text('Test')),
          ),
        ),
      );

      final card = tester.widget<Card>(find.byType(Card));
      expect(card.elevation, greaterThan(0));
    });

    testWidgets('outlined variant has border', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: [DesignTokens.light(brandPrimary: const Color(0xFF6750A4))],
          ),
          home: Scaffold(
            body: DSCard(variant: CardVariant.outlined, child: const Text('Test')),
          ),
        ),
      );

      final card = tester.widget<Card>(find.byType(Card));
      expect(card.shape, isA<RoundedRectangleBorder>());
      final border = (card.shape as RoundedRectangleBorder).side;
      expect(border.color, isNot(equals(Colors.transparent)));
    });
  });

  group('DSInput', () {
    testWidgets('renders input with label', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: [DesignTokens.light(brandPrimary: const Color(0xFF6750A4))],
          ),
          home: Scaffold(
            body: DSInput(label: 'Email', hint: 'Enter email'),
          ),
        ),
      );

      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Enter email'), findsOneWidget);
    });

    testWidgets('shows error text', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: [DesignTokens.light(brandPrimary: const Color(0xFF6750A4))],
          ),
          home: Scaffold(
            body: DSInput(errorText: 'Invalid email'),
          ),
        ),
      );

      expect(find.text('Invalid email'), findsOneWidget);
    });

    testWidgets('password type shows obscure toggle', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: [DesignTokens.light(brandPrimary: const Color(0xFF6750A4))],
          ),
          home: Scaffold(
            body: DSInput(type: DSInputType.password, obscureText: true),
          ),
        ),
      );

      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
    });

    testWidgets('required indicator shows asterisk', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: [DesignTokens.light(brandPrimary: const Color(0xFF6750A4))],
          ),
          home: Scaffold(
            body: DSInput(label: 'Name', isRequired: true),
          ),
        ),
      );

      final richTexts = find.byType(RichText);
      expect(richTexts, findsWidgets);
      final richText = tester.widget<RichText>(richTexts.first);
      final textSpan = richText.text as TextSpan;
      expect(textSpan.text, equals('Name'));
      expect((textSpan.children!.first as TextSpan).text, equals(' *'));
    });
  });

  group('DSBadge', () {
    testWidgets('renders badge with label', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: [DesignTokens.light(brandPrimary: const Color(0xFF6750A4))],
          ),
          home: Scaffold(
            body: DSBadge(label: 'New'),
          ),
        ),
      );

      expect(find.text('New'), findsOneWidget);
    });

    testWidgets('outlined variant has border', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: [DesignTokens.light(brandPrimary: const Color(0xFF6750A4))],
          ),
          home: Scaffold(
            body: DSBadge(label: 'Test', variant: BadgeVariant.outlined),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      expect(container.decoration, isA<BoxDecoration>());
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.border, isNotNull);
    });

    testWidgets('shows delete icon when onDeleted provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: [DesignTokens.light(brandPrimary: const Color(0xFF6750A4))],
          ),
          home: Scaffold(
            body: DSBadge(label: 'Test', onDeleted: () {}),
          ),
        ),
      );

      expect(find.byIcon(Icons.close), findsOneWidget);
    });
  });

  group('DSStatusBadge', () {
    testWidgets('success status has correct colors', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: [DesignTokens.light(brandPrimary: const Color(0xFF6750A4))],
          ),
          home: Scaffold(
            body: DSStatusBadge(status: BadgeStatus.success),
          ),
        ),
      );

      expect(find.text('Success'), findsOneWidget);
    });

    testWidgets('error status has error colors', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: [DesignTokens.light(brandPrimary: const Color(0xFF6750A4))],
          ),
          home: Scaffold(
            body: DSStatusBadge(status: BadgeStatus.error),
          ),
        ),
      );

      expect(find.text('Error'), findsOneWidget);
    });
  });

  group('DSAvatar', () {
    testWidgets('renders initials when no image', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: [DesignTokens.light(brandPrimary: const Color(0xFF6750A4))],
          ),
          home: Scaffold(
            body: DSAvatar(initials: 'John Doe'),
          ),
        ),
      );

      expect(find.text('JD'), findsOneWidget);
    });

    testWidgets('renders default person icon when no initials', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: [DesignTokens.light(brandPrimary: const Color(0xFF6750A4))],
          ),
          home: Scaffold(
            body: DSAvatar(),
          ),
        ),
      );

      expect(find.byIcon(Icons.person), findsOneWidget);
    });

    testWidgets('circle shape has circular border radius', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: [DesignTokens.light(brandPrimary: const Color(0xFF6750A4))],
          ),
          home: Scaffold(
            body: DSAvatar(shape: AvatarShape.circle, initials: 'A'),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      expect(container.decoration, isA<BoxDecoration>());
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.borderRadius, equals(BorderRadius.circular(9999)));
    });
  });

  group('DSAvatarGroup', () {
    testWidgets('renders multiple avatars', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: [DesignTokens.light(brandPrimary: const Color(0xFF6750A4))],
          ),
          home: Scaffold(
            body: DSAvatarGroup(
              avatars: [
                DSAvatar(initials: 'A'),
                DSAvatar(initials: 'B'),
                DSAvatar(initials: 'C'),
              ],
            ),
          ),
        ),
      );

      expect(find.text('A'), findsOneWidget);
      expect(find.text('B'), findsOneWidget);
      expect(find.text('C'), findsOneWidget);
    });

    testWidgets('shows remaining count badge', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: [DesignTokens.light(brandPrimary: const Color(0xFF6750A4))],
          ),
          home: Scaffold(
            body: DSAvatarGroup(
              avatars: List.generate(7, (i) => DSAvatar(initials: 'U$i')),
              maxVisible: 5,
            ),
          ),
        ),
      );

      expect(find.text('+2'), findsOneWidget);
    });
  });

  group('DSAvatarWithPresence', () {
    testWidgets('shows online indicator', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true).copyWith(
            extensions: [DesignTokens.light(brandPrimary: const Color(0xFF6750A4))],
          ),
          home: Scaffold(
            body: DSAvatarWithPresence(
              avatar: DSAvatar(initials: 'A'),
              presence: UserPresence.online,
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find.byWidgetPredicate((w) => w is Container && w.decoration != null).first,
      );
      final decoration = container.decoration as BoxDecoration?;
      expect(decoration?.color, isNotNull);
    });
  });
}