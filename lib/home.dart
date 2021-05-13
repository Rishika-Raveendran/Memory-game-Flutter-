import 'package:flutter/material.dart';
import 'package:flutter_test_app/models/tile_model.dart';
import 'package:get/get.dart';

import './data/tileData.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    pairs = getPairs();
    pairs.shuffle();
    visiblePairs = pairs;
    //selected = true;
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        visiblePairs = getInitial();
        //selected = false;
      });
    });
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
                  Text("$score/6", style: TextStyle(color: Colors.white)),
                  Text("Number of pairs found",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white)),
                  SizedBox(height: 50),
                  GridView(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        mainAxisSpacing: 0.0, maxCrossAxisExtent: 150),
                    shrinkWrap: true,
                    children: List.generate(visiblePairs.length, (index) {
                      return Tiles(
                        imagePath: visiblePairs[index].getImageAssetPath(),
                        //selected: visiblePairs[index].getIsSelectedVal(),
                        parent: this,
                        tileIndex: index,
                      );
                    }),
                  )
                ])));
  }
}

class Tiles extends StatefulWidget {
  String imagePath;
  bool selected;
  int tileIndex;

  _HomeScreenState parent;
  Tiles({this.imagePath, this.parent, this.tileIndex});

  @override
  _TilesState createState() => _TilesState();
}

class _TilesState extends State<Tiles> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[350],
        margin: EdgeInsets.all(3),
        child: GestureDetector(
            onTap: () {
              noOfTaps = (noOfTaps + 1) % 2;
              print("Taps : $noOfTaps");

              if (noOfTaps == 1) {
                prevIndex = widget.tileIndex;
                prevTile = pairs[widget.tileIndex].getImageAssetPath();
                if (!pairs[widget.tileIndex].getIsSelectedVal()) {
                  setState(() {
                    pairs[widget.tileIndex].setIsSelected(true);
                  });
                }
              } else if (noOfTaps == 0) {
                setState(() {
                  pairs[widget.tileIndex].setIsSelected(true);
                });
                if (prevIndex == widget.tileIndex) {
                  setState(() {
                    pairs[widget.tileIndex].setIsSelected(false);
                  });
                } else if ((prevTile ==
                    pairs[widget.tileIndex].getImageAssetPath())) {
                  print("correct");
                  prevTile = "";
                  if (!visiblePairs[widget.tileIndex].getIsSelectedVal()) {
                    score = score + 1;
                    visiblePairs[widget.tileIndex].setIsSelected(true);
                    visiblePairs[prevIndex].setIsSelected(true);
                    widget.parent.setState(() {});
                  }

                  //set tile to correct and true (set visiblePair selected true and check for both pairs and visible while rendering.)
                } else if ((prevTile !=
                    pairs[widget.tileIndex].getImageAssetPath())) {
                  print("wrong : " + prevTile);

                  Future.delayed(const Duration(seconds: 1), () {
                    pairs[widget.tileIndex].setIsSelected(false);
                    pairs[prevIndex].setIsSelected(false);

                    widget.parent.setState(() {});

                    print("changed ${pairs[prevIndex].getIsSelectedVal()}");
                  });

                  prevTile = "";
                }
              }
            },
            child: Image.asset(
              pairs[widget.tileIndex].getIsSelectedVal()
                  ? pairs[widget.tileIndex].getImageAssetPath()
                  : visiblePairs[widget.tileIndex].getImageAssetPath(),
              fit: BoxFit.cover,
            )));
  }
}

class Question extends StatefulWidget {
  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
