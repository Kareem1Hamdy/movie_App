import 'package:flutter/material.dart';

class WatchListItem extends StatelessWidget {
  const WatchListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset('assets/images/movie_image.png'),
        ),
        const SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Alita Battle Angel',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18
              ),
            ),
            Text(
                '2019',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16
              ),
            ),
            Text(
                'Rosa Salazar, Christoph Waltz',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15
              ),
            ),
          ],
        ),
      ],
    );
  }
}
