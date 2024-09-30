import 'package:flutter/material.dart';
import 'package:movie_app/provider/app_provider.dart';
import 'package:provider/provider.dart';

import '../components/browse_category_item.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);
    if(provider.generalsMovieModel==null){
      provider.getMovieList();
    }
    return Scaffold(
      backgroundColor: Colors.black,
      body: provider.generalsMovieModel==null?const Center(child: CircularProgressIndicator(),)
          : Padding(
        padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Browse Category',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                )
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (context, index) {
                  return BrowseCategoryItem(index: index,);
                },
                itemCount: provider.generalsMovieModel!.genres.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
