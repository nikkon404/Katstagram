import 'package:flutter/material.dart';
import 'package:katstagram/utils/data.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  final data = getData();

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    void onRefresh() async {
      await Future.delayed(Duration(seconds: 2));
      print("inside refresher");
      data.shuffle();
      setState(() {});
      _refreshController.refreshCompleted();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Activity',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: onRefresh,
        enablePullDown: true,
        header: BezierCircleHeader(
          bezierColor: Colors.white,
          circleColor: Colors.black38,
          dismissType: BezierDismissType.ScaleToCenter,
        ),
        child: ListView.builder(
          itemCount: data.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            var isFollowing = index % 3 == 0;
            return Padding(
              padding:  EdgeInsets.all(7.0),
              child: ListTile(
                leading: Container(
                  width: 54.0,
                  height: 54.0,
                  decoration: BoxDecoration(
                    // border: Border.all(),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(data[index].user.dp)),
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    color: Colors.white,
                  ),
                ),
                title: RichText(
                  text: TextSpan(
                      text: data[index].user.uname,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w700),
                      children: <TextSpan>[
                        TextSpan(
                          text:  isFollowing? ' started following you': ' liked your photo',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 13,
                          ),
                        ),
                        TextSpan(
                          text: ' ' + '- 25s',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 13,
                          ),
                        )
                      ]),
                ),
                trailing: isFollowing
                    ? Container(
                        height: 28,
                        width: 70,
                        child: MaterialButton(
                          child: Text(
                            "Follow",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {},
                          color: Colors.blue,
                        ),
                      )
                    : SizedBox(
                        height: 50,
                        width: 50,
                        child: Image.network(
                          data[index].img,
                          fit: BoxFit.cover,
                        )),
              ),
            );
          },
        ),
      ),
    );
  }
}
