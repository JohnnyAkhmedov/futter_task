import 'package:flutter/material.dart';
import 'package:flutter_task/providers/comments_provider.dart';
import 'package:provider/provider.dart';
import '../providers/posts_provider.dart';
class PostInformation extends StatefulWidget {
  final int index;
  final int? postId;
  const PostInformation({Key? key,required this.index,required this.postId}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<PostInformation> createState() => _PostInformationState(index: index,postId: postId);
}

class _PostInformationState extends State<PostInformation> {
   final int index;
   final int? postId;
   _PostInformationState({required this.index,required this.postId});
   @override
  void initState() {
     Provider.of<CommentsProvider>(context,listen: false).getComments(postId);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var _postsProvider = context.watch<PostsProvider>();
    var _commentsProvider = context.watch<CommentsProvider>();

    TextEditingController _commentController = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Info'),
      ),
      bottomSheet: Container(
        color: Colors.blue,
        height: 60,
        width: double.infinity,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                child: Center(
                  child: TextField(
                    controller: _commentController,
                  decoration: InputDecoration(
                    hintText: 'Leave a comment'
                  ),
                  ),
                ),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.white,
                ),
                height: 40,
                width: size.width*0.7,
                
              ),
              Container(
                height: 40,
                width: size.width*0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.white,
                ),
                child: TextButton(onPressed: (){
                  Provider.of<CommentsProvider>(context,listen: false).postComments(_commentController.text);
                }, child: Text('POST')),
              )
            ],
          ),
        ),
      ),
      body: Center(child:

      SingleChildScrollView(
        child:_commentsProvider.isLoading
            ? const CircularProgressIndicator()
            : Container(
          child: Column(
            
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${
                    _postsProvider.userPosts[widget.index].title
                }',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                ),
              ),
              Text('${
                  _postsProvider.userPosts[widget.index].body
              }'),
              SizedBox(
                height: 10,
              ),
              Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Comments:',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),),
              Container(
                  child: Column(
                    children: _commentsProvider.commentsList.map(
                            (list) => Card(
                              elevation: 10,
                              child: Container(
                                height: 100,
                               width: 400,
                                margin: EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    // Text(list.name.toString()),
                                    Text(list.body.toString())
                                  ],
                                ),
                              ),
                            )
                    ).toList(),
                  ),
                ),

            ],
          ),
        ),
      ),),

    );
  }
}


