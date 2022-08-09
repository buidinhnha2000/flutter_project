import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/pages/home_pages.dart';

 void main() {
  group('HomePage test', () {

    Finder checkBtn() => find.text('Check');
    Finder nextBtn() => find.text('Next');
    Finder priceInput() => find.byKey(const Key('priceInput'));

    testWidgets(
      'Change product name after each click',
      (WidgetTester tester) async{
        await tester.pumpWidget(const MaterialApp(
          home: HomePage(title: ''),
        ));

        expect(find.text(products[0].name), findsOneWidget);
        for (var i = 1; i < 5; i++) {
          await tester.tap(checkBtn());
          await tester.pump();
          expect(find.text(products[i].name), findsOneWidget);
        }
          await tester.tap(checkBtn());
          await tester.pump();
          expect(find.text(products[4].name), findsOneWidget);
      },
     );
     testWidgets('Check result & show nect product', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: HomePage(title: ''),
      ));
      
      expect(nextBtn(), findsNothing);
      expect(find.byKey(const Key('result')), findsNothing);
      await tester.enterText(priceInput(), '1');
      await tester.tap(checkBtn());
      await tester.pump();
      expect(nextBtn(), findsOneWidget);
      expect(find.byKey(const Key('result')), findsOneWidget);
      expect(find.text('pass'), findsOneWidget);

      await tester.tap(nextBtn());
      await tester.pump();

      expect(nextBtn(), findsNothing);
      expect(find.byKey(const Key('result')), findsNothing);
      await tester.enterText(priceInput(), '6');
      await tester.tap(checkBtn());
      await tester.pump();
      expect(nextBtn(), findsOneWidget);
      expect(find.byKey(const Key('result')), findsOneWidget);
      expect(find.text('fail'), findsOneWidget);

      await tester.enterText(priceInput(), '2');
      await tester.tap(checkBtn());
      await tester.pump();
      expect(find.text('pass'), findsOneWidget);
     });
  });
}