import 'package:flutter/material.dart';
import 'package:flutter_task/pages/posts_list_page.dart';
import 'package:flutter_task/providers/users_provider.dart';
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
      appBar: AppBar(
        title: const Text('Users'),
        centerTitle: true,
      ),
      body: SafeArea(child:Center(
        child:_provider.isLoading
            ?const CircularProgressIndicator()
            :ListView.builder(

            // shrinkWrap: true,
            itemExtent: 80,
            itemCount:_provider.usersList.length ,
            itemBuilder: (context, index) => usersList(context, index))),

      )
    );
  }
}


 Widget usersList (BuildContext context, int index ){
   var _provider = context.watch<UsersProvider>();
  return Card(
    elevation: 8,
    child: Center(
      child: ListTile(

        leading: CircleAvatar(
          backgroundImage:AssetImage('assets/images/avataaars(${index+1}).png'),
          // backgroundColor: Colors.black,
          radius: 25,
        ),
        title: Text(_provider.usersList[index].username.toString()),
        onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>PostsPage(index: index)));
        },
      ),
    ),
  );
 }