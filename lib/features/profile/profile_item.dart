import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  final VoidCallback onTap;
  final String title;

  const ProfileItem({super.key, required this.onTap, required this.title});

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
            const Icon(
              Icons.chevron_right_rounded,
              size: 32,
            ),
          ])),
    );
  }
}
