import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flame/components.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 開始遊戲邏輯
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GameWidget(game: MyGame())),
            );
          },
          child: Text('開始遊戲'),
        ),
      ),
    );
  }
}

class MyGame extends FlameGame {
  late Player player;

  @override
  Future<void> onLoad() async {
    player = Player();
    add(player);
  }

  @override
  void update(double dt) {
    super.update(dt);
    player.update(dt);
  }
}

class Player extends SpriteComponent {
  static const double speed = 200; // 移動速度

  Player() {
    // 將玩家的精靈設置為一個圖像
    sprite = await loadSprite('player.png'); // 確保有這個圖像
    size = Vector2(50, 50);
    position = Vector2(100, 100);
  }

  void update(double dt) {
    // 處理玩家移動邏輯
    if (joystick.isMoving) {
      position.add(joystick.direction * speed * dt);
    }
  }
}