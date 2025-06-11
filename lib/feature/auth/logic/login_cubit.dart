import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  void onUsernameChanged({required String username}) => emit(state.copyWith(enabled: username.isNotEmpty));

  void onLoginSubmit() => emit(state.copyWith(loading: true));

  void onLoginResult() => emit(state.copyWith(loading: false));
}
