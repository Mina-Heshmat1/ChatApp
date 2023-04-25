
import 'package:chaatapp/leyout/chat_app/cubit/cubit.dart';
import 'package:chaatapp/leyout/chat_app/cubit/states.dart';
import 'package:chaatapp/leyout/chat_model.dart';
import 'package:chaatapp/models/user_model.dart';
import 'package:chaatapp/shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/componentc/componentc.dart';
import '../../shared/componentc/constans.dart';
import '../chat_app/chat_layout.dart';

class ChatScreen extends StatelessWidget {
  UserModel userModel;
  var mascontroller = TextEditingController();
  ScrollController _scrollController = ScrollController();

  ChatScreen(this.userModel);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
       ChatCubit.get(context).getAllMsg(userModel.userID);
        return BlocConsumer<ChatCubit, ChatStates>(
          listener: (context, state) {},
          builder: (context, state) {
            _scrollToBottom() {
              _scrollController
                  .jumpTo(_scrollController.position.maxScrollExtent);
            }
            WidgetsBinding.instance
                .addPersistentFrameCallback((timeStamp) => _scrollToBottom());
            return Scaffold(
                appBar: AppBar(
                    backgroundColor: primarycolor,
                    title: Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${userModel.fullName}',
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        )
                      ],
                    ),
                    titleSpacing: 1.0,
                    leading: InkWell(
                      onTap: () {
                        navigaateTo(context, ChatLayout());

                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    )),
                body: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,//massage lot of
                        controller: _scrollController,
                        itemBuilder: (context, index) {
                          var msg = ChatCubit.get(context).msg[index];
                          if (msg.senderID == uId) {
                            if(ChatCubit.get(context).msg[index].image!=''){
                              return MasRigheWithImage(ChatCubit.get(context).msg[index]);
                            }else{
                              return MasRighe(ChatCubit.get(context).msg[index]);
                            }
                          }
                          if(ChatCubit.get(context).msg[index].image!=''){
                            return MasLafteWithImage(ChatCubit.get(context).msg[index]);
                          }else{
                            return MasLafte(ChatCubit.get(context).msg[index]);
                          }

                        },
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: ChatCubit.get(context).msg.length,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          InkWell(
                              onTap: () {
                                ChatCubit.get(context)
                                    .pickImage(context, userModel);
                              },
                              child: const Icon(
                                Icons.photo,
                                size: 35,
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          /*TextFormField(
                            controller: mascontroller,
                            decoration: const InputDecoration(
                              label: Text('write msg'),
                                helperText: 'write msg'
                            ),
                          ),*/
                          Expanded(
                            child: DefoltFormField(
                              controller: mascontroller,
                              type: TextInputType.text,
                              label:"",
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
                                  ChatCubit.get(context).chatUser(
                                    msg: mascontroller.text,
                                    time: DateTime.now().toString(),
                                    recverID: userModel.userID,
                                  );
                                  mascontroller.text = '';
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
                  ],
                ));
          },
        );
      },
    );
  }

  Widget MasRighe(ChatModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Card(
            color: primarycolor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    model.msg,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      const Icon(Icons.check_rounded),
                       Text(model.time,
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  Widget MasLafte(ChatModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            color: primarycolor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    model.msg,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      const Icon(Icons.check_rounded),
                       Text(model.time,
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  Widget MasRigheWithImage(ChatModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Stack(
        alignment: Alignment.bottomCenter,
         children: [
           Image(image:NetworkImage(model.image),width: 150,),
           Card(
             color: primarycolor,
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                 mainAxisSize: MainAxisSize.min,
                 children: [
                   Text(
                     model.msg,
                     style: const TextStyle(
                       color: Colors.white,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                   const SizedBox(
                     width: 20,
                   ),
                   Column(
                     children: [
                       const Icon(Icons.check_rounded),
                       Text(model.time,
                           style: TextStyle(
                             color: Colors.white,
                           )),
                     ],
                   ),
                 ],
               ),
             ),
           ),
         ],
      ),
    ],
  );

  Widget MasLafteWithImage(ChatModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image(image:NetworkImage(model.image),width: 150,),
          Card(
            color: primarycolor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    model.msg,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      const Icon(Icons.check_rounded),
                      Text(model.time,
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ],
  );

}
