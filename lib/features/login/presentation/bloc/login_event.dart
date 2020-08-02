import 'dart:async';
import 'package:covid19_app/features/login/presentation/bloc/index.dart';
import 'package:covid19_app/network/dto/user.dart';
import 'package:covid19_app/network/providers/user_provider.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginEvent {
  Stream<LoginState> applyAsync({LoginState currentState, LoginBloc bloc});
  final UserProvider _userProvider = UserProvider();
}

class LoadLoginEvent extends LoginEvent {
  final String username;
  final String password;

  LoadLoginEvent(this.username, this.password);

  @override
  Stream<LoginState> applyAsync(
      {LoginState currentState, LoginBloc bloc}) async* {
    yield LoginOnProgress.fromOldState(currentState);
    String token = await this._userProvider.login(LoginDTO(username, password));
    yield InLoginState.fromOldState(currentState, token: token);
  }
}