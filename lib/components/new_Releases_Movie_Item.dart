import 'package:flutter/material.dart';
import 'package:movie_app/Home%20Screen/movie_details.dart';
import 'package:movie_app/constant/constant.dart';
import 'package:movie_app/provider/app_provider.dart';
import 'package:provider/provider.dart';

class NewReleasesItem extends StatelessWidget {
   NewReleasesItem({super.key,required this.index});
  int index;

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);
    return GestureDetector(
      onTap: (){
        provider.getMovieDetailsByCatId(catId: provider.upComingsModel!.results[index].id!);
        Navigator.push(
            context,
            MaterialPageRoute(builder: ((context) => MovieDetailsScreen())));
      },
      child: Stack(
          children: [
            Image.network('${Constant.imageConstant}${provider.upComingsModel!.results[index].posterPath}',width: 97,height: 128,),
            GestureDetector(
              onTap: (){
                provider.addToFavourite(provider.upComingsModel!.results[index]);
              },
                child: Image.asset('assets/images/bookmark.png',width: 27,height: 36,)),
          ],
        ),
    );
  }
}
