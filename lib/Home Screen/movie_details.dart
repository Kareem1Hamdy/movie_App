import 'package:flutter/material.dart';
import 'package:movie_app/Home%20Screen/similar_item.dart';
import 'package:movie_app/constant/constant.dart';
import 'package:movie_app/provider/app_provider.dart';
import 'package:provider/provider.dart';

class MovieDetailsScreen extends StatelessWidget {
   MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);
    if(provider.movieDetailsModel!=null&&provider.similarsModel==null){
      provider.getSimilarMovieDetailsByCatId(movieId: provider.movieDetailsModel!.id!);
    }
    return provider.movieDetailsModel==null||provider.similarsModel==null? const Center(child: CircularProgressIndicator(color: Colors.yellow,),)
        :Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          provider.movieDetailsModel!.title??"",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.white
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network('${Constant.imageConstant}${provider.movieDetailsModel!.backdropPath}'),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    provider.movieDetailsModel!.title??"",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    provider.movieDetailsModel!.releaseDate??"",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Image.network('${Constant.imageConstant}${provider.movieDetailsModel!.posterPath}',width: 129,height: 199,),
                          Image.asset('assets/images/bookmark.png',width: 27,height: 36,),
                        ],
                      ),
                      const SizedBox(width: 15,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              children: List.generate(provider.movieDetailsModel!.genres.length, (index) =>  Expanded(
                                child: MaterialButton(
                                  shape: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 2,
                                      )
                                  ),
                                  onPressed: (){},
                                  child: Text(
                                    '${provider.movieDetailsModel!.genres[index].name}',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                              ),)
                            ),
                            Text(
                              '${provider.movieDetailsModel!.overView}',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white
                              ),
                            ),
                            const SizedBox(height: 15,),
                            Row(
                              children: [
                                Icon(Icons.star,color: Colors.yellow,),
                                SizedBox(width: 5,),
                                Text(
                                  '${provider.movieDetailsModel!.rate}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )

                    ],
                  ),
                  const SizedBox(height: 50,),
                  Container(
                    color: Color(0xff282A28),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'More Like This',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          height: 200,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return SimilarItem(index: index,);
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(width: 15,);
                            },
                            itemCount: provider.similarsModel!.results.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
