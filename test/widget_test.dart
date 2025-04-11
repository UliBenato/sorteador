// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:sorteador/main.dart';
import 'package:sorteador/sort_controller.dart';

void main() {
  testWidgets('Teste do Sorteador', (WidgetTester tester) async {
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => SORTController(),
      child: const MyApp(),
    ));
    expect(find.text("Por favor, insira um nome na lista"), findsNothing);
    expect(find.byType(ListTile), findsNothing);

    await tester.tap(find.byKey(Key('addButton'))); //cria regras de UI antes da codificação
    await tester.pump();
    expect(find.text("Por favor, insira um nome na lista"), findsOneWidget);

    await tester.enterText(find.byType(TextField), "João");
    await tester.tap(find.byKey(Key('addButton')));
    await tester.pumpAndSettle();
    expect(find.widgetWithText(ListTile, "João"), findsOneWidget);

    await tester.tap(find.byType(TextButton));
    await tester.pump();
    expect(find.text("João"), findsNothing);
    expect(find.text("Lista de nomes limpa!"), findsOneWidget);

    await tester.enterText(find.byType(TextField), "João");
    await tester.tap(find.byKey(Key('addButton')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('sortearButton')));
    await tester.pumpAndSettle();
    expect(find.text("Sorteado: João"), findsOneWidget);
  });
}
