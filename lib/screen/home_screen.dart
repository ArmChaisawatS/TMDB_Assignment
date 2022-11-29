import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:tmdb_application/utils/text.dart';
import 'package:tmdb_application/widget/popular_movies.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List popularmovies = [];
  final String apikey = 'cb84c4ebc8ff302495dc57a1d34c2c25';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjYjg0YzRlYmM4ZmYzMDI0OTVkYzU3YTFkMzRjMmMyNSIsInN1YiI6IjYzODQzNGUzYjMzMTZiMDA3YmRmMDk5YyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.kfjMOYj-IaoyKp7RgtnK_Acr0jzVt0n-2X-Ldrkxu_k';
  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    final tmdbWitCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: const ConfigLogger(
        showErrorLogs: true,
        showLogs: true,
      ),
    );
    Map popularResult = await tmdbWitCustomLogs.v3.movies.getPopular();
    setState(() {
      popularmovies = popularResult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Container(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            'assets/images/svglogo.svg',
            height: 20,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const ModifiedText(
              text: 'The Popular Movies',
              color: Colors.black,
              size: 26,
            ),
            PopularMovies(popular: popularmovies),
          ],
        ),
      ),
    );
  }
}
