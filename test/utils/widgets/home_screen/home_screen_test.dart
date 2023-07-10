import 'dart:io';

import 'package:cryptop/data/respositories/home_repository.dart';
import 'package:cryptop/domain/usecases/home_use_case.dart';
import 'package:cryptop/generated/locales.g.dart';
import 'package:cryptop/infrastructure/navigation.dart';
import 'package:cryptop/infrastructure/routes.dart';
import 'package:cryptop/presentation/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  group('App Widget Test', () {
    late Widget testWidget;

    setUp(() {
      testWidget = Sizer(builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.initialRoute,
          getPages: Nav.routes,
          themeMode: ThemeMode.system,
          translationsKeys: AppTranslation.translations,
          locale: const Locale('en', 'IN'),
        );
      });
      HttpOverrides.global = null;
    });

    testWidgets('should display the textfield with hint text',
        (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      expect(find.text('Enter currency pair'), findsOneWidget);
    });

    testWidgets('should display the hint text', (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      expect(find.text('Enter a currency pair to load data'), findsOneWidget);
    });
    testWidgets('should display the search icon', (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      expect(
          find.byKey(
            const ValueKey('textfield_widget'),
          ),
          findsOneWidget);
    });
    testWidgets('should display the no data widget',
        (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);
      expect(
          find.byKey(
            const ValueKey('no_data_widget'),
          ),
          findsOneWidget);
    });

    testWidgets(' should display the ticker widget',
        (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);

      final typeAheadFieldFinder = find.byWidgetPredicate(
        (widget) => widget is TypeAheadField,
      );
      await tester.enterText(typeAheadFieldFinder, 'btcusd');
      Get.lazyPut(() => HomeRepositoryImp());
      Get.lazyPut(() => FetchHomeUseCase(Get.find<HomeRepositoryImp>()));
      var controller = Get.put(HomeController(Get.find<FetchHomeUseCase>()));
      await controller.searchPair(controller.textController.text);
      expect(
          find.byKey(
            const ValueKey('ticker_widget'),
          ),
          findsOneWidget);
    });
  });
}
