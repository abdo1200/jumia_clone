import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumia_clone/authentication/domain/entities/user.dart';
import 'package:jumia_clone/authentication/domain/usecases/check_auth_usecase.dart';
import 'package:jumia_clone/authentication/domain/usecases/email_login_usecase.dart';
import 'package:jumia_clone/authentication/domain/usecases/facebook_login_usecase.dart';
import 'package:jumia_clone/authentication/domain/usecases/sign_up_usecase.dart';
import 'package:jumia_clone/core/enums.dart';
import 'package:jumia_clone/core/usecase/base_usecase.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final FacebookLoginUseCase facebookLoginUseCase;
  final SignUpUseCase signUpUseCase;
  final EmailLoginUseCase emailLoginUseCase;
  final CheckAuthUseCase checkAuthUseCase;
  UserBloc(this.facebookLoginUseCase, this.signUpUseCase,
      this.emailLoginUseCase, this.checkAuthUseCase)
      : super(const UserState()) {
    on<FacebookLoginEvent>(_facebookLogin);
    on<SignUpEvent>(_signUp);
    on<EmailLoginEvent>(_emailLogin);
    on<CheckAuthEvent>(_checkAuth);
  }
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  FutureOr<void> _facebookLogin(
      FacebookLoginEvent event, Emitter<UserState> emit) async {
    final result = await facebookLoginUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            userState: RequestState.error,
            usergMessage: l.message)), (r) async {
      emit(state.copyWith(userState: RequestState.loaded, user: r));
      final DocumentSnapshot userDoc = await _usersCollection.doc(r.id).get();
      print("Loged in successfully");
      if (!userDoc.exists) {
        // Save the user data to Firestore
        await addUserToFirestore(
            r.id, r.displayName, r.email, r.profilePic, r.phone);
      }
    });
  }

  Future<void> addUserToFirestore(String userId, String name, String email,
      String profilePic, String phone) async {
    try {
      await _usersCollection.doc(userId).set({
        'name': name,
        'email': email,
        'profile_pic': profilePic,
        'phone': phone,
      });
    } catch (error) {
      print('Error adding user to Firestore: $error');
    }
  }

  FutureOr<void> _signUp(SignUpEvent event, Emitter<UserState> emit) async {
    final result = await signUpUseCase(event.parameters);
    result.fold(
        (l) => emit(state.copyWith(
            userState: RequestState.error, usergMessage: l.message)),
        (r) => emit(state.copyWith(userState: RequestState.loaded, user: r)));
  }

  FutureOr<void> _emailLogin(
      EmailLoginEvent event, Emitter<UserState> emit) async {
    final result = await emailLoginUseCase(event.parameters);
    result.fold(
        (l) => emit(state.copyWith(
            userState: RequestState.error, usergMessage: l.message)),
        (r) => emit(state.copyWith(userState: RequestState.loaded, user: r)));
  }

  FutureOr<void> _checkAuth(
      CheckAuthEvent event, Emitter<UserState> emit) async {
    final result = await checkAuthUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            userState: RequestState.error, usergMessage: l.message)), (r) {
      emit(state.copyWith(userState: RequestState.loaded, user: r));
      print(r.displayName);
    });
  }
}
