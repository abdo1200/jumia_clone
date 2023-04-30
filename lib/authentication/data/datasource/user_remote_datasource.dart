import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:jumia_clone/authentication/data/model/user_model.dart';
import 'package:jumia_clone/authentication/domain/entities/user.dart';
import 'package:jumia_clone/authentication/domain/usecases/email_login_usecase.dart';
import 'package:jumia_clone/authentication/domain/usecases/sign_up_usecase.dart';

abstract class BaseUserRemoteDataSource {
  Future<UserEntity> facebookLogin();
  Future<UserEntity> emailLogin(EmailLoginParameters parameters);
  Future<UserEntity> signUp(SignUpParameters parameters);
  Future<UserEntity> checkAuth();
}

class UserRemoteDataSource extends BaseUserRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<UserEntity> facebookLogin() async {
    final result = await FacebookAuth.instance.login(
      permissions: ['email', 'public_profile'],
    );

    final AccessToken accessToken = result.accessToken!;
    final userData = await FacebookAuth.instance.getUserData(
      fields: "name,email,picture.width(200),birthday,friends,gender,link",
    );

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(accessToken.token);
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);

    UserEntity user = UserEntity(
      displayName: userData['name'] ?? '',
      id: userCredential.user!.uid,
      phone: userData['phone'] ?? '',
      profilePic: userData['picture']['data']['url'] ?? '',
    );

    return user;
  }

  @override
  Future<UserEntity> emailLogin(EmailLoginParameters parameters) async {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: parameters.email,
      password: parameters.password,
    );
    User? user = userCredential.user;
    print('User signed up: ${user!.uid}');
    return UserEntity(email: parameters.email);
  }

  @override
  Future<UserEntity> signUp(SignUpParameters parameters) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: parameters.email,
      password: parameters.password,
    );
    User? user = userCredential.user;
    print('User signed up: ${user!.uid}');

    await _firestore.collection('users').doc(user.uid).set({
      'name': parameters.displayName,
      'email': parameters.email,
      'phone': '',
      'profile_pic': ''
    });
    print('User data saved to Firestore.');
    return UserEntity(
        displayName: parameters.displayName, email: parameters.email);
  }

  @override
  Future<UserEntity> checkAuth() async {
    UserEntity userEntity = const UserEntity();
    User? user = _auth.currentUser;

    if (user != null) {
      await _firestore.collection('users').doc(user.uid).get().then((snapshot) {
        if (snapshot.exists) {
          Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

          userEntity = UserModel(
              id: user.uid,
              displayName: data['name'],
              email: data['email'],
              phone: data['phone'],
              profilePic: data['profile_pic']);
          print(userEntity);
          return userEntity;
        }
      });
    } else {
      print('Document does not exist');
    }
    return userEntity;
  }
}
