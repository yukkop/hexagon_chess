import 'package:flame/components.dart';
import 'package:hexagon_chess/core/constants.dart';
import 'package:hexagon_chess/game/assets_store.dart';
import 'package:hexagon_chess/game/figures/figure.dart';
import 'package:hexagon_chess/game/figures/none_figure.dart';

import '../board.dart';
import '../cell.dart';
import '../chess.dart';

class Pawn extends Figure {
  Pawn({required Cell cell, required GameColor color})
      : super(
          cell: cell,
          color: color,
          size: pawnsSize,
          position: Vector2(hexSpriteSize / 2, hexSpriteSize / 2),
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
    int frontAttackRow = 0;
    bool inHome = false; //pawn in his own half field
    if (color == GameColor.white) {
      targetRow = position.y.toInt() + 1;
      frontAttackRow = targetRow + 1;
      if (position.y < 6) {
        inHome = true;
      }
    } else {
      targetRow = position.y.toInt() - 1;
      frontAttackRow = targetRow - 1;
      if (position.y > 6) {
        inHome = true;
      }
    }
    if (targetRow > -1 && targetRow < 13) {
      List<Cell> moveArray = [];
      if (cell.positionOnTheBoard.x > -1 &&
          cell.positionOnTheBoard.x < board.cells[targetRow].length) {
        moveArray
            .add(board.cells[targetRow][cell.positionOnTheBoard.x.toInt()]);
      }
      if (cell.positionOnTheBoard.x + (inHome ? 1 : -1) > -1 &&
          cell.positionOnTheBoard.x + (inHome ? 1 : -1) <
              board.cells[targetRow].length + 1) {
        moveArray.add(board.cells[targetRow]
            [cell.positionOnTheBoard.x.toInt() + (inHome ? 1 : -1)]);
      }
      List<Cell> attackArray = [];
      if (frontAttackRow > -1 && frontAttackRow < 13) {
        if ((cell.positionOnTheBoard.y.toInt() == 5 ||
                cell.positionOnTheBoard.y.toInt() == 7) &&
            inHome) {
          attackArray.add(
              board.cells[frontAttackRow][cell.positionOnTheBoard.x.toInt()]);
        } else {
          if (cell.positionOnTheBoard.y.toInt() != 6 && inHome) {
            attackArray.add(board.cells[frontAttackRow]
                [cell.positionOnTheBoard.x.toInt() + (inHome ? 1 : -1)]);
          }
        }
      }
      if (cell.positionOnTheBoard.x.toInt() - (inHome ? 1 : 2) > -1) {
        attackArray.add(board.cells[targetRow]
            [cell.positionOnTheBoard.x.toInt() - (inHome ? 1 : 2)]);
      }
      if (cell.positionOnTheBoard.x.toInt() + (inHome ? 2 : 1) <
          board.cells[targetRow].length) {
        attackArray.add(board.cells[targetRow]
            [cell.positionOnTheBoard.x.toInt() + (inHome ? 2 : 1)]);
      }
      result.addAll(moveArray.where((element) => element.figure is NoneFigure));
      result.addAll(attackArray.where((element) =>
          element.figure is! NoneFigure && element.figure.color != color));
    }

    return result;
  }

  //TODO create transformation in another piece
}
