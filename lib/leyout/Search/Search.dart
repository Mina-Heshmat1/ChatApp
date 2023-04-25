import 'package:chaatapp/leyout/chat_app/cubit/cubit.dart';
import 'package:chaatapp/leyout/chat_app/cubit/states.dart';
import 'package:chaatapp/leyout/chat_screen/chat_screen.dart';
import 'package:chaatapp/models/user_model.dart';
import 'package:chaatapp/shared/componentc/componentc.dart';
import 'package:chaatapp/shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../chat_app/cubit/cubit.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatStates>(
      listener: (context, states) {},
      builder: (context, states) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: primarycolor,
            title: Text(
              'Search',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefoltFormField(
                      controller: searchController,
                      label: "Search",
                      prifixIcon: Icons.search,
                      onChanged: (value) {
                        ChatCubit.get(context).getSearch();
                      }),
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

