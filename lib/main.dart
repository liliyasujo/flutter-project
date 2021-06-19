import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_project/screens/homepage.dart';
import 'package:flutter_project/screens/profilepage.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;
  Hive.init(appDocPath);
  var boxs = await Hive.openBox('profile');

  var box = Hive.box('profile');
  box.put('name', 'Fayez');

  var name = box.get('name');

  print('Name: $name');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {ProfileScreen.routeName: (ctx) => ProfileScreen()},
      home: HomePageScreen(),
    );
  }
}


