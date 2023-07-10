import 'package:cryptop/domain/entities/order_book.dart';
import 'package:cryptop/domain/entities/ticker.dart';
import 'package:cryptop/domain/repositories/home_repository.dart';

class FetchHomeUseCase {
  final HomeRepository _homeRepository;
  FetchHomeUseCase(this._homeRepository);

  Future<Ticker?> fetchPairDetails(String currencyPair) async {
    final results = await _homeRepository.fetchPairDetails(currencyPair);
    return results;
  }

  Future<OrderBook?> fetchOrderBook(String currencyPair) async {
    final results = await _homeRepository.fetchOrderBook(currencyPair);
    return results;
  }
}
