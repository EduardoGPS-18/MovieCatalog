import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:staggered_grid_view_flutter/rendering/sliver_staggered_grid.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../../config/config.dart';
import 'view_more.dart';

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
              child: StreamBuilder<List<ViewMoreFilmViewModel>>(
                stream: presenter.filmsStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null && snapshot.data!.isNotEmpty) {
                    return StaggeredGridView.builder(
                      padding: const EdgeInsets.all(20),
                      gridDelegate: SliverStaggeredGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () => Navigator.of(context).pushNamed(
                          AppRoutes.DETAIL_PAGE,
                          arguments: snapshot.data?[index].id,
                        ),
                        child: Column(
                          children: [
                            CachedNetworkImage(
                              imageUrl: snapshot.data?[index].image ?? "",
                              imageBuilder: (ctx, imageProvider) => Image(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: Colors.grey[600]!,
                                highlightColor: Colors.grey[900]!,
                                child: Container(
                                  color: Colors.black12,
                                  height: 300,
                                  width: 180,
                                ),
                              ),
                              errorWidget: (ctx, url, err) => Container(
                                color: Colors.black12,
                                height: 300,
                                width: 200,
                              ),
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
                        itemCount: 10,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          mainAxisExtent: 300,
                        ),
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
