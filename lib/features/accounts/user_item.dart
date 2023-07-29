import 'package:calorietracker/models/user.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/initials_avatar.dart';
import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  final User user;

  const UserItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Ink(
          decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Theme.of(context).dividerColor))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
            child: Row(
              children: [
                InitialsAvatar(text: user.username),
                const SizedBox(width: 12),
                Expanded(
                    child: Text(
                  user.username,
                  style: Theme.of(context).textTheme.titleSmall,
                )),
                const SizedBox(width: 12),
                TextButton(onPressed: () {}, child: Text(AppStrings.logoutLabel))
              ],
            ),
          )),
    );
  }
}
