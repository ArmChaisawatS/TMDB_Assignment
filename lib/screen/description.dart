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
    dynamic getvote = vote * 10;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.all(0),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(0),
              child: Stack(
                children: [
                  Positioned(
                    child: Opacity(
                      opacity: 0.5,
                      child: Image.network(
                        bannerurl,
                        fit: BoxFit.fitHeight,
                        height: 650,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 90,
                    top: 30,
                    child: Container(
                      padding: EdgeInsets.zero,
                      height: 350,
                      width: 235,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: NetworkImage(posterurl),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 255,
                    left: 110,
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.black,
                      ),
                      padding: const EdgeInsets.all(0),
                      child: CircularPercentIndicator(
                        animation: true,
                        animationDuration: 1000,
                        backgroundColor: Colors.white,
                        center: ModifiedText(
                          text: '${getvote.toStringAsFixed(0)}%',
                          color: Colors.white,
                          size: 16,
                          textAlign: TextAlign.center,
                        ),
                        radius: 18,
                        lineWidth: 3.0,
                        percent: vote / 10,
                        progressColor: Colors.green,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 400,
                    child: Row(
                      children: [
                        ModifiedText(
                          text: name ?? 'NOT Loaded',
                          color: Colors.white,
                          size: 22,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 430,
                    child: Row(
                      children: [
                        ModifiedText(
                          text: 'Releasing On - $launchon',
                          color: Colors.white,
                          size: 16,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  const Positioned(
                    top: 460,
                    child: ModifiedText(
                      text: 'Overview',
                      color: Colors.white,
                      size: 24,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Positioned(
                    top: 490,
                    child: Container(
                      width: 400,
                      padding: EdgeInsets.zero,
                      child: ModifiedText(
                        text: '$description',
                        color: Colors.white,
                        size: 18,
                        textAlign: TextAlign.start,
                      ),
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
