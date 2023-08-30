import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Screen/login/bloc/login_bloc.dart';
import 'Screen/onboarding.dart';
import 'Screen/register/bloc/register_bloc.dart';
import 'shared/network/repository.dart';

import 'Screen/Layout/bloc/appbloc.dart';
import 'Screen/Layout/layout.dart';
import 'Screen/login/login.dart';
import 'shared/network/local/cache_helper.dart';
import 'shared/network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();

  Widget widget;
  String? token = CacheHelper.getData(key: 'token');
  print('token=$token');
  if (token != null) {
    print('token=');
    widget = Layout();
  } else {
    print('token null');
    widget = Onboarding();
  }

  runApp(MyApp(startWidget: widget));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  const MyApp({required this.startWidget, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(
          create: (BuildContext context) => AppBloc(
            Repository(),
          )..add(InitFunc()),
        ),
        BlocProvider<LoginBloc>(
          create: (BuildContext context) => LoginBloc(repository: Repository()),
        ),
        BlocProvider<RegisterBloc>(
          create: (BuildContext context) =>
              RegisterBloc(repository: Repository()),
        ),
      ],
      child: MaterialApp(
        title: 'Food recommendation',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: startWidget,
      ),
    );
  }
}
