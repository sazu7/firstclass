import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myapps/pages/helper/comment_helper.dart';
import 'package:myapps/pages/model/comment.dart';

class FavoritScreen extends StatefulWidget {
  const FavoritScreen({super.key});

  @override
  State<FavoritScreen> createState() => _FavoritScreenState();
}

class _FavoritScreenState extends State<FavoritScreen> {
  List<Comment>? comments;
  bool isLoaded = false;
  getData() async {
    comments = await CommentHelper().getComments();
    setState(() {
      isLoaded = true;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
            itemCount: comments?.length ?? 0,
            itemBuilder: (_, index) {
              return Card(
                elevation: 5,
                child: ListTile(
                  title: Text(comments![index].email),
                  subtitle: Text(comments![index].body),
                ),
              );
            }),
      ),
    );
  }
}
