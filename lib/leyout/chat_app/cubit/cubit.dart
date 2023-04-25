import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:chaatapp/leyout/chat_app/cubit/states.dart';
import 'package:chaatapp/leyout/chat_model.dart';
import 'package:chaatapp/models/user_model.dart';
import 'package:chaatapp/shared/componentc/constans.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../shared/componentc/componentc.dart';
import '../../image_view_screen/image_view_screen.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() : super(ChatInitialState());

  static ChatCubit get(context) => BlocProvider.of(context);
  List<UserModel> userModel = [];



  getAllUser() async {
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        if (element.data()['userID'] != uId) {
          userModel.add(UserModel.fromjson(element.data()));
        }
        print(userModel);
        emit(ChatGetAllUserSuccessState());
      });
    }).catchError((error) {
      emit(ChatGetAllUserErrorState(error.toString()));
    });
  }

  void chatUser({
    required String msg,
    required String time,
    required  recverID,
    String? image,
  }) {
    late ChatModel chatModel=ChatModel(
        msg: msg, time: time, senderID: uId!, recverID: recverID,image: image ?? '');

/*
    if (image==''){
    }
*/

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('chats')
        .doc(recverID)
        .collection('message')
        .add(chatModel.toJson())
        .then((value) {
      emit(SendMsgSuccessState());

      FirebaseFirestore.instance
          .collection('users')
          .doc(recverID)
          .collection('chats')
          .doc(uId)
          .collection('message')
          .add(chatModel.toJson())
          .then((value) {})
          .catchError((error) {
        emit(SendMsgErrorState(error.toString()));
      });
    }).catchError((error) {
      emit(SendMsgErrorState(error.toString()));
    });
  }

  List <ChatModel>msg=[];

  void getAllMsg(@required recverID) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('chats')
        .doc(recverID)
        .collection('message')
        .orderBy('time')
        .snapshots()
        .listen((event) {
      msg = [];
      event.docs.forEach((element) {
        msg.add(ChatModel.fromJson(element.data()));
      });
      emit(ChatGetAllMsgState());
    });
  }

  uploadImageTostorage({
    required String msg,
    required String time,
    required String recverID,
    required String uId,
}){
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('image/${Uri.file(image!.path).pathSegments.last}')
        .putFile(image!).then((value){
      value.ref.getDownloadURL().then((imageUrlPath){
        chatUser(msg: msg, time: time, recverID: recverID,image: imageUrlPath);
      }).catchError((error){

      });
      emit(UplodeImageSuccessState());
    }).catchError((error){
      emit(UplodeImageErrorState(error.toString()));
    });
  }

  var pickar = ImagePicker();
  File? image;


  Future<void> pickImage(context, UserModel model)async{
    final pickImage =await  pickar.pickImage(
        source: ImageSource.gallery,
    );
    if (pickImage!=null){
      image= File(pickImage.path);
      if(image!=null){
        navigaateTo(context,ImageViewScreen(model));
      }

    }else{
      emit(UplodeImageErrorState('NoImageSlacted'));
    }
 }


  void getSearch() async {
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        if (element.data()['userID'] != uId) {
          userModel.add(UserModel.fromjson(element.data()));
        }
        print(userModel);
        emit(ChatGetAllUserSuccessState());
      });
    }).catchError((error) {
      emit(ChatGetAllUserErrorState(error.toString()));
    });
  }



}


