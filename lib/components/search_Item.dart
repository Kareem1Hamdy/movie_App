import 'package:flutter/material.dart';
import 'package:movie_app/constant/constant.dart';
import 'package:movie_app/provider/app_provider.dart';
import 'package:provider/provider.dart';

class SearchItem extends StatelessWidget {
   SearchItem({required this.index,super.key});
  int index;

  @override
  Widget build(BuildContext context) {
    var provider= Provider.of<AppProvider>(context);
    return Expanded(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network('${Constant.imageConstant}${provider.searchesModel!.results[index].posterPath}',width: 140,height: 150,),
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${provider.searchesModel!.results[index].title}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18
                  ),
                ),
                Text(
                  '${provider.searchesModel!.results[index].releaseDate}',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
