import 'package:cryptop/infrastructure/navigation.dart';
import 'package:cryptop/infrastructure/routes.dart';
import 'package:cryptop/infrastructure/theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'generated/locales.g.dart';

void main() async {
  var initialRoute = await Routes.initialRoute;
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  const Main(this.initialRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        theme: AppThemes.appTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: initialRoute,
        getPages: Nav.routes,
        themeMode: ThemeMode.system,
        translationsKeys: AppTranslation.translations,
        locale: const Locale('en', 'IN'),
      );
    });
  }
}
