import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AccountScreen extends StatefulWidget {
  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _updatecontroller = TextEditingController();

  Box? contactBox;
  @override
  void initState() {
    contactBox = Hive.box('contact-list');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Contact-list'),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'enter your text'),
              ),
              SizedBox(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        final userInput = _controller.text;
                        await contactBox!.add(userInput);
                        Fluttertoast.showToast(msg: 'Added Sucessesful');
                        _controller.clear();
                      } catch (e) {
                        Fluttertoast.showToast(
                          msg: e.toString(),
                        );
                      }
                    },
                    child: Text('Add data'),
                  ),
                ),
              ),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: Hive.box('contact-list').listenable(),
                  builder: (context, box, widget) {
                    return ListView.builder(
                      itemCount: contactBox!.keys.toList().length,
                      itemBuilder: (_, index) {
                        return Card(
                            elevation: 5,
                            child: ListTile(
                              trailing: Container(
                                width: 100,
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () async {
                                        _updatecontroller.text =
                                            contactBox!.get(index).toString();
                                        showDialog(
                                          context: context,
                                          builder: (_) {
                                            return Dialog(
                                              child: Container(
                                                height: 200,
                                                child: Column(
                                                  children: [
                                                    TextField(
                                                      controller:
                                                          _updatecontroller,
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        final updateInput =
                                                            _updatecontroller
                                                                .text;
                                                        contactBox!.putAt(
                                                            index, updateInput);
                                                        _updatecontroller
                                                            .clear();
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text('Update'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.green,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        await contactBox!.deleteAt(index);
                                        Fluttertoast.showToast(
                                            msg: 'Deleted Sucessesful');
                                      },
                                      icon: Icon(
                                        Icons.remove_circle_outline,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              title: Text(
                                contactBox!.getAt(index).toString(),
                              ),
                            ));
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
