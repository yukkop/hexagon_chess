import 'package:hexagon_chess/game/chess.dart';
import 'package:hexagon_chess/game/figures/figure.dart';

import '../board.dart';
import '../cell.dart';

class NoneFigure extends Figure {
  NoneFigure({required Cell cell})
      : super(
          cell: cell,
          color: GameColor.none,
        );

  @override
  List<Cell> getAvailableCells(Board board) {
    return [];
  }
}
