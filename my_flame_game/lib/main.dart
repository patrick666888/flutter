import 'package:flutter/material.dart';
import 'game.dart'; // 确保这个文件中定义了 MyGame 类

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainMenu(), // 设置主菜单为主页
    );
  }
}

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('主菜单'), // 设置标题
      ),
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