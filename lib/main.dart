import 'package:flutter/material.dart';
import 'package:flutter_task/pages/home_page.dart';
import 'package:flutter_task/providers/posts_provider.dart';
import 'package:flutter_task/providers/users_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (BuildContext context)=>UsersProvider(),),
    ChangeNotifierProvider(create: (BuildContext context)=>PostsProvider(),)
  ],
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Task',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

