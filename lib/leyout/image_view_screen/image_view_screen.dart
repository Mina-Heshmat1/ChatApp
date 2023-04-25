import 'package:chaatapp/leyout/chat_app/cubit/cubit.dart';
import 'package:chaatapp/models/user_model.dart';
import 'package:flutter/material.dart';
import '../../shared/componentc/componentc.dart';
import '../../shared/styles/colors.dart';


class ImageViewScreen extends StatelessWidget {
  var mascontroller = TextEditingController();
  UserModel userModel;


  ImageViewScreen(this.userModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ChatCubit
              .get(context)
              .image!=null?
          Expanded(child: Image(image: FileImage(ChatCubit.get(context).image!),)):Icon(Icons.photo),
          /*Padding(
            padding: const EdgeInsets.all(8.0),
            child : Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 0.5,
                  )
                ]
              ),
            child:Row(
              children: [

                SizedBox(width: 10,),
                DefoltFormField(
                  controller: mascontroller,
                  type: TextInputType.text,
                  label: '',
                  validate:(){},
                  prifix: Icons.mail_outline_sharp,

                ),
                SizedBox(width: 10,),
                InkWell(
                  onTap: (){
                    if (mascontroller.text .isNotEmpty){
                      DateTime now = DateTime.now();
                      print('${now .hour.toString()}: ${now.minute.toString()}');
                      ChatCubit.get(context).chatUser(msg: mascontroller.text,
                        time: DateTime.now().toString(),
                        recverID: userModel.userID,);
                      mascontroller.text='';
                    }else{
                      print('empty');
                    }
                  },
                  child: Icon(Icons.send,color: primarycolor,),
                ),
              ],
            ),
          ),
          ),*/
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow:[
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 0.5,
                  )
                ]
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: DefoltFormField(
                      controller: mascontroller,
                      type: TextInputType.text,
                      label:"",
                      prifix: Icons.email_outlined
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      if (mascontroller.text.isNotEmpty) {
                        DateTime now = DateTime.now();
                        print('${now.hour.toString()}: ${now.minute.toString()}');
                        ChatCubit.get(context).uploadImageTostorage(
                          msg: mascontroller.text,
                          time: DateTime.now().toString(),
                          recverID: userModel.userID,
                          uId: '',
                        );
                        mascontroller.text = '';
                        Navigator.of(context).pop();
                      } else {
                        print('empty');
                      }
                    },
                    child: Icon(
                      Icons.send,
                      color: primarycolor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
