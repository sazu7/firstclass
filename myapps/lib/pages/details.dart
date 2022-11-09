import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myapps/pages/model/comment.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen(this._comments);
  List<Comment>? _comments;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget._comments);
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Screen'),
      ),
    body: Column(
      children: [
        Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            
          ),
        )
      ],
    ),
    ),
  },
}