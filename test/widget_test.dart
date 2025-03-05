import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:e_warehouse_coba/main.dart';

void main() {
  testWidgets('Login widget test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Masuk'), findsOneWidget);
  });
}