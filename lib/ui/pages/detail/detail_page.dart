import 'package:cached_network_image_builder/cached_network_image_builder.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../components/detail/detail.dart';
import 'detail.dart';
import 'detail_presenter.dart';

class DetailPage extends StatelessWidget {
  final DetailPresenter presenter;
  const DetailPage(this.presenter, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final String filmId = ModalRoute.of(context)?.settings.arguments as String;
    presenter.loadFilmInformation(filmId: filmId);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes do filme"),
        centerTitle: true,
        elevation: 0,
      ),
      body: StreamBuilder<FilmDetailViewModel>(
        stream: presenter.streamDetail,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return SafeArea(
              child: SizedBox.expand(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8 * 6),
                    child: Column(
                      children: [
                        Container(
                          width: 182,
                          height: 266,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: CachedNetworkImageBuilder(
                            url: snapshot.data?.image ?? "",
                            placeHolder: Shimmer.fromColors(
                              child: Container(
                                color: Colors.black26,
                              ),
                              baseColor: Colors.grey[600]!,
                              highlightColor: Colors.grey[900]!,
                            ),
                            builder: (image) => Image.file(
                              image,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            snapshot.data?.title ?? "",
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                ),
                          ),
                        ),
                        Text(
                          snapshot.data!.actorList.length > 3
                              ? (snapshot.data!.actorList.sublist(0, 3).map((e) => e.name)).toString().replaceAll(",", " -").replaceAll(RegExp("\\(|\\)"), "")
                              : snapshot.data!.actorList.map((e) => e.name).toString().replaceAll(",", " -").replaceAll(RegExp("\\(|\\)"), ""),
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Theme.of(context).primaryColorLight,
                              ),
                        ),
                        const SizedBox(
                          height: 26,
                        ),
                        const Divider(),
                        const TitleDetail(
                          title: "Sinopse",
                          margin: EdgeInsets.only(left: 8, right: 8, top: 12),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          alignment: Alignment.topLeft,
                          child: Text(
                            snapshot.data?.synopsis ?? "",
                            textAlign: TextAlign.justify,
                            style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 14),
                          ),
                          margin: const EdgeInsets.only(left: 8, right: 8, top: 12, bottom: 18),
                        ),
                        const Divider(),
                        TitleDetail(
                          title: "Elenco",
                          margin: EdgeInsets.only(
                            left: screenSize.width * 2 / 100,
                            right: 8,
                            top: 12,
                            bottom: 18,
                          ),
                        ),
                        SizedBox(
                          height: 54 * 2 + screenSize.height * 8 / 100,
                          child: ListView.builder(
                            itemBuilder: (context, index) => Row(
                              children: [
                                const SizedBox(
                                  width: 8,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CachedNetworkImageBuilder(
                                      url: snapshot.data!.actorList[index].image,
                                      placeHolder: Shimmer.fromColors(
                                        baseColor: Colors.grey[600]!,
                                        highlightColor: Colors.grey[900]!,
                                        child: const CircleAvatar(
                                          backgroundColor: Colors.black12,
                                          radius: 54,
                                        ),
                                      ),
                                      builder: (image) => Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                        child: Column(
                                          children: [
                                            CircleAvatar(
                                              backgroundImage: Image.file(image).image,
                                              radius: 54,
                                            ),
                                            Text(
                                              snapshot.data?.actorList[index].name ?? "",
                                              style: Theme.of(context).textTheme.headline6?.copyWith(
                                                    fontSize: 16,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenSize.width * 2 / 100,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            itemCount: snapshot.data?.actorList.length ?? 0,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Shimmer.fromColors(
              baseColor: Colors.grey[600]!,
              highlightColor: Colors.grey[900]!,
              child: SafeArea(
                child: SizedBox.expand(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8 * 6),
                      child: Column(
                        children: [
                          Container(
                            width: 182,
                            height: 266,
                            decoration: const BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              "***********************",
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                          ),
                          Text(
                            "*********** **************** *********",
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: Theme.of(context).primaryColorLight,
                                ),
                          ),
                          const SizedBox(
                            height: 26,
                          ),
                          const Divider(),
                          const TitleDetail(title: "Sinopse", margin: EdgeInsets.only(left: 8, right: 8, top: 12)),
                          Container(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            alignment: Alignment.topLeft,
                            child: Text(
                              "*********** ************* ********* * * * ** ************* *********** **  ********************* ******************* * * ******************************** * *** ** * ** *** **** *** ** * ** * ",
                              textAlign: TextAlign.justify,
                              style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 14),
                            ),
                            margin: const EdgeInsets.only(left: 8, right: 8, top: 12, bottom: 18),
                          ),
                          const Divider(),
                          TitleDetail(
                            title: "Elenco",
                            margin: EdgeInsets.only(
                              left: screenSize.width * 2 / 100,
                              right: 8,
                              top: 12,
                              bottom: 18,
                            ),
                          ),
                          SizedBox(
                            height: 54 * 2 + screenSize.height * 8 / 100,
                            child: ListView.builder(
                              itemBuilder: (context, index) => Row(
                                children: [
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const CircleAvatar(
                                        radius: 54,
                                        backgroundColor: Colors.amber,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: screenSize.height * 2 / 100),
                                        child: Text(
                                          "*********",
                                          style: Theme.of(context).textTheme.headline6?.copyWith(
                                                fontSize: 18,
                                              ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: screenSize.width * 2 / 100,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              itemCount: 5,
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
