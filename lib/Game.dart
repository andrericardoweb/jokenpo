import 'package:flutter/material.dart';
import 'dart:math';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  var _imageApp = AssetImage("images/empty.png");
  var _message = "Escolha uma opção abaixo";

  void _optionSelected(String chooseUser) {
    var options = ["rock", "paper", "scissor"];
    var optionNumber = Random().nextInt(3);
    var chooseApp = options[optionNumber];

    print("Escolha do App:" + chooseApp);
    print("Escolha do usuario:" + chooseUser);

    //Displays image chosen by the app
    switch (chooseApp) {
      case "rock":
        setState(() {
          this._imageApp = AssetImage("images/rock.png");
        });
        break;
      case "paper":
        setState(() {
          this._imageApp = AssetImage("images/paper.png");
        });
        break;
      case "scissor":
        setState(() {
          this._imageApp = AssetImage("images/scissor.png");
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("JokenPo")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //text
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          //image
          Image(image: this._imageApp),
          //text result
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._message,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _optionSelected("rock"),
                child: Image.asset(
                  "images/rock.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _optionSelected("paper"),
                child: Image.asset(
                  "images/paper.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _optionSelected("scissor"),
                child: Image.asset(
                  "images/scissor.png",
                  height: 100,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
