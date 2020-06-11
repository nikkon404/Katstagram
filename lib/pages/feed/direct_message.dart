import 'package:flutter/material.dart';
import 'package:katstagram/utils/data.dart';

class DMPage extends StatelessWidget {
  var data = getData();
  var lastMsg = [
    'I love you <3',
    'Lets hook up !',
    'Where is the mouse?',
    'Dont leave me on seen',
    'Lets fight the dog!',
    'Sometimes I think I am god',
    'Okay boss',
    '.....',
    'How to use this app?'
        'No one will read this',
    'I met my uncle lion.',
    'I hate you </3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.pop(context)),
        title: Text(
          'Direct Messages',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemCount: data.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: ListTile(
              leading: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  // border: Border.all(),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(data[index].user.dp)),
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  color: Colors.white,
                ),
              ),
              title: Text(data[index].user.fullName),
              subtitle: Text(lastMsg[index]),
              trailing: Icon(Icons.photo_camera, color: Colors.black, size: 25),
            ),
          );
        },
      ),
    );
  }
}
