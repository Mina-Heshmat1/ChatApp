import 'package:bloc/bloc.dart';
import 'package:chaatapp/chatapp/sign_up/cubit/states.dart';
import 'package:chaatapp/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatSingUpCubit extends Cubit<ChatSingUpStates>{
  ChatSingUpCubit():super(ChatSingUpInitialState());
  static ChatSingUpCubit get(context)=> BlocProvider.of(context);

void singUp({
  required String email,
  required String password,
  required String fullName,
  required String phoneNumber,
}){
  FirebaseAuth.instance.createUserWithEmailAndPassword
    (email: email, password: password).
  catchError((error){
    emit(ChatSingUpErrorState(error.toString()));
  }).then((value) {
    createUser(
        email: email,
        fullName: fullName,
        phoneNumber: phoneNumber,
        userID: value.user!.uid);
  });
}

void createUser({
  required String email,
  required String fullName,
  required String phoneNumber,
  required String userID,
}){
  UserModel userModel = UserModel(
      emailAddress: email,
      fullName: fullName,
    PhoneNumber: phoneNumber,
      userID:userID,
  );
  FirebaseFirestore.instance
      .collection('users')
      .doc(userID)
      .set(userModel.toJson())
      .then((value) {
        emit(ChatCreateUserSuccessState());
  })
      .catchError((error){
        emit(ChatCreateUserErrorState(error.toString()));
  });
}
}