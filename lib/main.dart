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

  final double characterSize = 100;

  bool turnAway = false;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    final screenWidth = size[0];
    final screenHeight = size[1];
    const textBoxHeight = 200;

    print('screenHeight: $screenHeight // screenWidth: $screenWidth');

    // load background
    add(background
      ..sprite = await loadSprite('background1.png')
      ..size = size);

    print('we will load the game assets here.');

    // load cat1
    cat1
      ..sprite = await loadSprite('cat1.png')
      ..size = Vector2(characterSize, characterSize)
      ..y = screenHeight - characterSize
      ..x = characterSize;
    // ..anchor = Anchor.bottomCenter;
    add(cat1);

    // load cat2
    cat2
      // sprite 설정
      ..sprite = await loadSprite('cat2.png')
      // 크기 설정
      ..size = Vector2(characterSize, characterSize)
      // Y 위치 설정 (화면 맨 아래)
      ..y = screenHeight - characterSize
      // X 위치 설정 (화면 맨 오른쪽)
      ..x = screenWidth / 2 + characterSize
      // Anchor 설정 (오른쪽 위)
      // ..anchor = Anchor.bottomCenter
      // 좌우 반전
      ..flipHorizontally();

    add(cat2);
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (cat1.x < size[1] / 2) {
      cat1.y -= 50 * dt;
      // cat1.x -= 1 * dt;
    } else if (turnAway = false) {
      print('turn away');
      cat2.flipHorizontally();
      turnAway = true;
    }

    if (cat2.x < size[1] / 2 - 100) {
      cat2.y -= 5 * dt;
    }
  }
}
