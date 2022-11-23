import 'package:flame/experimental.dart';
import 'package:flame/game.dart';

import 'board.dart';
import 'assets_store.dart';

class Chess extends FlameGame with HasTappableComponents {
  Board board = Board();
  @override
  Future<void> onLoad() async {
    await AssetsStore.loadImages();
    add(board);
    board.placePieces();
  }
}

enum GameColor {
  black,
  white,
  none,
}
