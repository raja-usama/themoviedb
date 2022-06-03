import 'package:flutter/material.dart';
import 'package:moviedbtask/constants/text_styles.dart';
import 'package:moviedbtask/models/movie_model.dart';
import '../constants/urls.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key? key,
    required this.movie,
  }) : super(key: key);
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        decoration: const BoxDecoration(color: Colors.amber),
        height: 250,
        width: 150,
        child: Column(
          children: [
            Image.network(
              Urls.imageBase + movie.posterPath!,
              height: 200,
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.only(top: 10),
              child: Text(
                movie.originalTitle.toString(),
                style: subHeading(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MovieCardSelected extends StatelessWidget {
  const MovieCardSelected({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        decoration: const BoxDecoration(color: Colors.amber),
        height: 250,
        width: 150,
        child: Stack(
          children: [
            Image.network(
              Urls.imageBase + movie.posterPath!,
              height: 200,
            ),
            Positioned(
              top: 210,
              left: 10,
              child: Container(
                height: 50,
                margin: const EdgeInsets.only(top: 10),
                child: Text(
                  movie.originalTitle.toString(),
                  style: subHeading(),
                ),
              ),
            ),
            Container(
              width: 150,
              height: 310,
              color: Colors.black12,
              child: const Icon(
                Icons.check_box,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
