import '../board.dart';
import '../cell.dart';
import '../chess.dart';
import 'figure.dart';

class Rook extends Figure {
  Rook({required Cell cell, required GameColor color})
      : super(cell: cell, color: color);

  @override
  copy({Cell? newCell}) {
    return Rook(cell: cell, color: color);
  }

  @override
  List<Cell> getAvailableCells(Board board) {
    //TODO realisation alghorithm

    return [];
  }
}
