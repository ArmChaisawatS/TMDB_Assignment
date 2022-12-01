import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
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
            padding: const EdgeInsets.all(0),
            height: 535,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.53),
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
                          vote: popular[index]['vote_average'],
                          launchon: popular[index]['release_date'],
                        ),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(0),
                        child: Stack(
                          children: [
                            Positioned(
                              child: Container(
                                height: 280,
                                width: 170,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      url + popular[index]['poster_path'],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 20,
                              child: Container(
                                height: 40,
                                width: 40,
                                padding: const EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.black),
                                child: CircularPercentIndicator(
                                  backgroundColor: Colors.white,
                                  animation: true,
                                  animationDuration: 1000,
                                  progressColor: Colors.green,
                                  center: ModifiedText(
                                    text:
                                        '${(popular[index]['vote_average'] * 10).toStringAsFixed(0)} %',
                                    color: Colors.white,
                                    size: 12,
                                    textAlign: TextAlign.center,
                                  ),
                                  radius: 16,
                                  lineWidth: 3.0,
                                  percent: popular[index]['vote_average'] / 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ModifiedText(
                        text: popular[index]['title'] ?? 'Loading',
                        color: Colors.black,
                        size: 16,
                        textAlign: TextAlign.center,
                      ),
                      ModifiedText(
                          text: popular[index]['release_date'] ?? 'Loading',
                          color: Colors.grey,
                          size: 14,textAlign: TextAlign.center,)
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
