import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/accounts/user_item.dart';
import 'package:calorietracker/navigation/routes.dart';
import 'package:calorietracker/services/user_service.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:flutter/material.dart';

class AccountsView extends StatelessWidget {
  const AccountsView({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = locator<UserService>();
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.accountsTitle)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ValueListenableBuilder(
            valueListenable: userService.selectedUser,
            builder: (_, user, __) => user == null ? const SizedBox.shrink() : UserItem.large(user: user),
          ),
          Expanded(
              child: ValueListenableBuilder(
                  valueListenable: userService.users,
                  builder: (_, users, ___) => ValueListenableBuilder(
                        valueListenable: userService.selectedUser,
                        builder: (_, selectedUser, ___) {
                          final unselectedUsers = users.where((user) => selectedUser?.id != user.id).toList();
                          return ListView.builder(
                            itemBuilder: (context, index) => UserItem(user: unselectedUsers[index]),
                            itemCount: unselectedUsers.length,
                          );
                        },
                      ))),
          ColoredBox(
            color: Theme.of(context).canvasColor,
            child: Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 40, left: 24, right: 24),
              child: FilledButton(onPressed: () => _navigateToLogin(context), child: Text(AppStrings.addAccountLabel)),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToLogin(BuildContext context) => Navigator.of(context).pushNamed(Routes.login.path);
}
