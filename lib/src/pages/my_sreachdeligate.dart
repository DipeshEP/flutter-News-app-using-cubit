
import 'package:flutter/material.dart';

class MySearchDelegate  extends SearchDelegate{
  List<String> searchResults=[
    'India',
    'Brazil',
    'China',
    'USA',
    'Russia',

  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
   return [
   IconButton(onPressed: (){
     if(query.isEmpty){
       close(context, null);
     }
     else{
       query='';
     }

   },
       icon:Icon(Icons.clear, color: Colors.black12,)
   )
   ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return
    IconButton(
        onPressed: (){
          close(context, null);
        },
        icon: Icon(Icons.arrow_back) );

  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions=searchResults.where((searchResult){
      final result=searchResult.toLowerCase();
      final input=query.toLowerCase();
      return result.contains(input);
    }).toList();

    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index){
          final suggestion=suggestions[index];
          return ListTile(
            title: Text(suggestion),
            onTap: (){
              query=suggestion;
              showResults(context);
            },
          );
        });

  }


}
