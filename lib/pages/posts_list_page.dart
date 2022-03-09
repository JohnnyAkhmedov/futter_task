import 'package:flutter/material.dart';
import 'package:flutter_task/pages/post_information.dart';
import 'package:flutter_task/providers/comments_provider.dart';
import 'package:provider/provider.dart';


import '../providers/posts_provider.dart';

class PostsPage extends StatefulWidget {
  final int index;
  const PostsPage({Key? key,required this.index}) : super(key: key);


  @override
  // ignore: no_logic_in_create_state
  _PostsPageState createState() => _PostsPageState(index: index);
}

class _PostsPageState extends State<PostsPage> {
  final int index;
  _PostsPageState({required this.index});
  @override
  void initState() {
    Provider.of<PostsProvider>(context,listen: false).getPosts(index);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var _provider = context.watch<PostsProvider>();

    return Scaffold(
      appBar: AppBar(title:
        const Text('Posts'),
        centerTitle: true,
      ),
      body: Center(
        child:_provider.isLoading
            ? const CircularProgressIndicator()
            :ListView.builder(
          itemExtent: 80,
            itemCount:_provider.userPosts.length ,
            itemBuilder: (context, index) => postsList(context, index)),
      ),
    );
  }
}

Widget postsList (BuildContext context, int index ){
  var _provider = context.watch<PostsProvider>();
  return Card(
    elevation: 8,
    child: Center(
      child: ListTile(

        title: Text(_provider.userPosts[index].title.toString()),
        onTap: (){

         Navigator.push(context, MaterialPageRoute(builder: (_)=>PostInformation(index: index,postId: _provider.userPosts[index].id,)));
        },
      ),
    ),
  );
}