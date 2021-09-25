import 'package:flutter/material.dart';

import '../../components/home/movie_scrolling.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  height: 316,
                  width: 216,
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
                const MovieScrolling(title: "Para você"),
                const MovieScrolling(title: "Ação"),
                const MovieScrolling(title: "Drama"),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
