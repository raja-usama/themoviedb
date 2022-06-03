import 'dart:convert';
import 'package:get/get.dart';
import 'package:moviedbtask/models/movie_model.dart';
import 'package:http/http.dart' as http;
import '../constants/urls.dart';
import '../models/movie_video_model.dart';

class HomePageController extends GetxController {
  var movieList = <MovieModel>[].obs;
  var selected=[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchMovies();
    super.onInit();
  }

  void fetchMovies() async {
    try {
      var res = await http
          .get(Uri.parse(Urls.baseUrl + Urls.upComingMovies + Urls.apiKey));
      MovieModel model = MovieModel();
      var decodedString = json.decode(res.body);

      decodedString["results"].forEach((data) {
        model = MovieModel.fromJson(data);
        movieList.add(model);

      });


    } finally {}
  }

  Future<String?> fetchVideos(id) async {
    List<MovieVideoModel> trailerList = [];

    try {
      MovieVideoModel model = MovieVideoModel();

      var res = await http.get(
          Uri.parse(Urls.baseUrl + id.toString() + "/videos" + Urls.apiKey));
      var decodedString = json.decode(res.body);
      decodedString["results"].forEach((data) {
        model = MovieVideoModel.fromJson(data);
        if (model.type == "Trailer") {
          trailerList.add(model);
        }
      });
    } finally {}

    return trailerList[0].key;
  }



}
