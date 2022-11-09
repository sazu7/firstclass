import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyAdsScreen extends StatelessWidget {
  const MyAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(tabs: [
              Tab(
                text: 'My Ads',
                icon: Icon(Icons.shopping_basket),
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: 'My Favourites',
              )
            ]),
          ),
          body: TabBarView(children: [
            Container(
              child: GridView.builder(
                  itemCount: 2,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (_, index) {
                    return Card(
                        elevation: 5,
                        child: Column(
                          children: [
                            Container(
                                child: Image.asset('assets/applewatch.png')),
                            Text(
                              'Apple Watch',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'Series 6 Red',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 50, 28, 245),
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '\$359',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ));
                  }),
            ),
            Container(
              child: Column(
                children: [
                  Card(
                    elevation: 5,
                    child: ListTile(
                      leading: SizedBox(
                        child: Image.asset('assets/applewatch.png'),
                      ),
                      title: Text('Apple Watch'),
                      subtitle: Text('Series 6, Red'),
                      trailing: Text('\$360'),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    child: ListTile(
                      leading: SizedBox(
                        child: Image.asset('assets/applewatch.png'),
                      ),
                      title: Text('Apple Watch'),
                      subtitle: Text('Series 6, Red'),
                      trailing: Text('\$360'),
                    ),
                  ),
                ],
              ),
            )
          ])),
    );
  }
}
