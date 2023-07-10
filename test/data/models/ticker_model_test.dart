import 'package:cryptop/data/models/ticker_model.dart';
import 'package:test/test.dart';

void main() {
  group('TickerModel', () {
    test('fromJson() should return a correct objects', () {
      final json = {
        "timestamp": "1684088399",
        "open": "26805",
        "high": "27202",
        "low": "26598",
        "last": "26931",
        "volume": "1679.86203164",
        "vwap": "26926",
        "bid": "26925",
        "ask": "26928",
        "open_24": "26827",
        "percent_change_24": "0.39"
      };
      final tickerModel = TickerModel.fromJson(json);
      expect(tickerModel.timeStamp, equals('1684088399'));
      expect(tickerModel.open, equals('26805'));
      expect(tickerModel.high, equals('27202'));
      expect(tickerModel.low, equals('26598'));
      expect(tickerModel.last, equals('26931'));
      expect(tickerModel.volume, equals('1679.86203164'));
    });

    test('fromJson() should return a Ticker object', () {
      final json = {
        "timestamp": "1684088399",
        "open": "26805",
        "high": "27202",
        "low": "26598",
        "last": "26931",
        "volume": "1679.86203164",
        "vwap": "26926",
        "bid": "26925",
        "ask": "26928",
        "open_24": "26827",
        "percent_change_24": "0.39"
      };
      final tickerModel = TickerModel.fromJson(json);
      expect(tickerModel, isA<TickerModel>());
    });

    test('fromJson throws an exception if open is null', () {
      final json = {
        "timestamp": "1684088399",
        "high": "27202",
        "low": "26598",
        "last": "26931",
        "volume": "1679.86203164",
      };

      expect(() => TickerModel.fromJson(json), throwsA(isA<TypeError>()));
    });

    test('fromJson throws an exception if high is null', () {
      final json = {
        "timestamp": "1684088399",
        "open": "26805",
        "low": "26598",
        "last": "26931",
        "volume": "1679.86203164",
      };

      expect(() => TickerModel.fromJson(json), throwsA(isA<TypeError>()));
    });

    test('fromJson throws an exception if low is null', () {
      final json = {
        "timestamp": "1684088399",
        "open": "26805",
        "high": "27202",
        "last": "26931",
        "volume": "1679.86203164",
      };

      expect(() => TickerModel.fromJson(json), throwsA(isA<TypeError>()));
    });

    test('fromJson throws an exception if last is null', () {
      final json = {
        "timestamp": "1684088399",
        "open": "26805",
        "high": "27202",
        "low": "26598",
        "volume": "1679.86203164",
      };

      expect(() => TickerModel.fromJson(json), throwsA(isA<TypeError>()));
    });

    test('fromJson throws an exception if volume is null', () {
      final json = {
        "timestamp": "1684088399",
        "open": "26805",
        "high": "27202",
        "low": "26598",
        "last": "26931",
      };

      expect(() => TickerModel.fromJson(json), throwsA(isA<TypeError>()));
    });
  });
}
