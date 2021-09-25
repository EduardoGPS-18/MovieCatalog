import 'package:flutter/material.dart';

class MovieScrolling extends StatelessWidget {
  final String title;

  const MovieScrolling({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline6,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Ver mais",
                  style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 18, color: Theme.of(context).colorScheme.secondary),
                ),
              ),
            ],
          ),
        ),
        Container(
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
                    left: 8,
                    right: 8,
                  ),
                  height: 190,
                  width: 134,
                  color: Colors.amber,
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
          ),
        ),
      ],
    );
  }
}
