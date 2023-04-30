part of 'user_bloc.dart';

class UserState extends Equatable {
  final UserEntity user;
  final RequestState userState;
  final String usergMessage;

  const UserState({
    this.user = const UserEntity(),
    this.userState = RequestState.loading,
    this.usergMessage = '',
  });

  UserState copyWith({
    UserEntity? user,
    RequestState? userState,
    String? usergMessage,
  }) {
    return UserState(
      user: user ?? this.user,
      userState: userState ?? this.userState,
      usergMessage: usergMessage ?? this.usergMessage,
    );
  }

  @override
  List<Object> get props => [
        user,
        userState,
        usergMessage,
      ];
}
