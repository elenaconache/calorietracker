import 'dart:async';

import 'package:calorietracker/feature/auth/logic/auth_bloc.dart';
import 'package:calorietracker/feature/auth/logic/login_cubit.dart';
import 'package:calorietracker/shared/data/helper/async_state.dart';
import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/feature/home/ui/home_view.dart';
import 'package:calorietracker/feature/auth/ui/login_view.dart';
import 'package:calorietracker/shared/generated/l10n/l10n.dart';
import 'package:calorietracker/shared/data/service/data_sync_service.dart';
import 'package:calorietracker/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

const primaryColor = Colors.pink;

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  unawaited((getIt<DataSyncService>()).uploadLocalData());
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
    return BlocProvider(
      create: (context) => getIt<AuthBloc>()..add(AuthEvent.authSubscriptionRequested()),
      child: MaterialApp(
        navigatorKey: rootNavigatorKey,
        home: BlocBuilder<AuthBloc, AuthState>(
          buildWhen: (previous, current) =>
              previous.selectedUser.status is InitialStatus ||
              current.selectedUser.status is! LoadingStatus &&
                  previous.selectedUser != current.selectedUser &&
                  (previous.users.data?.isEmpty != current.users.data?.isEmpty),
          builder: (context, state) {
            return state.selectedUser.status.maybeMap(
              failure: (_) => BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: LoginView(),
              ),
              success: (_) {
                if (state.selectedUser.data == null) {
                  return BlocProvider(
                    create: (context) => getIt<LoginCubit>(),
                    child: LoginView(),
                  );
                } else {
                  return HomeView();
                }
              },
              orElse: () => Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          },
        ),
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
            backgroundColor: _defaultDarkColorScheme.surface,
            contentTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: _defaultDarkColorScheme.tertiary),
          ),
        ),
        themeMode: ThemeMode.dark,
      ),
    );
  }
}
