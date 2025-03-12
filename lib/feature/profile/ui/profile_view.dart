import 'dart:math';

import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/feature/profile/ui/profile_item.dart';
import 'package:calorietracker/shared/navigation/routes.dart';
import 'package:calorietracker/shared/service/data_sync_service.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> with SingleTickerProviderStateMixin {
  late final AnimationController _rotationController;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    Tween<double>(begin: 0, end: 2 * pi).animate(_rotationController);
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

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
            icon: const Icon(
              Icons.chevron_right_rounded,
              size: 32,
            ),
          ),
          ProfileItem(
            onTap: () {
              final dataSyncService = locator<DataSyncService>();
              if (!dataSyncService.isUploadInProgress) {
                _rotationController.repeat();
                dataSyncService.uploadLocalData().then((_) => _rotationController.stop());
              }
            },
            title: AppStrings.syncDataLabel,
            icon: RotationTransition(
              turns: _rotationController,
              child: const Icon(
                Icons.sync,
                size: 32,
              ),
            ),
          ),
          ProfileItem(
            onTap: () => Navigator.pushNamed(context, Routes.userGoals.path),
            title: AppStrings.myGoalsLabel,
            icon: const Icon(
              Icons.chevron_right_rounded,
              size: 32,
            ),
          )
        ],
      ),
    );
  }
}
