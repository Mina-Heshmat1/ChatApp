import 'package:bloc/bloc.dart';
import 'package:chaatapp/leyout/chat_app/chat_layout.dart';
import 'package:chaatapp/leyout/chat_app/cubit/cubit.dart';
import 'package:chaatapp/shared/Cubit/BlocObserver.dart';
import 'package:chaatapp/shared/Cubit/cubit.dart';
import 'package:chaatapp/shared/Cubit/states.dart';
import 'package:chaatapp/shared/componentc/constans.dart';
import 'package:chaatapp/shared/natwork/local/cache_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'chatapp/auth/login/login screen.dart';
import 'shared/natwork/local/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //await DioHelper.init();
   await Firebase.initializeApp();
   await CacheHelper.init();
   //bool isDark = CacheHelper.getData(Key: 'isDark');
  Widget widget;

  if(CacheHelper.getData(Key: 'uId')==null)
  {
    uId = '';
  }else{
    uId=CacheHelper.getData(Key: 'uId') ;
  }

  if (uId != ''){
    widget= ChatLayout();
  }else{
    widget= LoginScreen();
  }

  BlocOverrides.runZoned(
    () {
      runApp(MyApp(widget));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  MyApp(this.startWidget);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()),
        BlocProvider(create: (context)=>ChatCubit()..getAllUser()),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, states){},
        builder: (context, states){
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.grey,
              ),
              home: startWidget);
        },

      ),
    );
  }
}
