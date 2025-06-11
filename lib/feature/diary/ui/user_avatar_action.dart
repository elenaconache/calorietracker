import 'package:calorietracker/feature/auth/logic/auth_bloc.dart';
import 'package:calorietracker/shared/navigation/routes.dart';
import 'package:calorietracker/ui/components/initials_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserAvatarAction extends StatelessWidget {
  const UserAvatarAction({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state.selectedUser.data == null) {
          return const SizedBox.shrink();
        }
        final selectedUser = state.selectedUser.data!;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: IconButton(
            icon: InitialsAvatar(text: selectedUser.username),
            onPressed: () => _navigateToAccounts(context),
          ),
        );
      },
    );
  }

  void _navigateToAccounts(BuildContext context) => Navigator.of(context).pushNamed(Routes.profile.path);
}
