import 'package:flutter/material.dart';
import 'package:movie_app/constant/constant.dart';
import 'package:movie_app/provider/app_provider.dart';
import 'package:provider/provider.dart';

class WatchListItem extends StatelessWidget {
   WatchListItem({super.key,required this.index});
  int index;

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network('${Constant.imageConstant}${provider.favourites[index].image}',width: 140,height: 150,),
        ),
        const SizedBox(width: 10,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  '${provider.favourites[index].title}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18
                ),
              ),
              Text(
                  '${provider.favourites[index].date}',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
