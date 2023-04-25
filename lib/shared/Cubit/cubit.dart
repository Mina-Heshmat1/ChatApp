import 'package:bloc/bloc.dart';
import 'package:chaatapp/shared/Cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);

}