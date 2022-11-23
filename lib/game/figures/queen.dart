import '../board.dart';
import '../cell.dart';
import '../chess.dart';
import 'figure.dart';

class Queen extends Figure {
  Queen({required Cell cell, required GameColor color})
      : super(cell: cell, color: color);

  @override
  List<Cell> getAvailableCells(Board board) {
    return [];
  }
}
