import 'package:bloc/bloc.dart';
import 'package:chaatapp/chatapp/auth/login/cubit/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatLoginCubit extends Cubit<ChatLoginStates>{
  ChatLoginCubit():super(ChatLoginInitialState());
  static ChatLoginCubit get(context)=> BlocProvider.of(context);


 void loginuser({
   required String email,
   required String password,

}){
   FirebaseAuth.instance.signInWithEmailAndPassword(email:email, password: password).
   then((value) {
     emit(ChatLoginSuccessState(value.user!.uid));
   }).catchError((error){
     print(error.toString());
     emit(ChatLoginErrorState(error.toString()));
   });
 }
}