import 'package:flutter/material.dart';
import 'package:movie_app/components/search_Item.dart';
import 'package:movie_app/provider/app_provider.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({super.key});

   TextEditingController controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 15),
        child: Column(
          children: [
            TextFormField(
              onChanged: (value){
                provider.getSearchMovies(value);
              },
              controller: controller,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20
              ),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search_outlined,color: Colors.white,),
                hintText: 'Search',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
                fillColor: const Color(0xff514F4F),
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    )
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    )
                ),
              ),
            ),
            provider.searchesModel==null?Center(child: Image.asset('assets/images/no_movies_found.png'),)
                :Expanded(child: ListView.separated(
                itemBuilder: (context, index) {
                  return SearchItem(index: index);
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
                itemCount: provider.searchesModel!.results.length,
              ),
            ),
          ],
        ),
      )
    );
  }
}
