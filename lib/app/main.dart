import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/add_food/add_food_view.dart';
import 'package:calorietracker/features/diary/diary_view.dart';
import 'package:calorietracker/features/food_search/food_search_view.dart';
import 'package:calorietracker/generated/l10n.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

const primaryColor = Colors.pink;

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final _defaultLightColorScheme = ColorScheme.fromSeed(seedColor: primaryColor, brightness: Brightness.light);

  static final _defaultDarkColorScheme = ColorScheme.fromSeed(seedColor: primaryColor, brightness: Brightness.dark);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calorie tracker',
      initialRoute: Routes.diary.path,
      onGenerateRoute: _onGenerateRoute,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
        colorScheme: _defaultLightColorScheme,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: _defaultDarkColorScheme,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
      ),
      themeMode: ThemeMode.dark,
    );
  }

  Route? _onGenerateRoute(RouteSettings settings) {
    final matchingRoute = Routes.values.firstWhere((route) => route.path == settings.name, orElse: () => Routes.unknown);
    final args = settings.arguments;
    switch (matchingRoute) {
      case Routes.diary:
        return MaterialPageRoute(builder: (context) => const DiaryView());
      case Routes.foodSearch:
        return MaterialPageRoute(builder: (context) => FoodSearchView(meal: args as Meal));
      case Routes.addFood:
        return MaterialPageRoute(builder: (context) => AddFoodView(meal: args as Meal));
      default:
        return null;
    }
  }
}
