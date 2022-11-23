import '../board.dart';
import '../cell.dart';
import '../chess.dart';
import 'figure.dart';

class Bishop extends Figure {
  Bishop({required Cell cell, required GameColor color})
      : super(cell: cell, color: color);

  @override
  copy({Cell? newCell}) {
    return Bishop(cell: cell, color: color);
  }

  @override
  List<Cell> getAvailableCells(Board board) {
    //TODO realisation alghorithm

    return [];
  }
}
