import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'main.dart';
import 'memes.dart';
import 'api_class.dart';

String memeType;

class chooseMeme extends StatefulWidget {
  @override
  _chooseMemeState createState() => _chooseMemeState();
}

class _chooseMemeState extends State<chooseMeme> {
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  memeType = 'dankmemes';
                  if (Album == null) {
                    setState(() {
                      showSpinner = true;
                    });
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                    setState(() {
                      showSpinner = false;
                    });
                  }
                },
                child: Text(
                  'dankmemes',
                ),
                color: Colors.blue,
              ),
              FlatButton(
                onPressed: () {
                  memeType = 'wholesomememes';
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                },
                child: Text(
                  'memes',
                ),
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
