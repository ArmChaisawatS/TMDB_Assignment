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
      body: ListView(
        children: [
          Container(
            height: 1000,
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
                  top: 460,
                  left: 20,
                  child: Container(
                    height: 40,
                    width: 40,
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
                        textAlign: TextAlign.start,
                      ),
                      radius: 18,
                      lineWidth: 2.0,
                      percent: vote / 10,
                      progressColor: Colors.green,
                    ),
                  ),
                ),
                Positioned(
                  width: 400,
                  top: 390,
                  child: Container(
                    padding: const EdgeInsets.all(0),
                    child: ModifiedText(
                      text: name ?? 'NOT Loaded',
                      color: Colors.white,
                      size: 22,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Positioned(
                  left: 110,
                  top: 420,
                  child: Container(
                    padding: const EdgeInsets.all(0),
                    child: ModifiedText(
                      text: 'Releasing On - $launchon',
                      color: Colors.white,
                      size: 16,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                const Positioned(
                  left: 12,
                  top: 500,
                  child: ModifiedText(
                    text: 'Overview',
                    color: Colors.white,
                    size: 24,
                    textAlign: TextAlign.start,
                  ),
                ),
                Positioned(
                  top: 530,
                  child: Container(
                    width: 400,
                    padding: const EdgeInsets.all(12),
                    child: ModifiedText(
                      text: '${description*2}',
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
    );
  }
}
