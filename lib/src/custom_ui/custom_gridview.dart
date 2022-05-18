
import 'package:flutter/material.dart';
import 'package:loginform/src/AppColors/colors.dart';

import '../pages/detailed_page.dart';

class CustomGridView extends StatelessWidget {
    CustomGridView({
    Key? key,
    required this.img,required this.arguments,
  }) : super(key: key);
  final img,arguments;

  @override
  Widget build(BuildContext context) {
  return GestureDetector(

      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailedPage(),
                settings: RouteSettings(
                    arguments:arguments )));
      },
     child: Hero(
       tag: '1',
       child: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage(
        img )),
        borderRadius: BorderRadius.circular(5),
        color: AppTheme.colors.bgcolor),
        ),
     ),
  //  ),
  );
  }
}
