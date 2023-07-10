import 'package:cryptop/generated/locales.g.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LocaleKeys', () {
    test('should return a non-null value for all keys', () {
      expect(LocaleKeys.home_enter_currency, isNotNull);
      expect(LocaleKeys.home_enter_currency_to_load, isNotNull);
      expect(LocaleKeys.result_open, isNotNull);
      expect(LocaleKeys.result_high, isNotNull);
      expect(LocaleKeys.result_low, isNotNull);
      expect(LocaleKeys.result_volume, isNotNull);
      expect(LocaleKeys.result_last, isNotNull);
      expect(LocaleKeys.result_view_order_book, isNotNull);
      expect(LocaleKeys.result_hide_order_book, isNotNull);
      expect(LocaleKeys.result_refresh, isNotNull);
    });
  });

  group('AppTranslation', () {
    test('should return a non-null value for translations', () {
      expect(AppTranslation.translations, isNotNull);
    });

    test('should contain valid translations for all supported languages', () {
      AppTranslation.translations.forEach((languageCode, translations) {
        expect(translations, isNotNull);
        expect(translations.isNotEmpty, isTrue);
        expect(
            translations.containsKey(LocaleKeys.home_enter_currency), isTrue);
        expect(translations.containsKey(LocaleKeys.home_enter_currency_to_load),
            isTrue);
        expect(translations.containsKey(LocaleKeys.result_open), isTrue);
        expect(translations.containsKey(LocaleKeys.result_high), isTrue);
        expect(translations.containsKey(LocaleKeys.result_low), isTrue);
        expect(translations.containsKey(LocaleKeys.result_volume), isTrue);
        expect(translations.containsKey(LocaleKeys.result_last), isTrue);
        expect(translations.containsKey(LocaleKeys.result_view_order_book),
            isTrue);
        expect(translations.containsKey(LocaleKeys.result_hide_order_book),
            isTrue);
        expect(translations.containsKey(LocaleKeys.result_refresh), isTrue);
      });
    });
  });
}
