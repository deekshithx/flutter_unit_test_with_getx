import 'package:cryptop/domain/entities/order_book.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OrderBookWidget extends StatelessWidget {
  const OrderBookWidget({super.key, required this.orderBook});

  final OrderBook? orderBook;

  @override
  Widget build(BuildContext context) {
    int listLength = orderBook?.asks?.length ?? 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'ORDER BOOK',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    title('BID PRICE'),
                    title('QTY'),
                    title('QTY'),
                    title('ASK PRICE'),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.2.h),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: listLength > 5 ? 5 : listLength,
                    itemBuilder: (context, index) {
                      var bid = orderBook?.bids?[index];
                      var ask = orderBook?.asks?[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 0.8.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(bid?[0] ?? '-'),
                            Text(bid?[1] ?? '-'),
                            Text(ask?[1] ?? '-'),
                            Text(ask?[0] ?? '-')
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Text title(title) {
    return Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.w500),
    );
  }
}
