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
          size: pawnsSize,
          position: Vector2(
              hexSize / 2 - pawnsSize.x / 2, hexSize / 2 - pawnsSize.y / 2),
          sprite: color == GameColor.white
              ? Sprite(AssetsStore.whitePawnImage)
              : Sprite(AssetsStore.blackPawnImage),
        );

  @override
  copy({Cell? newCell}) {
    return Pawn(cell: newCell ?? cell, color: color);
  }

  @override
  List<Cell> getAvailableCells(Board board) {
    List<Cell> result = [];
    var position = cell.positionOnTheBoard;
    int targetRow = 0;
    bool inHome = false; //pawn in his own half field
    if (color == GameColor.white) {
      targetRow = position.y.toInt() + 1;
      if (position.y < 6) {
        inHome = true;
      }
    } else {
      targetRow = position.y.toInt() - 1;
      if (position.y > 6) {
        inHome = true;
      }
    }
    if (targetRow > -1 && targetRow < 13) {
      if (inHome) {
        result.addAll([
          board.cells[targetRow][cell.positionOnTheBoard.x.toInt()],
          board.cells[targetRow][cell.positionOnTheBoard.x.toInt() + 1],
        ]);
      } else {
        result.add(board.cells[targetRow][cell.positionOnTheBoard.x.toInt()]);
        if (cell.positionOnTheBoard.x != 0) {
          result.add(
              board.cells[targetRow][cell.positionOnTheBoard.x.toInt() - 1]);
        }
      }
    }

    return result;
  }

  //TODO create transformation in another piece
}
