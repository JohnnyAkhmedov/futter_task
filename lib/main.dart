import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_task/pages/home_page.dart';
import 'package:flutter_task/pages/signIn_page.dart';
import 'package:flutter_task/providers/auth_provider.dart';
import 'package:flutter_task/providers/users_provider.dart';
import 'package:provider/provider.dart';
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
void main()=>runApp(

    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context)=>AuthProvider())
      ],
      child:  const MyApp(),
    )
   );


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Task',
      theme: ThemeData(

        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

