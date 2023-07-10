import 'package:cryptop/data/models/order_book_model.dart';
import 'package:cryptop/presentation/home/widgets/order_book_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  group('Order Book Widget', () {
    late Widget testWidget;
    OrderBookModel orderBook = OrderBookModel(
      asks: [
        ['26832', '0.03669155'],
        ['26833', '0.04994092'],
        ['26834', '0.78218976'],
        ['26835', '0.89282618'],
        ['26836', '0.00488942'],
      ],
      bids: [
        ['26831', '0.07827894'],
        ['26830', '0.05000000'],
        ['26829', '0.73541184'],
        ['26828', '0.46264509'],
        ['26528', '0.46264519'],
      ],
    );

    setUp(() {
      testWidget = Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: OrderBookWidget(orderBook: orderBook),
          locale: const Locale('en', 'IN'),
        );
      });
    });

    testWidgets('should display the texts correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      expect(find.text('ORDER BOOK'), findsOneWidget);
      expect(find.text('BID PRICE'), findsOneWidget);
      expect(find.text('ASK PRICE'), findsOneWidget);
      expect(find.text('QTY'), findsNWidgets(2));
      for (List<String> vals in orderBook.asks ?? []) {
        expect(find.text(vals[0]), findsAtLeastNWidgets(1));
        expect(find.text(vals[1]), findsAtLeastNWidgets(1));
      }
      for (List<String> vals in orderBook.bids ?? []) {
        expect(find.text(vals[0]), findsAtLeastNWidgets(1));
        expect(find.text(vals[1]), findsAtLeastNWidgets(1));
      }
    });
  });
}
