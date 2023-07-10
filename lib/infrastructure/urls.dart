class ApiUrls {
  static const String baseUrl = 'https://www.bitstamp.net/api/v2';
  static const String loadPairData = "/ticker/";
  static const String orderBook = "/order_book/";
  static const Duration timeout = Duration(seconds: 30);
}
