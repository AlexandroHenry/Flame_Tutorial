import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

void main() {
  print('load the game widgets');

  runApp(GameWidget(game: MyGame()));
}

class MyGame extends FlameGame {
  SpriteComponent cat1 = SpriteComponent();
  SpriteComponent cat2 = SpriteComponent();
  SpriteComponent background = SpriteComponent();

  final double characterSize = 200;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    final screenWidth = size[0];
    final screenHeight = size[1];
    const textBoxHeight = 200;

    // load background
    add(background
      ..sprite = await loadSprite('background1.png')
      ..size = size);

    print('we will load the game assets here.');

    // load cat1
    cat1
      ..sprite = await loadSprite('cat1.png')
      ..size = Vector2(characterSize, characterSize)
      ..y = screenHeight - characterSize - textBoxHeight;
    add(cat1);

    // load cat2
    cat2
      ..sprite = await loadSprite('cat2.png')
      ..size = Vector2(characterSize, characterSize)
      ..y = screenHeight - characterSize - textBoxHeight
      ..x = screenWidth - characterSize;
    add(cat2);
  }
}
