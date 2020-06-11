import 'package:flutter/material.dart';
import 'package:katstagram/utils/data.dart';

class Profile extends StatelessWidget {
  final profileUser;
  final data = getData();
  final isDefaultUser;

  Profile({@required this.profileUser, this.isDefaultUser = false});
  @override
  Widget build(BuildContext context) {
    data.shuffle();
    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: IconThemeData(color: Colors.black),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          profileUser.uname,
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {})
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(
            height: 22,
          ),
          topTile(),
          nameBio(),
          viewSwichButtons(),
          postsGrid()
        ],
      ),
    );
  }

  Padding topTile() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Container(
          alignment: Alignment.bottomCenter,
          width: 60.0,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(profileUser.dp)),
            borderRadius: BorderRadius.all(Radius.circular(90.0)),
            color: Colors.white,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  '12',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                ),
                Text(
                  'posts',
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  '985',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                ),
                Text(
                  'followers',
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  '46',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                ),
                Text(
                  'following',
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
              ],
            )
          ],
        ),
        subtitle: MaterialButton(
          child: Text(
            isDefaultUser ? "Edit Profile" : "Follow",
            style:
                TextStyle(color: isDefaultUser ? Colors.black : Colors.white),
          ),
          onPressed: () {},
          color: isDefaultUser ? Colors.white : Colors.blue,
        ),
      ),
    );
  }

  Padding viewSwichButtons() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
              icon: Icon(
                Icons.grid_on,
                size: 30,
              ),
              onPressed: null),
          IconButton(
              icon: Icon(
                Icons.view_list,
                size: 30,
              ),
              onPressed: null),
          IconButton(
              icon: Icon(
                Icons.portrait,
                size: 30,
              ),
              onPressed: null),
        ],
      ),
    );
  }

  GridView postsGrid() {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: data.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.all(1),
              child: Container(
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                          image: new NetworkImage(data[index].img),
                          fit: BoxFit.cover))));
        });
  }

  Padding nameBio() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            profileUser.fullName,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          Text(
            "Want to learn a few Instagram bio tricks to make your bio design pop? Here are four of the most popular ones :",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
