import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:hexagon_chess/game/figures/figure.dart';
import 'package:hexagon_chess/game/figures/none_figure.dart';

class Cell extends SpriteComponent with TapCallbacks {
  late Figure figure;
  CellState state = CellState.normal;
  Cell() : super() {
    figure = NoneFigure(cell: this);
  }
  void moveTo(Cell target) {
    target.figure = figure;
    figure = NoneFigure(cell: this);
  }
}

enum CellState {
  normal,
  focused,
  available,
}
