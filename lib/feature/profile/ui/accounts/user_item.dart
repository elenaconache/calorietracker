import 'package:calorietracker/feature/auth/logic/auth_bloc.dart';
import 'package:calorietracker/shared/data/model/user.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/initials_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final authBloc = context.read<AuthBloc>();
    return InkWell(
      key: UniqueKey(),
      onTap: isLarge ? null : () => authBloc.add(AuthEvent.userSelected(username: user.username)),
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
    final authBloc = context.read<AuthBloc>();
    authBloc.add(AuthEvent.logout(username: user.username));
  }
}
