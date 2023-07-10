import 'package:cryptop/data/respositories/home_repository.dart';
import 'package:cryptop/domain/usecases/home_use_case.dart';
import 'package:cryptop/presentation/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('Textfield should render correctly', (WidgetTester tester) async {
    Get.lazyPut(() => HomeRepositoryImp());
    Get.lazyPut(() => FetchHomeUseCase(Get.find<HomeRepositoryImp>()));
    var controller = Get.put(HomeController(Get.find<FetchHomeUseCase>()));
    final textField = TypeAheadField(
      textFieldConfiguration: TextFieldConfiguration(
        controller: controller.textController,
      ),
      suggestionsCallback: (pattern) => controller.updateSuggestions(pattern),
      itemBuilder: (context, suggestion) => const SizedBox(),
      onSuggestionSelected: controller.onSuggestionSelect,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: textField,
        ),
      ),
    );

    final typeAheadFieldFinder = find.byWidgetPredicate(
      (widget) => widget is TypeAheadField,
    );
    await tester.enterText(typeAheadFieldFinder, 'Test');
    expect(textField.textFieldConfiguration.controller!.text, equals('Test'));
    expect(
        textField.onSuggestionSelected, equals(controller.onSuggestionSelect));
  });
}
