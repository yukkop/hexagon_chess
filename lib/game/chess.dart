import 'package:flame/experimental.dart';
import 'package:flame/game.dart';

import 'board.dart';

class Chess extends FlameGame with HasTappableComponents {
  Board board = Board();
  Future<void> onLoad() async {
    add(Board(Vector2(100, 200)));
  }
}

enum GameColor {
  black,
  white,
  none,
}
