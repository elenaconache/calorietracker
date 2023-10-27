import 'package:calorietracker/features/profile/profile_item.dart';
import 'package:calorietracker/navigation/routes.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.profileTitle)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ProfileItem(
            onTap: () => Navigator.pushNamed(context, Routes.accounts.path),
            title: AppStrings.switchAccountLabel,
          ),
          ProfileItem(
            onTap: () {
              //TODO: trigger a data sync and display a loading indicator to the right until complete
            },
            title: AppStrings.syncDataLabel,
          ),
        ],
      ),
    );
  }
}
