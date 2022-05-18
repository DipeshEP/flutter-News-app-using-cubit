
import 'package:flutter/material.dart';
import 'package:loginform/src/models/user.dart';


class DetailedPage extends StatefulWidget {
   DetailedPage( {Key? key}) : super(key: key) ;

  @override
  State<DetailedPage> createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {

@override
  Widget build(BuildContext context) {
  final article = ModalRoute.of(context)!.settings.arguments as Articles;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
             // shape:const  RoundedRectangleBorder(
             //   borderRadius: BorderRadius.vertical(
             //     bottom: Radius.circular(40)
             //   )
             // ),
              pinned: true,
              stretch: true,
              expandedHeight: 200,
              flexibleSpace: GestureDetector(
                child: FlexibleSpaceBar(
                  background:  Hero(
                    tag: '$article.urlToImage',
                    child: Image.network(
                      article.urlToImage??'',
                      fit: BoxFit.fill,),
                  )

                ),
              ),

            ),
            SliverFillRemaining(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(article.title??'', style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                    ),),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(article.description??'',style:const TextStyle(fontSize: 18),),
                  )
                ],
              ),
            )

          ],

        ),
      ),
    );
  }
}