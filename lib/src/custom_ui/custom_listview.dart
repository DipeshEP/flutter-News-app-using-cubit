
import 'package:flutter/material.dart';
import 'package:loginform/src/AppColors/colors.dart';

import '../pages/detailed_page.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
    Key? key,
    required this.title,this.img,required this.arguments
  }) : super(key: key);

  final  title,img,arguments;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailedPage(),
                settings: RouteSettings(
                    arguments:arguments )));
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                img,
              )),
          borderRadius: BorderRadius.circular(15),
          //border: Border.all(AppColors: Colors.black38)
        ),
        height: 200,
        width: 200,
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              title,
              style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.colors.white,
            ),
          ),
        ),
      ),
    )
    );
  }
}
