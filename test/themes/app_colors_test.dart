import 'package:cryptop/infrastructure/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppColors', () {
    test('black should have correct value', () {
      expect(AppColors.black, Colors.black);
    });

    test('bgGrey should have correct value', () {
      expect(AppColors.bgGrey, const Color(0xfff4f4f4));
    });

    test('primaryBlue should have correct value', () {
      expect(AppColors.primaryBlue, const Color(0xff6f00f8));
    });

    test('iconGrey should have correct value', () {
      expect(AppColors.iconGrey, const Color(0xffaba7a7));
    });

    test('textGrey should have correct value', () {
      expect(AppColors.textGrey, const Color(0xff626262));
    });
  });
}
