import 'package:calorietracker/feature/auth/logic/auth_bloc.dart';
import 'package:calorietracker/shared/data/helper/async_state.dart';
import 'package:calorietracker/feature/profile/ui/accounts/user_item.dart';
import 'package:calorietracker/shared/navigation/routes.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountsView extends StatelessWidget {
  const AccountsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.accountsTitle)),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BlocBuilder<AuthBloc, AuthState>(
              buildWhen: (previous, current) => previous.selectedUser != current.selectedUser,
              builder: (_, state) {
                final selectedUser = state.selectedUser.data;
                return selectedUser != null ? UserItem.large(user: selectedUser) : const SizedBox.shrink();
              },
            ),
            Expanded(
              child: BlocBuilder<AuthBloc, AuthState>(
                buildWhen: (previous, current) => previous.users != current.users,
                builder: (context, state) {
                  if (state.users.status is LoadingStatus) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final unselectedUsers = state.users.data?.where((element) => element.username != state.selectedUser.data?.username).toList() ?? [];
                  return ListView.builder(
                    itemBuilder: (context, index) => UserItem(user: unselectedUsers[index]),
                    itemCount: unselectedUsers.length,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12, left: 24, right: 24),
              child: FilledButton(
                onPressed: () => _navigateToLogin(context),
                child: Text(AppStrings.addAccountLabel),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToLogin(BuildContext context) => Navigator.of(context).pushNamed(Routes.login.path);
}
