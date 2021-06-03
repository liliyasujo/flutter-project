import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;
  TopBar({required this.subtitle,required this.title, required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 44, horizontal: 23),
      width: double.infinity,
      color:color,
      child:Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage('https://www.desicomments.com/dc3/19/439319/439319.jpg'),
          ),
          const SizedBox(width: 10),
        Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
          Text(
            subtitle,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
      ],)
       
    );
  }
}