import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddScreen extends StatelessWidget {
  TextEditingController _emailControler = TextEditingController();
  TextEditingController _passwordControler = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Form Validation')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailControler,
                decoration: InputDecoration(hintText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'this field cant be empty';
                  } else if (value.length < 5) {
                    return 'enter your full name';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.text,
                controller: _passwordControler,
                decoration: InputDecoration(hintText: 'Password'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'this field cant be empty';
                  } else if (value.length < 6) {
                    return 'enter your correct password';
                  } else {
                    return null;
                  }
                },
              ),
              Divider(
                color: Colors.transparent,
              ),
              SizedBox(
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print('validation successfull');
                        } else {
                          print('failed');
                        }
                      },
                      child: Text('Login')))
            ],
          ),
        ),
      ),
    );
  }
}
