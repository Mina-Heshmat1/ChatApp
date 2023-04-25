import 'package:chaatapp/leyout/Search/Search.dart';
import 'package:chaatapp/leyout/chat_app/cubit/cubit.dart';
import 'package:chaatapp/leyout/chat_app/cubit/states.dart';
import 'package:chaatapp/models/user_model.dart';
import 'package:chaatapp/shared/componentc/componentc.dart';
import 'package:chaatapp/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/componentc/constans.dart';
import '../chat_screen/chat_screen.dart';

class ChatLayout extends StatelessWidget {
  const ChatLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: chatcolor,
          /*appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),*/
          body: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              const Center(
                  child: Text(
                'Conversation',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              )),
              Container (
                height: height(context) - 105,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Row(
                        children: [
                          Text(
                            'Chat',
                            style: TextStyle(
                              color: chatcolor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: (){
                              navigaateTo(context,SearchScreen());
                            },
                            child: Icon(
                              Icons.search,
                              color: chatcolor,
                            ),
                          ),
                          Icon(
                            Icons.add,
                            color: chatcolor,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context,index)=>itemchat(ChatCubit.get(context).userModel[index],context),
                          separatorBuilder: (context,index)=>const Divider(),
                          itemCount: ChatCubit.get(context).userModel.length),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  Widget itemchat(UserModel userModel ,context) => InkWell(
    onTap:(){
      navigaateTo(context ,ChatScreen(userModel));
    } ,
    child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            padding: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(35),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  child: Icon(Icons.person),
                  backgroundColor: Colors.white,
                  radius: 35,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${userModel.fullName}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'HI',
                      style: TextStyle(
                        color: chatcolor,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: chatcolor,
                      radius: 15,
                      child: const Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('7:35'),
                  ],
                ),
              ],
            ),
          ),
        ),
  );
}
