// ignore_for_file: unused_import

import 'package:flame/widgets.dart';

import '../board.dart';
import '../cell.dart';
import '../chess.dart';
import 'figure.dart';

class King extends Figure {
  King({required Cell cell, required GameColor color})
      : super(cell: cell, color: color);

  @override
  copy({Cell? newCell}) {
    return King(cell: cell, color: color);
  }

  @override
  List<Cell> getAvailableCells(Board board) {
    //TODO realisation alghorithm

    return [];
  }
}
