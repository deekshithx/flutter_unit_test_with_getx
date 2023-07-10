import 'package:cryptop/domain/entities/order_book.dart';
import 'package:cryptop/domain/entities/ticker.dart';
import 'package:cryptop/domain/usecases/home_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController(this._fetchHomeUseCase);
  final FetchHomeUseCase _fetchHomeUseCase;
  int localeIndex = 0;
  Ticker? ticker;
  OrderBook? orderBook;
  RxString selectedCurrencyPair = 'mkmqw_'.obs;

  RxBool load = false.obs,
      dataPairAvailable = false.obs,
      loadingOrderBook = false.obs,
      showOrderBook = false.obs;
  List<String> currencyPairs = [
    'btcusd',
    'btceur',
    'btcgbp',
    'btcpax',
    'btcusdc',
    'gbpusd',
    'gbpeur',
    'eurusd',
    'xrpusd',
    'xrpeur',
    'xrpbtc',
    'xrpgbp',
    'xrppax',
    'ltcusd',
    'ltceur',
    'ltcbtc',
    'ltcgbp',
    'ethusd',
    'etheur',
    'ethbtc',
    'ethgbp',
    'ethpax',
    'ethusdc',
    'bchusd',
    'bcheur',
    'bchbtc',
    'bchgbp',
    'paxusd',
    'paxeur',
    'paxgbp',
    'xlmbtc',
    'xlmusd',
    'xlmeur',
    'xlmgbp',
    'linkusd',
    'linkeur',
    'linkgbp',
    'linkbtc',
    'linketh',
    'omgusd',
    'omgeur',
    'omggbp',
    'omgbtc',
    'usdcusd',
    'usdceur'
  ];
  TextEditingController textController = TextEditingController();
  final List<Locale> locale = [
    const Locale('en', 'EN'),
    const Locale('kn', 'IN'),
    const Locale('hi', 'IN'),
    const Locale('te', 'IN'),
    const Locale('ta', 'IN'),
  ];
  var suggestions = <String>[].obs;

  Iterable<String> updateSuggestions(String query) {
    if (query.isEmpty) {
      return [];
    } else {
      return currencyPairs.where((pair) => pair.contains(query.toLowerCase()));
    }
  }

  onSearchClick() {
    selectedCurrencyPair.value = textController.text;
    searchPair(textController.text);
  }

  onSuggestionSelect(String currencyPair) async {
    textController.text = currencyPair;
    selectedCurrencyPair.value = currencyPair;
    searchPair(currencyPair);
  }

  refreshData() async {
    if (showOrderBook.value) {
      getOrderBook();
    }
    await searchPair(selectedCurrencyPair.value);
  }

  searchPair(String currencyPair) async {
    clearTickerVal();
    hideOrderBook();
    load(true);
    ticker = await _fetchHomeUseCase.fetchPairDetails(currencyPair);
    if (ticker == null) {
      Get.snackbar('Not found', currencyPair,
          snackPosition: SnackPosition.BOTTOM);
    } else {
      textController.clear();
    }
    dataPairAvailable(ticker != null);
    load(false);
  }

  getOrderBook() async {
    clearOrderBookVal();
    loadingOrderBook(true);
    showOrderBook(true);
    orderBook =
        await _fetchHomeUseCase.fetchOrderBook(selectedCurrencyPair.value);
    if (orderBook == null) {
      Get.snackbar('Order book not found', selectedCurrencyPair.value,
          snackPosition: SnackPosition.BOTTOM);
    }
    showOrderBook(true);
    loadingOrderBook(false);
  }

  hideOrderBook() async {
    clearOrderBookVal();
    loadingOrderBook(false);
    showOrderBook(false);
  }

  changeLocale() {
    localeIndex >= 4 ? localeIndex = 0 : localeIndex++;
    Get.updateLocale(locale[localeIndex]);
  }

  @override
  void onClose() {
    textController.dispose();
  }

  clearOrderBookVal() {
    orderBook = null;
  }

  clearTickerVal() {
    dataPairAvailable(false);
    ticker = null;
  }
}
