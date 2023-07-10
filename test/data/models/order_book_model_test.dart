import 'package:cryptop/data/models/order_book_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OrderBookModel', () {
    test('fromJson creates a valid OrderBookModel instance', () {
      final json = {
        'timestamp': '1684001939',
        'microtimestamp': '1684001939505119',
        'bids': [
          ['26831', '0.07827894'],
          ['26830', '0.05000000'],
          ['26829', '0.73541184'],
          ['26828', '0.46264509'],
          ['26528', '0.46264519'],
          ['25928', '0.46264529'],
          ['26868', '0.46264549']
        ],
        'asks': [
          ['26832', '0.03669155'],
          ['26833', '0.04994092'],
          ['26834', '0.78218976'],
          ['26835', '0.89282618'],
          ['26836', '0.00488942'],
          ['26839', '0.42259795'],
          ['26840', '0.37268655'],
          ['26841', '0.55885204']
        ]
      };

      final orderBook = OrderBookModel.fromJson(json);

      expect(
          orderBook.asks,
          equals([
            ['26832', '0.03669155'],
            ['26833', '0.04994092'],
            ['26834', '0.78218976'],
            ['26835', '0.89282618'],
            ['26836', '0.00488942'],
            ['26839', '0.42259795'],
            ['26840', '0.37268655'],
            ['26841', '0.55885204']
          ]));
      expect(
          orderBook.bids,
          equals([
            ['26831', '0.07827894'],
            ['26830', '0.05000000'],
            ['26829', '0.73541184'],
            ['26828', '0.46264509'],
            ['26528', '0.46264519'],
            ['25928', '0.46264529'],
            ['26868', '0.46264549']
          ]));
    });
  });
}