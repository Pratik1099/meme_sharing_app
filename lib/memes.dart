import 'package:flutter/material.dart';
import 'api_class.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = getMemeData();
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
                  return Text('nhnhnh');
                  // return Image(
                  //   image: NetworkImage(snapshot.data.ur),
                  // );
                } else
                  return Text('${snapshot.error}');
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton(
                  onPressed: () {},
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
