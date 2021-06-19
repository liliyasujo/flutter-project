import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/model/photos_model.dart';
import 'package:flutter_project/screens/profilepage.dart';
import 'package:flutter_project/widgets/top_bar.dart';
import 'package:flutter_project/env/keys.dart' as config;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  List<PhotosModel> _photosData = [];

  Future<void> _fetchPhotos() async {
    final _dioInstance = Dio();

    _dioInstance.options.headers['Authorization'] =
        "Client-ID ${config.unsplashKey} ";

    final _fetchData =
        await _dioInstance.get('https://api.unsplash.com/photos');

    for (var _items in _fetchData.data) {
      setState(() {
        _photosData.add(
            PhotosModel(id: _items['id'], imgURL: _items['urls']['regular']));
      });
    }

    print("object");
  }
  @override
  void initState() {
    _fetchPhotos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ValueListenableBuilder(
                valueListenable: Hive.box('profile').listenable(),
                builder: (BuildContext context, Box value, Widget? child) =>
                    TopBar(
                  title: value.get('name'),
                  subtitle: 'Developer',
                  color: Color(0xff0B3D2E),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Photography',
                style: TextStyle(fontSize: 22, color: Color(0xff0B3D2E)),
              ),
              GridView.builder(
                itemCount: _photosData.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (ctx, index) => Container(
                  padding: EdgeInsets.all(10),
                  child: Image.network(
                    _photosData[index].imgURL,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(ProfileScreen.routeName);
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}
