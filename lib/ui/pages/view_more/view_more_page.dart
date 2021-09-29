import 'package:cached_network_image_builder/cached_network_image_builder.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../config/config.dart';
import '../pages.dart';

class ViewMorePage extends StatelessWidget {
  final ViewMorePresenter presenter;
  const ViewMorePage(this.presenter, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String category = ModalRoute.of(context)?.settings.arguments as String;
    presenter.getFilmsByCategory(category);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nerdflix"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                category.replaceFirst(category[0], category[0].toUpperCase()),
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: StreamBuilder<List<FilmViewModel>>(
                stream: presenter.filmsStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null && snapshot.data!.isNotEmpty) {
                    return GridView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: snapshot.data?.length ?? 0,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 350,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                      ),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () => Navigator.of(context).pushNamed(
                          AppRoutes.DETAIL_PAGE,
                          arguments: snapshot.data?[index].id,
                        ),
                        child: Column(
                          children: [
                            CachedNetworkImageBuilder(
                              url: snapshot.data?[index].image ?? "",
                              builder: (image) => Image.file(
                                image,
                                fit: BoxFit.fill,
                              ),
                              errorWidget: Container(),
                            ),
                            Text(snapshot.data?[index].title ?? "Sem titulo"),
                          ],
                        ),
                      ),
                    );
                  }
                  return Shimmer.fromColors(
                    baseColor: Colors.grey[600]!,
                    highlightColor: Colors.grey[900]!,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: GridView.builder(
                        addSemanticIndexes: true,
                        semanticChildCount: 20,
                        cacheExtent: 200,
                        addAutomaticKeepAlives: false,
                        itemCount: 10,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15, mainAxisExtent: 350),
                        itemBuilder: (context, index) => Container(
                          height: 333,
                          width: 164,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
