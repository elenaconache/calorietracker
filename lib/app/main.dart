import 'dart:async';

import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/accounts/accounts_view.dart';
import 'package:calorietracker/features/add_food/add_food_arguments.dart';
import 'package:calorietracker/features/add_food/add_food_view.dart';
import 'package:calorietracker/features/create_food/create_food_view.dart';
import 'package:calorietracker/features/diary/diary_view.dart';
import 'package:calorietracker/features/login/login_view.dart';
import 'package:calorietracker/features/profile/profile_view.dart';
import 'package:calorietracker/features/search_food/search_food_view.dart';
import 'package:calorietracker/generated/l10n.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/navigation/routes.dart';
import 'package:calorietracker/services/data_sync_service.dart';
import 'package:calorietracker/services/user_service.dart';
import 'package:calorietracker/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

const primaryColor = Colors.pink;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await locator<UserService>().fetchLoggedInState();

  unawaited(locator<DataSyncService>().uploadLocalData());
  //TODO: periodic job for upload

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final _defaultLightColorScheme = ColorScheme.fromSeed(
    seedColor: primaryColor,
    brightness: Brightness.light,
  );

  static final _defaultDarkColorScheme = ColorScheme.fromSeed(
    seedColor: primaryColor,
    brightness: Brightness.dark,
    error: bittersweetRed,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calorie tracker',
      initialRoute: _initialRoutePath,
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
          snackBarTheme: SnackBarThemeData(
              backgroundColor: _defaultDarkColorScheme.background,
              contentTextStyle:
                  Theme.of(context).textTheme.bodyLarge?.copyWith(color: _defaultDarkColorScheme.tertiary))),
      themeMode: ThemeMode.dark,
    );
  }

  String get _initialRoutePath => locator<UserService>().isLoggedIn.value ? Routes.diary.path : Routes.login.path;

  Route? _onGenerateRoute(RouteSettings settings) {
    final matchingRoute =
        Routes.values.firstWhere((route) => route.path == settings.name, orElse: () => Routes.unknown);
    final args = settings.arguments;
    switch (matchingRoute) {
      case Routes.diary:
        return MaterialPageRoute(builder: (context) => const DiaryView());
      case Routes.foodSearch:
        return MaterialPageRoute(builder: (context) => SearchFoodView(meal: args as Meal));
      case Routes.addFood:
        return MaterialPageRoute(builder: (context) => AddFoodView(args: args as AddFoodArguments));
      case Routes.login:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case Routes.accounts:
        return MaterialPageRoute(builder: (context) => const AccountsView());
      case Routes.createFood:
        return MaterialPageRoute(builder: (context) => CreateFoodView(meal: args as Meal));
      case Routes.profile:
        return MaterialPageRoute(builder: (context) => const ProfileView());
      default:
        return null;
    }
  }
}
