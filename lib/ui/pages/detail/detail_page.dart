import 'package:flutter/material.dart';

import '../../components/detail/detail.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes do filme"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
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
                      "O predestinado",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                    ),
                  ),
                  Text(
                    "Ethan Hawke - Sarah Snook - Noah Taylor",
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
                      "Asauhd asUHdaush asuhdhahusd huauh dausgd aushd asud hasuhd asdu haud ahsudh ausd has dhuasud hasu dhuashd uashduas dhuahsd uhuasdhuua hsudhah sdh ash duau shuas dhuash du asdu hasd hushau d ",
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 14),
                    ),
                    margin: const EdgeInsets.only(left: 8, right: 8, top: 12, bottom: 18),
                  ),
                  const Divider(),
                  const TitleDetail(title: "Elenco", margin: EdgeInsets.only(left: 8, right: 8, top: 12, bottom: 18)),
                  Container(
                    height: 144,
                    margin: const EdgeInsets.only(bottom: 24),
                    child: ListView.separated(
                      itemBuilder: (context, index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            minRadius: 54,
                            backgroundColor: Colors.amber,
                          ),
                          Container(
                            child: Text(
                              "Teste",
                              style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 18),
                            ),
                            margin: const EdgeInsets.only(left: 8, right: 8, top: 12),
                          ),
                        ],
                      ),
                      itemCount: 3,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 24,
                      ),
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
}
