import 'package:cryptop/infrastructure/urls.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EndPoints', () {
    test('baseUrl should be a string', () {
      expect(ApiUrls.baseUrl, isA<String>());
    });

    test('loadPairData should be a string', () {
      expect(ApiUrls.loadPairData, isA<String>());
    });

    test('orderBook should be a string', () {
      expect(ApiUrls.orderBook, isA<String>());
    });

    test('timeout should be a Duration', () {
      expect(ApiUrls.timeout, isA<Duration>());
    });
  });
}
