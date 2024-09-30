import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constant/constant.dart';
import 'package:movie_app/provider/app_provider.dart';
import 'package:provider/provider.dart';

import '../components/new_Releases_Movie_Item.dart';
import '../components/recommended_Movie_Item.dart';


class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);
    if(provider.popularsModel==null){
      provider.getPopular();
    } if(provider.upComingsModel==null){
      provider.getupComing();
    }if(provider.topRatedsModel==null){
      provider.gettopRated();
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: provider.popularsModel==null||provider.upComingsModel==null||provider.topRatedsModel==null?
      const Center(child: CircularProgressIndicator(color: Colors.yellow,))
          :SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              items:provider.popularsModel?.results.map((e) => Center(child: Image.network("${Constant.imageConstant}${e.posterPath}"),)).toList(),
              options: CarouselOptions(
                height: 400,
                aspectRatio: 16/9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),

            ),
            Container(
              color: Color(0xff282A28),
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'New Releases',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    height: 150,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return NewReleasesItem(index: index);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 15,);
                      },
                      itemCount: provider.upComingsModel!.results.length,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              color: Color(0xff282A28),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Recommended',
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
                        return RecommendedMovieItem(index: index);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 15,);
                      },
                      itemCount: provider.topRatedsModel!.results.length,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
