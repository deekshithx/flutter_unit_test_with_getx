import 'package:cryptop/data/models/order_book_model.dart';
import 'package:cryptop/data/models/ticker_model.dart';
import 'package:cryptop/data/remote_services/services.dart';
import 'package:cryptop/domain/repositories/home_repository.dart';

class HomeRepositoryImp extends HomeRepository {
  @override
  Future<TickerModel?> fetchPairDetails(String currencyPair) async {
    final response = await AppServices.fetchPairDetails(currencyPair);
    if (response is Map<String, dynamic>) {
      return TickerModel.fromJson(response);
    } else {
      return null;
    }
  }

  @override
  Future<OrderBookModel?> fetchOrderBook(String currencyPair) async {
    final response = await AppServices.fetchOrderBook(currencyPair);
    if (response is Map<String, dynamic>) {
      return OrderBookModel.fromJson(response);
    } else {
      return null;
    }
  }
}
