
import 'package:flutter/material.dart';
import 'package:loginform/src/AppColors/colors.dart';

import '../pages/detailed_page.dart';

class CustomVerticalListView extends StatelessWidget {
  const CustomVerticalListView({
    Key? key,
    required this.title,this.img,this.description,this.arguments
  }) : super(key: key);

  final img,title,description,arguments ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child: ListTile(
          tileColor:AppTheme.colors.tileColor,
            leading: Hero(
              tag: img,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  img,
                ),
              ),
            ),
            title: Text(
              title,
              maxLines: 2,
              style:  TextStyle(
                color: AppTheme.colors.white,
                  fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              description,
              maxLines: 2,
              style: TextStyle(
                  color: AppTheme.colors.white
              ),
            ),
            onTap: () {
             Navigator.push(context, MaterialPageRoute(settings: RouteSettings(arguments: arguments),
                 builder: (context)=>DetailedPage())); }),
      ),
    );
  }
}
