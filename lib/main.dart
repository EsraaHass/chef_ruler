import 'package:chef_ruler/chef/main/bloc/main_bloc.dart';
import 'package:chef_ruler/chef/main/bloc/main_state.dart';
import 'package:chef_ruler/chef/main/data/local_data_services.dart';
import 'package:chef_ruler/core/utils/theme.dart';
import 'package:chef_ruler/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(BlocProvider<MainBloc>(
    create: (context) => MainBloc(MainInitialState(), LocalDataServices()),
    child: MyApp(
      appRouter: AppRouter(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
      theme: MyTheme.lightTheme,
    );
  }
}
