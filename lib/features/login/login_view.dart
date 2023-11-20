import 'dart:async';

import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/login/login_controller.dart';
import 'package:calorietracker/features/login/login_error.dart';
import 'package:calorietracker/navigation/routes.dart';
import 'package:calorietracker/services/logging_service.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/app_text_field.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _usernameController;
  late final LoginController _loginController;

  @override
  void initState() {
    _usernameController = TextEditingController();
    _loginController = locator<LoginController>();
    _usernameController.addListener(_onUsernameChanged);
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.removeListener(_onUsernameChanged);
    _usernameController.dispose();
    _loginController.loginState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.loginTitle)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 120),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: AppTextField(
                  action: TextInputAction.done,
                  labelText: AppStrings.usernameLabel,
                  controller: _usernameController,
                )),
            const SizedBox(height: 40),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: ValueListenableBuilder(
                    valueListenable: _loginController.loginState,
                    builder: (context, loginState, _) => loginState.isLoading
                        ? const Center(child: SizedBox(height: 24, width: 24, child: CircularProgressIndicator()))
                        : FilledButton(
                            onPressed: loginState.isDisabled
                                ? null
                                : () {
                                    _onLoginPressed(context);
                                  },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              )),
                            ),
                            child: Text(AppStrings.continueLabel))))
          ],
        ),
      ),
    );
  }

  void _onUsernameChanged() {
    _loginController.onUsernameChanged(username: _usernameController.text);
  }

  void _onLoginPressed(BuildContext context) {
    unawaited(_loginController.login(
        username: _usernameController.text,
        onError: (loginError) {
          if (context.mounted) {
            final String errorMessage;
            switch (loginError) {
              case LoginError.alreadyLoggedIn:
                errorMessage = AppStrings.alreadyLoggedInMessage;
                break;
              case LoginError.notFound:
                errorMessage = AppStrings.userNotFoundError;
                break;
              case LoginError.connection:
                errorMessage = AppStrings.connectionErrorMessage;
                break;
              case LoginError.unknown:
                errorMessage = AppStrings.generalErrorMessage;
                break;
            }
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
          }
        },
        onSuccess: () {
          if (context.mounted) {
            Navigator.of(context).pushReplacementNamed(Routes.home.path);
          } else {
            locator<LoggingService>().info('Could not navigate home. Context unmounted.');
          }
        }));
  }
}
