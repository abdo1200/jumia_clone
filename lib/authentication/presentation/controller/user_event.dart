part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class FacebookLoginEvent extends UserEvent {}

class CheckAuthEvent extends UserEvent {}

class SignUpEvent extends UserEvent {
  final SignUpParameters parameters;

  const SignUpEvent(this.parameters);

  @override
  List<Object> get props => [parameters];
}

class EmailLoginEvent extends UserEvent {
  final EmailLoginParameters parameters;

  const EmailLoginEvent(this.parameters);

  @override
  List<Object> get props => [parameters];
}
