import 'package:flutter/material.dart';
import 'package:meme_sharing/main.dart';
import 'api_class.dart';
import 'package:share/share.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future futureAlbum;
  String shareMeme;
  @override
  void initState() {
    super.initState();
    futureAlbum = getMemeData();
  }

  void _shareContent() {
    Share.share(shareMeme);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Memes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FutureBuilder(
              future: getMemeData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  shareMeme = snapshot.data.ur;
                  return Image(
                    image: NetworkImage(snapshot.data.ur),
                  );
                } else
                  return Text('${snapshot.error}');
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton(
                  onPressed: _shareContent,
                  child: Text('Share'),
                  color: Colors.blue,
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text('Next'),
                  color: Colors.blue,
                ),
              ],
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
