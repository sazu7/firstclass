import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myapps/pages/helper/photos_helper.dart';
import 'package:myapps/pages/model/photos.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Photos>? photos;
  bool isLoaded = false;
  getData() async {
    photos = await PhotosHelper().getPhotos();
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
        title: Text('Photos'),
        backgroundColor: Colors.blue,
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
            itemCount: photos?.length ?? 0,
            itemBuilder: (_, index) {
              return Card(
                elevation: 5,
                child: ListTile(
                  title: Text(photos![index].title),
                  subtitle: Text(photos![index].url),
                ),
              );
            }),
      ),
    );
  }
}
