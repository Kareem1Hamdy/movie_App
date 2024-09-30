import 'package:flutter/material.dart';
import 'package:movie_app/Browse%20Screen/browse_category_details.dart';
import 'package:movie_app/constant/constant.dart';
import 'package:movie_app/provider/app_provider.dart';
import 'package:provider/provider.dart';

class BrowseCategoryItem extends StatelessWidget {
   BrowseCategoryItem({super.key,required this.index});
  int index;

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);
    return GestureDetector(
      onTap: (){
        provider.getFilterMovies();
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BrowseCategoryDetails(index: index,),));
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
         ClipRRect(
           borderRadius: BorderRadius.circular(15),
           child:  Image.network('${Constant.imageConstant}${provider.topRatedsModel!.results[index].posterPath}'),
         ),
           Text(
               '${provider.generalsMovieModel!.genres[index].name}',
             style: TextStyle(
               color: Colors.white,
               fontWeight: FontWeight.bold,
               fontSize: 20,
             ),
           ),
        ],
      ),
    );
  }
}
