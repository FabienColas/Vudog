
import 'package:flutter/material.dart';
import 'package:flutter_dogapp/ui/screens/login_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test Login UI / UX', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    Widget widgetTest = new MediaQuery(
        data: new MediaQueryData(),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: MaterialApp(
              home: LoginPage())
          ),
        );
    await tester.pumpWidget(widgetTest);

    // Verify that login page contain every constants
    expect(find.text('Vudog'), findsOneWidget);
    expect(find.text('Username'), findsOneWidget);
    expect(find.text('dog@gmail.com'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('********'), findsOneWidget);

    // Tap on the pets Button
    await tester.tap(find.byType(MaterialButton));
    await tester.pump();

    // Verify Form Watch Dogs information
    expect(find.text('Please enter your email'), findsOneWidget);
    expect(find.text('Please enter your password'), findsOneWidget);

  });
}
