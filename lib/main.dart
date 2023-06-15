import 'package:amicable/controller/status_provider.dart';
import 'package:amicable/views/login_screen.dart';
import 'package:amicable/views/navigate.dart';
import 'package:amicable/controller/shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'appwrite/auth.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  UserSavedData.init();
  runApp(ChangeNotifierProvider(
    create: ((context) => AuthAPI()),
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     final value = context.watch<AuthAPI>().status;
    
    print("TOP CHANGE NOTIFIER PROVIDER : $value");
    return ChangeNotifierProvider(
      create: ((context) => StatusProvider()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'Gilroy'
        ),
        debugShowCheckedModeBanner: false,
        home: value == AuthStatus.uninitialized ?
                       const Scaffold(
                        body: Center(
                          child: CircularProgressIndicator(color: Color.fromRGBO(199, 130, 229, 1),),
                        ),
                       ) : value == AuthStatus.authenticated ? const Navigate() : const LoginScreen()
      ),
    );
  }
}