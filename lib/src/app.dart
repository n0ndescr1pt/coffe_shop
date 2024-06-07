import 'package:coffe_shop/src/features/menu/view/menu_screen.dart';
import 'package:coffe_shop/src/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CoffeeShopApp extends StatefulWidget {
  const CoffeeShopApp({super.key});

  @override
  State<CoffeeShopApp> createState() => _CoffeeShopAppState();
}

class _CoffeeShopAppState extends State<CoffeeShopApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: lightTheme,
      home: const MenuScreen(),
    );
  }
}
