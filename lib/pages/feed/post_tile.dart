import 'package:flutter/material.dart';
import 'package:katstagram/model/post.dart';
import 'package:katstagram/pages/profile/profile_page.dart';

class PostTile extends StatefulWidget {
  const PostTile({
    Key key,
    @required this.post,
  }) : super(key: key);

  final Post post;

  @override
  _PostTileState createState() => _PostTileState();
}

class _PostTileState extends State<PostTile> {
  @override
  Widget build(BuildContext context) {
    likePost() {
      setState(() {
        widget.post.liked = !widget.post.liked;
      });
    }

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(9.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Profile(profileUser: widget.post.user);
                      }));
                    },
                    child: Container(
                      width: 32.0,
                      height: 32.0,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(widget.post.user.dp)),
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(widget.post.user.uname,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              Icon(Icons.more_horiz)
            ],
          ),
        ),
        GestureDetector(
          child: Image(
            image: NetworkImage(widget.post.img),
          ),
          onDoubleTap: () {
            likePost();
          },
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buttonRow(likePost),
              SizedBox(height: 12),
              Text(
                '12,345 likes',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              RichText(
                text: TextSpan(
                    text: widget.post.user.uname,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w600),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' ' + widget.post.caption,
                        style: TextStyle(fontWeight: FontWeight.normal),
                      )
                    ]),
              ),
              SizedBox(height: 5),
              Text(
                'View all 128 comments',
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
            ],
          ),
        )
      ],
    );
  }

  Row buttonRow(likePost()) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                likePost();
              },
              child: widget.post.liked
                  ? Icon(Icons.favorite, color: Colors.red)
                  : Icon(
                      Icons.favorite_border,
                    ),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.chat_bubble_outline,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.near_me,
            ),
          ],
        ),
        Icon(
          Icons.bookmark_border,
        ),
      ],
    );
  }
}
