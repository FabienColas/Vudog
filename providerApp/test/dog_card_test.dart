
import 'package:flutter/material.dart';
import 'package:flutter_dogapp/ui/widgets/dog_card.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test DogCard UI / UX', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      Widget widgetTest = new MediaQuery(
          data: new MediaQueryData(),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: MaterialApp(
              home: Scaffold(
                body: DogCard(
                  name: 'Australien Shepherd',
                  image: null,
                  origin: 'Australia',
                  lifespan: '13',
                  weightMetric: '20',
                  heightMetric: '30',
                  temperament: 'calm',
                ),
              ),
            ),
          )
      );
      await tester.pumpWidget(widgetTest);

      // Verify that card contain the good title
      expect(find.text('Australien Shepherd'), findsOneWidget);

      // Tap on the Dog Card.
      await tester.tap(find.byType(Card));
      await tester.pump();

      // Verify that the dialog contains every information
      expect(find.text('13'), findsOneWidget);
      expect(find.text('20'), findsOneWidget);
      expect(find.text('30'), findsOneWidget);
      expect(find.text('calm'), findsOneWidget);
      expect(find.text('Weight(kg)'), findsOneWidget);
      expect(find.text('Height(cm)'), findsOneWidget);
      expect(find.text('Lifespan(years)'), findsOneWidget);
      expect(find.text('Temperament'), findsOneWidget);

      // Tap on the Close button.
      await tester.tap(find.byType(OutlinedButton));
      await tester.pump();
  });
}
