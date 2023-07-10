import 'package:cryptop/domain/entities/ticker.dart';

class TickerModel extends Ticker {
  TickerModel({
    this.timeStamp,
    this.open,
    this.high,
    this.low,
    this.last,
    this.volume,
  }) : super(
            tickerTimeStamp: timeStamp,
            tickerOpen: open,
            tickerHigh: high,
            tickerLow: low,
            tickerLast: last,
            tickerVolume: volume);

  String? timeStamp;
  String? open;
  String? high;
  String? low;
  String? last;
  String? volume;

  factory TickerModel.fromJson(Map<String, dynamic> json) => TickerModel(
        timeStamp: json["timestamp"] as String,
        open: json["open"] as String,
        high: json["high"] as String,
        low: json["low"] as String,
        last: json["last"] as String,
        volume: json["volume"] as String,
      );
}
