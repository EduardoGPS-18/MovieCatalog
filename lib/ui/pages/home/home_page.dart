import 'package:cached_network_image_builder/cached_network_image_builder.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../components/home/movie_scrolling.dart';
import '../../config/config.dart';
import 'home.dart';
import 'viewmodel/release_film_viewmodel.dart';

class HomePage extends StatefulWidget {
  final HomePresenter homePresenter;

  const HomePage(
    this.homePresenter, {
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> categories = ["dramas", "arsenal", "ghost-story"];

  @override
  void initState() {
    widget.homePresenter.getReleases();
    widget.homePresenter.getFilmsByCategory(categories[0]);
    widget.homePresenter.getFilmsByCategory(categories[1]);
    widget.homePresenter.getFilmsByCategory(categories[2]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nerdflix"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Lançamento",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ),
                StreamBuilder<List<ReleaseFilmViewModel>>(
                  stream: widget.homePresenter.releasesFilmStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data != null && snapshot.data!.isNotEmpty) {
                      return Column(
                        children: [
                          CarouselSlider.builder(
                            itemCount: snapshot.data!.length,
                            options: CarouselOptions(
                              autoPlay: true,
                              initialPage: 0,
                              height: 400,
                              enlargeCenterPage: true,
                              enlargeStrategy: CenterPageEnlargeStrategy.scale,
                              autoPlayAnimationDuration: const Duration(seconds: 3),
                              autoPlayInterval: const Duration(seconds: 7),
                            ),
                            itemBuilder: (ctx, index, _) => ListView(
                              children: [
                                InkWell(
                                  onTap: () => Navigator.of(context).pushNamed(
                                    AppRoutes.DETAIL_PAGE,
                                    arguments: snapshot.data?[index].id,
                                  ),
                                  child: SizedBox(
                                    child: CachedNetworkImageBuilder(
                                      url: snapshot.data![index].image,
                                      builder: (img) => Image.file(
                                        img,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    height: 316,
                                    width: 216,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Text(
                                    snapshot.data![index].title,
                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w300,
                                        ),
                                  ),
                                ),
                                Text(
                                  (snapshot.data![index].starList.sublist(0, 3)).toString().replaceAll(",", " -").replaceAll(RegExp("\\[|\\]"), ""),
                                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        color: Theme.of(context).primaryColorLight,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          if (widget.homePresenter.filmStream.containsKey(categories[0]))
                            MovieScrolling(
                              category: categories[0],
                              title: "Para você",
                              stream: widget.homePresenter.filmStream[categories[0]]!,
                            ),
                          if (widget.homePresenter.filmStream.containsKey(categories[1]))
                            MovieScrolling(
                              category: categories[1],
                              title: "Arsenal",
                              stream: widget.homePresenter.filmStream[categories[1]]!,
                            ),
                          if (widget.homePresenter.filmStream.containsKey(categories[2]))
                            MovieScrolling(
                              category: categories[2],
                              title: "Historias de fantasma",
                              stream: widget.homePresenter.filmStream[categories[2]]!,
                            ),
                        ],
                      );
                    } else if (snapshot.hasData && snapshot.data!.isEmpty) {
                      return const Center(child: Text("Sem dados!"));
                    }
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[600]!,
                      highlightColor: Colors.grey[900]!,
                      child: Column(
                        children: [
                          CarouselSlider(
                            items: [Container(color: Colors.black12)],
                            options: CarouselOptions(height: 400),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              "***************",
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                          ),
                          const Text("********* - ********** - ********* "),
                          if (widget.homePresenter.filmStream.containsKey(categories[0]))
                            MovieScrolling(
                              category: categories[0],
                              title: "***********",
                              stream: null,
                              activeButton: false,
                            ),
                          if (widget.homePresenter.filmStream.containsKey(categories[1]))
                            MovieScrolling(
                              activeButton: false,
                              category: categories[1],
                              title: "*******",
                              stream: null,
                            ),
                          if (widget.homePresenter.filmStream.containsKey(categories[2]))
                            MovieScrolling(
                              category: categories[2],
                              title: "**************",
                              activeButton: false,
                              stream: null,
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
