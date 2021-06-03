import 'package:flutter/material.dart';
import 'package:flutter_project/top_bar.dart';

class HomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopBar(
              title: 'Liliya Sujo',
              subtitle: 'Developer',
              color: Color(0xff0B3D2E),
            ),
            const SizedBox(height: 10),
            Text('Photography',style: TextStyle(fontSize: 22,color: Color(0xff0B3D2E)),),
          ],
        ),
      ),
    );
  }
}
