import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myapps/second_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Screen'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  /* Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SecondScreen(),
                    ),
                  ); */
                  Navigator.pushNamed(context, '/second-screen');
                },
                child: Text('First Screen'))
          ],
        ),
      ),
    );
  }
}
