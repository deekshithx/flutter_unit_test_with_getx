import 'package:cryptop/infrastructure/theme/app_colors.dart';
import 'package:cryptop/infrastructure/utils/utils.dart';
import 'package:cryptop/presentation/home/controllers/home_controller.dart';
import 'package:cryptop/presentation/home/widgets/home_widgets.dart';
import 'package:cryptop/presentation/home/widgets/order_book_widget.dart';
import 'package:cryptop/presentation/home/widgets/typeahead_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Obx(() => controller.dataPairAvailable.value
          ? FloatingActionButton(
              tooltip: 'result_refresh'.tr,
              backgroundColor: AppColors.primaryBlue,
              onPressed: controller.refreshData,
              child: const Icon(Icons.cached))
          : const SizedBox.shrink()),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                textField(),
                Obx(() {
                  return Column(
                      children: controller.load.value
                          ? HomeWidget.shimmerWidget()
                          : controller.dataPairAvailable.isFalse
                              ? HomeWidget.noData(controller)
                              : tickerWidget());
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textField() => TypeAheadWidget(
        textController: controller.textController,
        key: const ValueKey('textfield_widget'),
        onSearchClick: controller.onSearchClick,
        suggestionsCallback: (pattern) => controller.updateSuggestions(pattern),
        onSuggestionSelected: controller.onSuggestionSelect,
      );

  List<Widget> tickerWidget() => [
        Padding(
          key: const ValueKey('ticker_widget'),
          padding: EdgeInsets.only(top: 3.5.h, bottom: 3.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => Text(
                  controller.selectedCurrencyPair.value.toUpperCase(),
                  style: const TextStyle(
                      fontSize: 32, fontWeight: FontWeight.w400),
                ),
              ),
              Text(
                AppUtils.formatEpoch(epoch: controller.ticker?.tickerTimeStamp),
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        GridView.count(
          childAspectRatio: 7 / 3,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          crossAxisCount: 2,
          children: [
            HomeWidget.itemWidget(
                title: 'result_open'.tr,
                body: AppUtils.formatCurrency(
                    controller.ticker?.tickerOpen ?? '-')),
            HomeWidget.itemWidget(
                title: 'result_high'.tr,
                body: AppUtils.formatCurrency(
                    controller.ticker?.tickerHigh ?? '-')),
            HomeWidget.itemWidget(
                title: 'result_low'.tr,
                body: AppUtils.formatCurrency(
                    controller.ticker?.tickerLow ?? '-')),
            HomeWidget.itemWidget(
                title: 'result_last'.tr,
                body: AppUtils.formatCurrency(
                    controller.ticker?.tickerLast ?? '-')),
            HomeWidget.itemWidget(
                title: 'result_volume'.tr,
                body: controller.ticker?.tickerVolume ?? '-',
                showDollar: false)
          ],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
              onPressed: controller.showOrderBook.value
                  ? controller.hideOrderBook
                  : controller.getOrderBook,
              child: Obx(
                () => Text(
                  controller.showOrderBook.value
                      ? 'result_hide_order_book'.tr.toUpperCase()
                      : 'result_view_order_book'.tr.toUpperCase(),
                  style: const TextStyle(
                      color: AppColors.primaryBlue, fontSize: 15),
                ),
              )),
        ),
        Obx(() => controller.showOrderBook.value
            ? controller.loadingOrderBook.isFalse &&
                    controller.orderBook != null
                ? OrderBookWidget(orderBook: controller.orderBook)
                : HomeWidget.orderBookShimmer()
            : const SizedBox.shrink()),
      ];
}
