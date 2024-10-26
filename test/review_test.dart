import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bible/main.dart'; // Make sure this points to your correct main file

void main() {
  testWidgets('Task submission test', (WidgetTester tester) async {
    // Build the TodoApp widget and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: TodoApp()));

    // Verify that the initial message "No tasks yet." is displayed (if applicable).
   expect(find.text("Enter a task"), findsOneWidget);

    // Enter text into the task input field.
    await tester.enterText(find.byType(TextField), 'This is a test task');

    // Tap the add button to submit the task.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump(); // Trigger a frame update

    // Verify that the task is now displayed and the initial message is gone.
    expect(find.text("Enter a task"), findsNothing);
    expect(find.text('This is a test task'), findsOneWidget);

    // Verify that the TextField is cleared after submission.
    final textField = find.byType(TextField).evaluate().single.widget as TextField;
    expect(textField.controller?.text ?? '', equals(''));
  });
}
