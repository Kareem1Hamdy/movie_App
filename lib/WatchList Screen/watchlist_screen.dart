import 'package:flutter/material.dart';
import 'package:movie_app/provider/app_provider.dart';
import 'package:provider/provider.dart';
import '../components/watchList_Item.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            provider.favourites.isEmpty? const Center(child: Text('The WatchList is Empty!',style: TextStyle(color: Colors.white,fontSize: 20),))
                : const Text('WatchList',
                style: TextStyle(
                    color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                )
            ),
               Expanded(child: ListView.separated(
               itemBuilder: (context, index) {
                 return WatchListItem(index: index);
               },
               separatorBuilder: (context, index) {
                 return Column(
                   children: [
                     const SizedBox(height: 10,),
                     Container(
                       color: Colors.grey,
                       height: 1,
                       width: double.infinity,
                     ),
                     const SizedBox(height: 20,)
                   ],
                 );
               },
               itemCount: provider.favourites.length,
             ),
           ),
          ],
        ),
      ),
    );
  }
}
