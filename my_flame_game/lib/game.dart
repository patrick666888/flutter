import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart'; // 添加 joystick 所需的包

class MyGame extends FlameGame with HasDraggables, HasTappables { // 使用 HasDraggables 和 HasTappables
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
    player.update(dt); // 移除 joystick 参数
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
    // 这里可以处理其他更新逻辑
  }
}