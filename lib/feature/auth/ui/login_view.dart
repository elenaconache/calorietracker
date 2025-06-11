import 'package:calorietracker/feature/auth/logic/auth_bloc.dart';
import 'package:calorietracker/feature/auth/logic/login_cubit.dart';
import 'package:calorietracker/shared/data/helper/failure.dart';
import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/feature/auth/data/auth_error.dart';
import 'package:calorietracker/shared/navigation/routes.dart';
import 'package:calorietracker/shared/data/service/logging_service.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/text_field/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _usernameController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _usernameController.addListener(_onUsernameChanged);
  }

  @override
  void dispose() {
    _usernameController.removeListener(_onUsernameChanged);
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        final cubit = context.read<LoginCubit>();
        state.selectedUser.status.maybeWhen(
          success: () {
            if (context.mounted) {
              if ((state.users.data?.length ?? 0) > 1) {
                Navigator.of(context).pop();
              } else {
                Navigator.of(context).pushReplacementNamed(Routes.diary.path);
              }
            } else {
              getIt<LoggingService>().info('Could not navigate home. Context unmounted.');
            }
            cubit.onLoginResult();
          },
          failure: () {
            final failure = state.selectedUser.failure;
            if (context.mounted && failure is AuthFailure) {
              final String errorMessage;
              switch (failure.type) {
                case AuthError.notFound:
                  errorMessage = AppStrings.userNotFoundError;
                  break;
                case AuthError.connection:
                  errorMessage = AppStrings.connectionErrorMessage;
                  break;
                case AuthError.unknown:
                  errorMessage = AppStrings.generalErrorMessage;
                  break;
              }
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
            }
            cubit.onLoginResult();
          },
          loading: cubit.onLoginSubmit,
          orElse: () {},
        );
      },
      child: Scaffold(
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
                child: BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) => FilledButton(
                    onPressed: state.enabled && !state.loading ? () => _onLoginPressed(context) : null,
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      )),
                    ),
                    child: Text(AppStrings.continueLabel),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onUsernameChanged() {
    context.read<LoginCubit>().onUsernameChanged(username: _usernameController.text);
  }

  void _onLoginPressed(BuildContext context) {
    context.read<AuthBloc>().add(AuthEvent.logIn(username: _usernameController.text));
  }
}
