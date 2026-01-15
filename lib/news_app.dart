import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/config/theme.dart';
import 'package:news/core/routes_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/providers/config_provider.dart';
import 'package:provider/provider.dart';



class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: Size(393, 852),
      child: MaterialApp(
        localizationsDelegates:AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        initialRoute: RoutesManager.home,
        theme: ThemeManager.light,
        themeMode: Provider.of<ConfigProvider>(context).currentTheme,
        darkTheme: ThemeManager.dark,
        onGenerateRoute: RoutesManager.router,
        locale:  Locale(Provider.of<ConfigProvider>(context).currentLang),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
