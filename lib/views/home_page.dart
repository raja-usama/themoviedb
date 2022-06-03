import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviedbtask/controllers/homepage_controller.dart';
import 'package:moviedbtask/views/movie_details.dart';
import 'package:moviedbtask/views/search_view.dart';
import '../widgets/movie_card.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          leading: Obx(() {
            if (controller.selected.isEmpty) {
              return const Text("");
            }
            return GestureDetector(
                onTap: () {
                  controller.selected.clear();
                },
                child: const Icon(Icons.delete));
          }),
          title: Obx(() {
            if (controller.selected.isEmpty) {
              return const Text("Upcoming Movies");
            }
            return Text(controller.selected.length.toString());
          }),
          trailing: GestureDetector(
              onTap: () {
                Get.to(const SearchView(), fullscreenDialog: true);
              },
              child: const Card(child: Icon(Icons.search_outlined))),
        ),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              return GridView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: controller.movieList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 280,
                      crossAxisSpacing: 2.0,
                      mainAxisSpacing: 2.0),
                  itemBuilder: (context, index) {
                    return Obx(
                      () => GestureDetector(
                          onLongPress: () {
                            controller.selected.add(index);
                          },
                          onTap: () async {
                            String? video = await controller
                                .fetchVideos(controller.movieList[index].id);
                            Get.to(
                                () => MovieDetails(
                                      model: controller.movieList[index],
                                    ),
                                arguments: video);
                          },
                          child: controller.selected.contains(index)
                              ? MovieCardSelected(
                                  movie: controller.movieList[index],
                                )
                              : MovieCard(
                                  movie: controller.movieList[index],
                                )),
                    );
                  });
            }),
          ],
        ),
      ),
    );
  }
}
