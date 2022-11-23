import '../board.dart';
import '../cell.dart';
import '../chess.dart';
import 'figure.dart';

class Knight extends Figure {
  Knight({required Cell cell, required GameColor color})
      : super(cell: cell, color: color);

  @override
  copy({Cell? newCell}) {
    return Knight(cell: cell, color: color);
  }

  @override
  List<Cell> getAvailableCells(Board board) {
    //TODO realisation alghorithm

    return [];
  }
}
