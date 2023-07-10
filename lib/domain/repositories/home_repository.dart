import 'package:cryptop/domain/entities/order_book.dart';
import 'package:cryptop/domain/entities/ticker.dart';

abstract class HomeRepository {
  Future<OrderBook?> fetchOrderBook(String currencyPair);
  Future<Ticker?> fetchPairDetails(String currencyPair);
}
