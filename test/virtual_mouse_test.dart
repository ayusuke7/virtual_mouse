import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:virtual_mouse/virtual_mouse.dart';

void main() {
  testWidgets('VirtualMouse initializes correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VirtualMouse(
            child: Container(),
          ),
        ),
      ),
    );

    expect(find.byType(VirtualMouse), findsOneWidget);
  });
}
