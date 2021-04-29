import 'package:flutter/material.dart';
import 'package:flutter_test_app/models/tile_model.dart';
import 'package:get/get.dart';

import './data/tileData.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<tileModel> pairs = new List<tileModel>();

  @override
  void initState() {
    super.initState();

    pairs = getPairs();
    pairs.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(35, 70, 35, 35),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("0/8", style: TextStyle(color: Colors.white)),
                  Text("Number of pairs found",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white)),
                  SizedBox(height: 50),
                  GridView(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        mainAxisSpacing: 0.0, maxCrossAxisExtent: 150),
                    shrinkWrap: true,
                    children: List.generate(pairs.length, (index) {
                      return Tiles(
                        imagePath: pairs[index].getImageAssetPath(),
                        selected: pairs[index].getIsSelectedVal(),
                        parent: this,
                      );
                    }),
                  )
                ])));
  }
}

class Tiles extends StatefulWidget {
  String imagePath;
  bool selected;

  _HomeScreenState parent;
  Tiles({this.imagePath, this.selected, this.parent});

  @override
  _TilesState createState() => _TilesState();
}

class _TilesState extends State<Tiles> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3),
      child: Image.asset(
        widget.imagePath,
        fit: BoxFit.contain,
      ),
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(0)),
          border: Border.all(color: Colors.lightGreenAccent)),
    );
  }
}
