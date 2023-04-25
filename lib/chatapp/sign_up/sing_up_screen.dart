import 'package:chaatapp/chatapp/sign_up/cubit/cubit.dart';
import 'package:chaatapp/chatapp/sign_up/cubit/states.dart';
import 'package:chaatapp/shared/componentc/componentc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingUpScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var nemaController = TextEditingController();
  var phoneController = TextEditingController();
  var PasswordController = TextEditingController();
  var ConformPasswordController = TextEditingController();
  var formKey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>ChatSingUpCubit(),
      child: BlocConsumer<ChatSingUpCubit,ChatSingUpStates>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: Container(),
            ),
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 120,
                        height: 120,
                        /*decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 12,
                              )
                            ]),*/
                        child: Image.asset('ASSETS/images/playstore.png'),
                      ),
                    ),
                    const SizedBox(height:20,),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text('Sing_Up...',
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,)),
                    ),
                    const SizedBox(height:25,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: DefoltFormField(
                        controller: nemaController,
                        label: 'FullNema',
                        type: TextInputType.text,
                        suffixIcon: Icons.person,
                        validator: (value) {
                          if(value.isEmpty)
                          {
                            return 'Please complete the information';
                          }
                        },
                      ),
                    ),
                    const SizedBox(height:20,),
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
                    const SizedBox(height:20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: DefoltFormField(
                        controller: phoneController,
                        label: 'PhoneNumber',
                        type: TextInputType.number,
                        suffixIcon: Icons.phone,
                        validator: (value) {
                          if(value.isEmpty)
                        {
                          return "Please complete the information";
                        }},
                      ),
                    ),
                    const SizedBox(height:20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: DefoltFormField(
                        controller: PasswordController,
                        label: 'Password',
                        type: TextInputType.visiblePassword,
                        suffixIcon: Icons.lock_clock_rounded,
                        isPassword: true,
                        validator: (value) {
                          if(value.isEmpty)
                          {
                            return 'Please complete the information';
                          }
                        },
                      ),
                    ),
                    const SizedBox(height:20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: DefoltFormField(
                        controller: ConformPasswordController,
                        label: 'Conform Password',
                        type: TextInputType.visiblePassword,
                        suffixIcon: Icons.lock_clock_rounded,
                        isPassword: true,
                        validator: (value) {
                          if(value.isEmpty)
                          {
                            return 'Please complete the information';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height:20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10,),
                      child: InkWell(
                        onTap: () {
                          if(formKey.currentState!.validate()){
                            ChatSingUpCubit.get(context).singUp(
                                email: emailController.text,
                                password: PasswordController.text,
                                fullName: nemaController.text,
                                phoneNumber: phoneController.text,
                            );
                          }
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
                            child: const Center(
                              child: Text(
                                'Sing Up',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 25,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
