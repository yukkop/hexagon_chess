import 'package:flame/widgets.dart';

import '../board.dart';
import '../cell.dart';
import '../chess.dart';
import 'figure.dart';

class King extends Figure {
  King({required Cell cell, required GameColor color})
      : super(cell: cell, color: color);

  @override
  List<Cell> getAvailableCells(Board board) {
    return [];
  }
}
