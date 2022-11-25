import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/controllers/bloc_observer.dart';
import 'package:football/controllers/main_cubit.dart';
import 'package:football/controllers/main_states.dart';
import 'package:football/dio_helper/dio_helper.dart';

import 'view/main_screen/main_screen.dart';

void main() {
  DioHelper.getDio();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>MainCubit()..getCountries(),
      child: BlocConsumer<MainCubit,MainStates>(
        listener: (context, state) {
          
        },
        builder:(context,state) {
          return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              platform: TargetPlatform.iOS,
              primaryColor: Colors.red[400]),
          home: const MainScreen(),
        );
        },
      ),
    );
  }
}
