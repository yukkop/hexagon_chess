import 'package:flame/components.dart';
import 'package:hexagon_chess/game/cell.dart';

import '../board.dart';
import '../chess.dart';

abstract class Figure extends SpriteComponent {
  Cell cell;
  GameColor color;
  Figure(
      {required this.cell,
      required this.color,
      Sprite? sprite,
      Vector2? size,
      Vector2? position})
      : super(
          sprite: sprite,
          size: size,
          position: position,
        );
  List<Cell> getAvailableCells(Board board);
}
