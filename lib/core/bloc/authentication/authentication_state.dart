import 'package:flutter/foundation.dart';

import '../../../model/user.dart';
import '../base/bloc_state_base.dart';
import '../utils/enums.dart';


abstract class AuthenticationState {
  final String token;
  final User user;
  AuthenticationState({this.token, this.user});
}

/// UnInitialized
class UnAuthentication extends AuthenticationState {
  UnAuthentication({String token, User user})
      : super(token: token, user: user);
  UnAuthentication.fromOldState(AuthenticationState state,
      {String token, User user})
      : super(token: token ?? state.token, user: user ?? state.user);
}

class AuthenticationStateOnMessage extends AuthenticationState
    with BlocOnMessageStateBase {
  AuthenticationStateOnMessage({String token, User user})
      : super(token: token, user: user);
  AuthenticationStateOnMessage.fromOldState(AuthenticationState state,
      {String token,
      User user,
      @required String message,
      type = MessageType.INFO})
      : super(token: token ?? state.token, user: user ?? state.user) {
    this.message = message;
    this.type = type;
  }
}

/// Initialized
class InAuthentication extends AuthenticationState {
  InAuthentication({String token, User user})
      : super(token: token, user: user);
  InAuthentication.fromOldState(AuthenticationState state,
      {String token, User user})
      : super(token: token ?? state.token, user: user ?? state.user);
}