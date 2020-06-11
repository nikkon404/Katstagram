import 'package:flutter/material.dart';
import 'package:katstagram/model/post.dart';
import 'package:katstagram/pages/feed/direct_message.dart';
import 'package:katstagram/pages/feed/post_tile.dart';
import 'package:katstagram/utils/const.dart';
import 'package:katstagram/utils/data.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<Post> data = getData();

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    Widget storyBuilder() {
      return Expanded(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: <Widget>[
                  Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(data[index].user.dp)),
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Text(data[index].user.uname)
                ],
              ),
            );
          },
        ),
      );
    }

    Widget storyContainer() {
      return Column(
        children: <Widget>[
          Container(
            width: size.width,
            height: size.height * 0.16,
            // color: Colors.red,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Stories",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w800),
                      ),
                      Text(
                        "➤ Watch all",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
                storyBuilder()
              ],
            ),
          ),
          Divider(
            thickness: 1,
          )
        ],
      );
    }

    Widget postBuilder() {
      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          var postdata = data[index];
          return PostTile(post: postdata);
        },
      );
    }

    void onRefresh() async {
      await Future.delayed(Duration(seconds: 2));
      print("inside refresher");
      data.shuffle();
      setState(() {});
      _refreshController.refreshCompleted();
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Hero(
            tag: appName,
            child: Container(
              margin: EdgeInsets.only(top: 8.0),
              child: Image.asset(
                mainLogo,
                scale: 3.5,
              ),
            ),
          ),
          centerTitle: true,
          leading: Icon(Icons.photo_camera, color: Colors.black, size: 30),
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DMPage();
                }));
              },
              child: Container(
                margin: EdgeInsets.only(right: 15),
                child: Icon(Icons.near_me, color: Colors.black, size: 30),
              ),
            )
          ],
        ),

        //  bottomNavigationBar: BottomNavigationBar(items: null),

        body: SmartRefresher(
          controller: _refreshController,
          onRefresh: onRefresh,
          enablePullDown: true,
          header: BezierCircleHeader(
            bezierColor: Colors.white,
            circleColor: Colors.black38,
            dismissType: BezierDismissType.ScaleToCenter,
          ),
          child: ListView(
            shrinkWrap: true,
            addRepaintBoundaries: false,
            addAutomaticKeepAlives: false,
            children: <Widget>[
              storyContainer(),
              postBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
