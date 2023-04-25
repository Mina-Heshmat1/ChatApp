import 'package:chaatapp/chatapp/auth/login/cubit/cubit.dart';
import 'package:chaatapp/chatapp/auth/login/cubit/states.dart';
import 'package:chaatapp/shared/componentc/constans.dart';
import 'package:chaatapp/shared/natwork/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../leyout/chat_app/chat_layout.dart';
import '../../../shared/componentc/componentc.dart';
import '../../sign_up/sing_up_screen.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ChatLoginCubit(),
      child: BlocConsumer<ChatLoginCubit, ChatLoginStates>(
        listener: (context, states) {
          if(states is ChatLoginSuccessState){
            navigaateAndFinish(context, ChatLayout());
            CacheHelper.saveData(Key: 'uId', value:states.userUID ).then((value){
              uId=states.userUID;
              navigaateAndFinish(context,ChatLayout());
            });
          }
        },
        builder: (context, states) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 300,
                    child: Image.asset(
                      'ASSETS/images/chatbachgrond.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.lightBlueAccent,
                            blurRadius: 25,
                          )
                        ]),*/
                    child: Image.asset('ASSETS/images/LogoChatApp.png',cacheWidth: 300,cacheHeight: 300,),
                  ),
                  Text(
                    'Conversation',
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: DefoltFormField(
                      controller: emailController,
                      label: 'EmailAddrase',
                      type: TextInputType.emailAddress,
                      suffixIcon: Icons.email_outlined,
                      validator: (value) {
                        if(value.isEmpty)
                        {
                          return 'Please complete the information';
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: DefoltFormField(
                      controller: PasswordController,
                      label: 'Password',
                      type: TextInputType.visiblePassword,
                      suffixIcon: Icons.lock,
                      validator: (value) {
                        if(value.isEmpty)
                        {
                          return 'Please complete the information';
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      ChatLoginCubit.get(context).loginuser(
                          email: emailController.text,
                          password: PasswordController.text);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 35,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.blue,
                        ),
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 25,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'New User ?',
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: (){
                          navigaateTo(context, SingUpScreen());
                        },
                        child: Text(
                          ' Signup now',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


