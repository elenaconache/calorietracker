import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/diary/diary_view.dart';
import 'package:calorietracker/features/food_search/food_search_view.dart';
import 'package:calorietracker/generated/l10n.dart';
import 'package:calorietracker/navigation/routes.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final _defaultLightColorScheme = ColorScheme.fromSeed(seedColor: Colors.pink, brightness: Brightness.light);

  static final _defaultDarkColorScheme = ColorScheme.fromSeed(seedColor: Colors.pink, brightness: Brightness.dark);

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
      return MaterialApp(
        title: 'Calorie tracker',
        initialRoute: Routes.diary.path,
        routes: {Routes.diary.path: (context) => const DiaryView(), Routes.foodSearch.path: (context) => const FoodSearchView()},
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: ThemeData(
          colorScheme: lightColorScheme ?? _defaultLightColorScheme,
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: darkColorScheme ?? _defaultDarkColorScheme,
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.black,
        ),
        themeMode: ThemeMode.dark,
      );
    });
  }
}
