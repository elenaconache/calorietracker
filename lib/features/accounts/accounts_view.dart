import 'package:calorietracker/ui/app_strings.dart';
import 'package:flutter/material.dart';

class AccountsView extends StatelessWidget {
  const AccountsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.accountsTitle),
      ),
    );
  }
}
