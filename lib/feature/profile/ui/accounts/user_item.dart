import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/main.dart';
import 'package:calorietracker/shared/model/user.dart';
import 'package:calorietracker/shared/navigation/routes.dart';
import 'package:calorietracker/shared/service/user_service.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/initials_avatar.dart';
import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  final User user;
  final bool isLarge;

  const UserItem({
    super.key,
    required this.user,
  }) : isLarge = false;

  const UserItem.large({
    super.key,
    required this.user,
  }) : isLarge = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => locator<UserService>().selectUser(user.username),
      child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.5, color: Theme.of(context).dividerColor)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: isLarge ? 12 : 8, horizontal: 24),
            child: Row(
              children: [
                InitialsAvatar(
                  text: user.username,
                  size: isLarge ? 48 : defaultAvatarSize,
                ),
                const SizedBox(width: 12),
                Expanded(
                    child: Text(
                  user.username,
                  style: isLarge ? Theme.of(context).textTheme.titleLarge : Theme.of(context).textTheme.titleSmall,
                )),
                const SizedBox(width: 12),
                TextButton(onPressed: () => _onLogoutPressed(context), child: Text(AppStrings.logoutLabel))
              ],
            ),
          )),
    );
  }

  void _onLogoutPressed(BuildContext context) {
    final userService = locator<UserService>();
    userService.logout(username: user.username);
    if (userService.selectedUser.value == null) {
      Navigator.of(rootNavigatorKey.currentContext!).pushNamedAndRemoveUntil(Routes.login.path, (route) => false);
    }
  }
}
