import 'package:flutter/material.dart';
import 'package:movie_app/components/filter_category_item.dart';
import 'package:movie_app/provider/app_provider.dart';
import 'package:provider/provider.dart';

class BrowseCategoryDetails extends StatelessWidget {
   BrowseCategoryDetails({required this.index,super.key});

  int index;

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: provider.filtersMovieModel==null?
      const Center(child: CircularProgressIndicator(color: Colors.yellow,),)
          :Padding(
        padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${provider.generalsMovieModel!.genres[index].name}',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                )
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return FilterCategoryItem(index: index,);
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
                itemCount: provider.filtersMovieModel!.results.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
