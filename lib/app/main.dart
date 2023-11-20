import 'dart:async';

import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/home/home_view.dart';
import 'package:calorietracker/features/login/login_view.dart';
import 'package:calorietracker/generated/l10n.dart';
import 'package:calorietracker/navigation/routes.dart';
import 'package:calorietracker/services/data_sync_service.dart';
import 'package:calorietracker/services/user_service.dart';
import 'package:calorietracker/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

const primaryColor = Colors.pink;

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

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
      navigatorKey: rootNavigatorKey,
      onGenerateRoute: _onGenerateRootRoute,
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
        scaffoldBackgroundColor: primaryColor.shade50,
        cardColor: primaryColor.shade100,
        appBarTheme: AppBarTheme(color: primaryColor.shade50),
      ),
      darkTheme: ThemeData(
        colorScheme: _defaultDarkColorScheme,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
        snackBarTheme: SnackBarThemeData(
          backgroundColor: _defaultDarkColorScheme.background,
          contentTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: _defaultDarkColorScheme.tertiary),
        ),
      ),
      themeMode: ThemeMode.dark,
    );
  }

  String get _initialRoutePath => locator<UserService>().isLoggedIn.value ? Routes.home.path : Routes.login.path;

  Route? _onGenerateRootRoute(RouteSettings settings) {
    final matchingRoute =
        Routes.values.firstWhere((route) => route.path == settings.name, orElse: () => Routes.unknown);
    switch (matchingRoute) {
      case Routes.login:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case Routes.home:
        return MaterialPageRoute(builder: (context) => const HomeView());
      default:
        return null;
    }
  }
}
