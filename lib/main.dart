import 'package:flutter/material.dart';
import 'package:flame/game.dart';

void main() {
  print('run all the code in main');

  runApp(GameWidget(game: MyGame()));
}

class MyGame extends FlameGame {}
