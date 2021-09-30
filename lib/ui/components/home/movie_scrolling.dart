import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../config/config.dart';
import '../../pages/home/viewmodel/viewmodel.dart';

class MovieScrolling extends StatelessWidget {
  final String title;
  final String category;
  final bool activeButton;
  final Stream<List<HomeFilmViewModel>>? stream;

  const MovieScrolling({
    Key? key,
    required this.title,
    required this.category,
    this.activeButton = true,
    this.stream,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline6,
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pushNamed(
                  AppRoutes.VIEW_MORE_PAGE,
                  arguments: category,
                ),
                child: Text(
                  "Ver mais",
                  style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 18, color: Theme.of(context).colorScheme.secondary),
                ),
              ),
            ],
          ),
        ),
        StreamBuilder<List<HomeFilmViewModel>>(
          stream: stream,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return Container(
                margin: const EdgeInsets.only(bottom: 24),
                height: 230,
                child: ListView.builder(
                  itemCount: min(snapshot.data!.length, 10),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () => Navigator.of(context).pushNamed(
                          AppRoutes.DETAIL_PAGE,
                          arguments: snapshot.data![index].id,
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(
                            left: 18,
                            right: 18,
                          ),
                          height: 190,
                          width: 134,
                          child: CachedNetworkImage(
                            imageUrl: snapshot.data![index].image,
                            imageBuilder: (ctx, imgProvider) {
                              return Image(
                                image: imgProvider,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                      ),
                      Container(
                        width: 134,
                        child: Text(
                          snapshot.data![index].title,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 14),
                        ),
                        margin: const EdgeInsets.only(left: 18, right: 18, top: 12),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Shimmer.fromColors(
              baseColor: Colors.grey[600]!,
              highlightColor: Colors.grey[900]!,
              child: Container(
                color: Colors.black26,
                margin: const EdgeInsets.only(bottom: 24),
                height: 230,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          left: 18,
                          right: 18,
                        ),
                        height: 190,
                        width: 134,
                      ),
                      Container(
                        width: 134,
                        child: Text(
                          "******************",
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 14),
                        ),
                        margin: const EdgeInsets.only(left: 18, right: 18, top: 12),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
