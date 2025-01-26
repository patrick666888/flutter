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
            // 开始游戏逻辑
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GameWidget(game: MyGame())),
            );
          },
          child: const Text('开始游戏'),
        ),
      ),
    );
  }
}

class MyGame extends FlameGame {
  late Player player;

  @override
  Future<void> onLoad() async {
    player = Player(); // 创建 Player 实例
    await player.loadSprite(); // 加载精灵
    add(player);
  }

  @override
  void update(double dt) {
    super.update(dt);
    player.update(dt);
  }
}

class Player extends SpriteComponent {
  static const double speed = 200; // 移动速度

  Player() : super(size: Vector2(50, 50), position: Vector2(100, 100));

  Future<void> loadSprite() async {
    // 加载玩家的精灵图像
    sprite = await loadSprite('player.png'); // 确保有这个图像
  }

  void update(double dt) {
    // 处理玩家移动逻辑
    if (joystick.isMoving) {
      position.add(joystick.direction * speed * dt);
    }
  }
}