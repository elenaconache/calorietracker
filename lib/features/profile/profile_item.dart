import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Widget icon;

  const ProfileItem({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Spacer(),
            icon,
          ])),
    );
  }
}
