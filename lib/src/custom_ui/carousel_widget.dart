import 'package:flutter/material.dart';
import 'package:loginform/src/AppColors/colors.dart';
import '../pages/detailed_page.dart';

class CustomCarouselWidget extends StatelessWidget {
  const CustomCarouselWidget(
      {Key? key, required this.bgimage, this.arguments, this.data})
      : super(key: key);

  final bgimage, arguments, data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailedPage(),
                settings: RouteSettings(arguments: arguments)));
      },
      child: Stack(
        children: [
          Image.network(bgimage),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                data,
                style: TextStyle(
                  color: AppTheme.colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  backgroundColor: Colors.black.withOpacity(0.3),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
