import 'package:flame/components.dart';
import 'package:hexagon_chess/game/cell.dart';
import 'package:hexagon_chess/game/chess.dart';
import 'package:hexagon_chess/game/figures/pawn.dart';

class Board extends Component {
  List<List<Cell>> cells = [];
  Cell? focusedCell;
  @override
  Future<void>? onLoad() {
    for (var i = 0; i < 7; i++) {
      cells.add([]);
      for (var j = 0; j < 8 + i; j++) {
        cells[i].add(Cell(
            positionOnTheBoard: Vector2(j.toDouble(), i.toDouble()),
            board: this));
        add(cells[i][j]);
      }
    }
    for (var i = 0; i < 6; i++) {
      cells.add([]);
      for (var j = 0; j < 13 - i; j++) {
        cells[i + 7].add(Cell(
            positionOnTheBoard: Vector2(j.toDouble(), (i + 7).toDouble()),
            board: this));
        add(cells[i + 7][j]);
      }
    }
    return super.onLoad();
  }

  void placePieces() {
    for (var element in cells[1]) {
      element.figure = Pawn(cell: element, color: GameColor.white);
    }

    for (var element in cells[11]) {
      element.figure = Pawn(cell: element, color: GameColor.black);
    }
  }
}
