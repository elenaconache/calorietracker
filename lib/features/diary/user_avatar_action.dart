import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/navigation/routes.dart';
import 'package:calorietracker/services/user_service.dart';
import 'package:calorietracker/ui/components/initials_avatar.dart';
import 'package:flutter/material.dart';

class UserAvatarAction extends StatelessWidget {
  const UserAvatarAction({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: locator<UserService>().selectedUser,
      builder: (_, selectedUser, __) => selectedUser == null
          ? const SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: IconButton(
                icon: InitialsAvatar(text: selectedUser.username),
                onPressed: () => _navigateToAccounts(context),
              ),
            ),
    );
  }

  void _navigateToAccounts(BuildContext context) => Navigator.of(context).pushNamed(Routes.accounts.path);
}
