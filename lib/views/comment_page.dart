import 'package:flutter/material.dart';
import 'package:rest_api_practice/models/comment.dart';
import 'package:rest_api_practice/services/remote_service.dart';

class CommentPage extends StatefulWidget {
  //final postId;
  const CommentPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  List<Comment>? comments;
  bool isLoaded = false;
  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();
  }

  getData() async {
    comments = await RemoteService().getComment();
    if (comments != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        comments![index].name,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        comments![index].body ?? '',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ));
            }),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
