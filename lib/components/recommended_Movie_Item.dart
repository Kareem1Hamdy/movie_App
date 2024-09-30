import 'package:flutter/material.dart';
import 'package:movie_app/Home%20Screen/movie_details.dart';
import 'package:movie_app/constant/constant.dart';
import 'package:movie_app/provider/app_provider.dart';
import 'package:provider/provider.dart';

class RecommendedMovieItem extends StatelessWidget {
   RecommendedMovieItem({super.key,required this.index});
  int index;

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);
    return GestureDetector(
      onTap: (){
        provider.getMovieDetailsByCatId(catId: provider.topRatedsModel!.results[index].id!);
        Navigator.push(
            context,
            MaterialPageRoute(builder: ((context) => MovieDetailsScreen())));
      },
      child: Container(
        width: 97,
        child: Card(
          color: Color(0xff343534),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network('${Constant.imageConstant}${provider.topRatedsModel!.results[index].posterPath}',width: 97,height: 128,),
                  GestureDetector(
                    onTap: (){
                      provider.addToFavourite(provider.topRatedsModel!.results[index]);
                    },
                      child: Image.asset('assets/images/bookmark.png',width: 27,height: 36,)),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.star,color: Colors.yellow,),
                  SizedBox(width: 7,),
                  Text(
                      '${provider.topRatedsModel!.results[index].rate}',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Text(
                  '${provider.topRatedsModel!.results[index].title}',
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    '${provider.topRatedsModel!.results[index].releaseDate}',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      color: Colors.grey
                    ),
                  ),
                  SizedBox(width: 5,),
                  // Text(
                  //   '1h 59m',
                  //   style: TextStyle(
                  //       fontSize: 12,
                  //       fontWeight: FontWeight.w400,
                  //     color: Colors.grey
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
