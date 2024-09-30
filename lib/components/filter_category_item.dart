import 'package:flutter/material.dart';
import 'package:movie_app/constant/constant.dart';
import 'package:movie_app/provider/app_provider.dart';
import 'package:provider/provider.dart';

class FilterCategoryItem extends StatelessWidget {
   FilterCategoryItem({required this.index,super.key});

   int index;

  @override
  Widget build(BuildContext context) {
    var provider= Provider.of<AppProvider>(context);
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network('${Constant.imageConstant}${provider.filtersMovieModel!.results[index].posterPath}',width: 140,height: 200,),
        ),
        const SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${provider.filtersMovieModel!.results[index].title}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
              ),
            ),
            Text(
              '${provider.filtersMovieModel!.results[index].releaseDate}',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18
              ),
            ),
          ],
        ),
      ],
    );
  }
}
