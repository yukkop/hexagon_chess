import 'package:flame/components.dart';
import 'package:hexagon_chess/core/constants.dart';
import 'package:hexagon_chess/game/assets_store.dart';
import 'package:hexagon_chess/game/figures/figure.dart';

import '../board.dart';
import '../cell.dart';
import '../chess.dart';

class Pawn extends Figure {
  Pawn({required Cell cell, required GameColor color})
      : super(
          cell: cell,
          color: color,
          size: Vector2.all(pawnsSize),
          position: Vector2.all(hexSize / 2 - pawnsSize / 2),
          sprite: color == GameColor.white
              ? Sprite(AssetsStore.whitePawnImage)
              : Sprite(AssetsStore.blackPawnImage),
        );

  @override
  List<Cell> getAvailableCells(Board board) {
    return [];
  }
}
