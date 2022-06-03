import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moviedbtask/models/movie_model.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class MovieDetails extends StatelessWidget {
  MovieDetails({
    Key? key,
    required this.model,
  }) : super(key: key);
  final MovieModel model;
  static String get video => Get.arguments;

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: video,
    params: const YoutubePlayerParams(
      playlist: [], // Defining custom playlist
      startAt: Duration(seconds: 1),
      showControls: true,
      showFullscreenButton: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    // Future<String?> url= fetchVideos(698508);
    // print(url.toString());
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(10.0),
                width: screenWidth,
                height: 400,
                child: YoutubePlayerIFrame(
                  controller: _controller,
                  aspectRatio: 9 / 9,
                ),
              ),
              textDetails("Name", model.originalTitle!),
              textDetails("18+", model.adult.toString().toUpperCase()),
              textDetails("Original Language", model.originalLanguage!),
              textDetails("Popularity", model.popularity.toString()),
              textDetails("Realease Date", model.releaseDate!),
              textDetailsColumn("Over View", model.overview!),
            ],
          ),
        )),
      ),
    );
  }

  Widget textDetails(heading, details) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(heading),
          Text(details),
        ],
      ),
    );
  }

  Widget textDetailsColumn(heading, details) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(alignment: Alignment.centerLeft, child: Text(heading)),
          Text(details),
        ],
      ),
    );
  }
}
