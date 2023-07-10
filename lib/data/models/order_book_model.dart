import 'package:cryptop/domain/entities/order_book.dart';

class OrderBookModel extends OrderBook {
  OrderBookModel({
    this.bids,
    this.asks,
  }) : super(
          bids: bids,
          asks: asks,
        );

  @override
  List<List<String>>? bids;
  @override
  List<List<String>>? asks;

  factory OrderBookModel.fromJson(Map<String, dynamic> json) {
    return OrderBookModel(
      bids: List<List<String>>.from(
          json['bids'].map((item) => List<String>.from(item))),
      asks: List<List<String>>.from(
          json['asks'].map((item) => List<String>.from(item))),
    );
  }
}

abstract class HasToJson {
  Map<String, dynamic> toJson();
}
