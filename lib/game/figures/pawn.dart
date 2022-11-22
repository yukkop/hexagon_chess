import 'package:hexagon_chess/game/figures/figure.dart';

import '../board.dart';
import '../cell.dart';
import '../chess.dart';

class Pawn extends Figure {
  Pawn({required Cell cell, required GameColor color})
      : super(cell: cell, color: color);

  @override
  List<Cell> getAvailableCells(Board board) {
    return [];
  }
}
