import 'package:flutter/material.dart';

class TopMenus extends StatefulWidget {
  const TopMenus({Key? key}) : super(key: key);

  @override
  State<TopMenus> createState() => _TopMenusState();
}

class _TopMenusState extends State<TopMenus> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          TopMenuTiles(
            name: "Honda",
            imageUrl: "Hondas",
            slug: "",
          ),
          TopMenuTiles(name: "Corolla", imageUrl: "corolla", slug: ""),
          TopMenuTiles(name: "Suzuki", imageUrl: "suzu", slug: ""),
          TopMenuTiles(name: "KIA", imageUrl: "kia", slug: ""),
          TopMenuTiles(name: "BMW", imageUrl: "bmw", slug: ""),
        ],
      ),
    );
  }
}

class TopMenuTiles extends StatelessWidget {
  String name;
  String imageUrl;
  String slug;

  TopMenuTiles(
      {Key? key,
      required this.name,
      required this.imageUrl,
      required this.slug})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: <Widget>[
          Container(
            padding:
                const EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
            child: Card(
                color: Colors.white,
                elevation: 0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(3.0),
                  ),
                ),
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Center(
                      child: Image.asset(
                    "assets/$imageUrl.jpg",
                    width: 100,
                    height: 100,
                  )),
                )),
          ),
          Text(name,
              style: const TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
