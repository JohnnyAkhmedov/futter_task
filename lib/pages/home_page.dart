import 'package:flutter/material.dart';
import 'package:flutter_task/providers/users_provider.dart';
import 'package:flutter_task/services/http_service.dart';
import 'package:provider/provider.dart';
class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<UsersProvider>(context,listen: false).getUsers();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var _provider = context.watch<UsersProvider>();
    return Scaffold(
      body: SafeArea(child:Center(
        child: ListView.builder(
            itemCount:_provider.usersList.length ,
            itemBuilder: (context, index) => UsersList(context, index))),

      )
    );
  }
}


 Widget UsersList (BuildContext context, int index ){
   var _provider = context.watch<UsersProvider>();
  return Card(
    child: ListTile(
      title: Text(_provider.usersList[index].username.toString()),
    ),
  );
 }