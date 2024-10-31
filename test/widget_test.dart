import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:grid_hero_flutter/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      title: "GRID DAN HERO",
      home: Home(),
    ));

    // Verify that initial elements are in place (you may need to adjust according to your UI).
    expect(find.text('0'), findsNothing);  // Adjust based on your actual UI
    expect(find.text('Superhero'), findsOneWidget); // Example of verifying the title in AppBar

    // Additional interaction and verification can be added here if needed.
  });
}
