import 'package:flutter/material.dart';

import '../models/user.dart';
import '../pages/detailed_page.dart';

class CustomCarouselWidget extends StatelessWidget {
  const CustomCarouselWidget({
    Key? key,
    required this.bgimage,this.arguments
  }) : super(key: key);

  final bgimage,arguments;

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
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Image.network(bgimage),
      ),
    );
  }
}