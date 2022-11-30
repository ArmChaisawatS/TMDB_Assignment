import 'package:flutter/material.dart';
import 'package:tmdb_application/screen/description.dart';
import 'package:tmdb_application/utils/text.dart';

class PopularMovies extends StatelessWidget {
  final List popular;

  const PopularMovies({super.key, required this.popular});

  @override
  Widget build(BuildContext context) {
    String url = 'https://image.tmdb.org/t/p/w500';
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            height: 535,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.58),
              itemCount: popular.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DescriptionScreen(
                          name: popular[index]['title'],
                          description: popular[index]['overview'],
                          bannerurl: url + popular[index]['backdrop_path'],
                          posterurl: url + popular[index]['poster_path'],
                          vote: popular[index]['vote_average'].toString(),
                          launchon: popular[index]['release_date'],
                        ),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 235,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(
                              url + popular[index]['poster_path'],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ModifiedText(
                        text: popular[index]['title'] ?? 'Loading',
                        color: Colors.black,
                        size: 16,
                      ),
                      ModifiedText(
                          text: popular[index]['release_date'] ?? 'Loading',
                          color: Colors.grey,
                          size: 14)
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
