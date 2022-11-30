import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tmdb_application/utils/text.dart';

class DescriptionScreen extends StatelessWidget {
  final dynamic name, description, bannerurl, posterurl, vote, launchon;

  const DescriptionScreen({
    super.key,
    required this.name,
    required this.description,
    required this.bannerurl,
    required this.posterurl,
    required this.vote,
    required this.launchon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        padding: const EdgeInsets.all(0),
        child: ListView(
          children: [
            Container(
              height: 365,
              padding: const EdgeInsets.all(0),
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      padding: EdgeInsets.zero,
                      height: 350,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        posterurl,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 85,
                    child: CircularPercentIndicator(
                      center: ModifiedText(
                        text: '$vote %',
                        color: Colors.white,
                        size: 15,
                      ),
                      radius: 25,
                      lineWidth: 5.0,
                      percent: vote / 10,
                      progressColor: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(0),
              child: ModifiedText(
                text: name ?? 'NOT Loaded',
                color: Colors.white,
                size: 22,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(0),
              child: ModifiedText(
                text: 'Releasing On - $launchon',
                color: Colors.white,
                size: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: ModifiedText(
                text: 'Overview - $description',
                color: Colors.white,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
