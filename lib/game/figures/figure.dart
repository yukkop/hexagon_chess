import 'package:hexagon_chess/game/cell.dart';

import '../board.dart';
import '../chess.dart';

abstract class Figure {
  Cell cell;
  GameColor color;
  Figure({required this.cell, required this.color});
  List<Cell> getAvailableCells(Board board);
}
