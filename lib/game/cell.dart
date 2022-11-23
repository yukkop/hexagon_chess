import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/flame.dart';
import 'package:flame/image_composition.dart';
import 'package:hexagon_chess/core/constants.dart';
import 'package:hexagon_chess/game/assets_store.dart';
import 'package:hexagon_chess/game/chess.dart';
import 'package:hexagon_chess/game/figures/figure.dart';
import 'package:hexagon_chess/game/figures/none_figure.dart';
import 'package:hexagon_chess/game/figures/pawn.dart';

class Cell extends SpriteComponent with TapCallbacks {
  late Figure _figure;
  CellState state = CellState.normal;
  Cell({required Vector2 positionOnTheBoard})
      : super(
            sprite: Sprite(AssetsStore.hexNoneFigureImage),
            size: Vector2(hexSpriteSize.toDouble(), hexSpriteSize.toDouble())) {
    double baseX = (positionOnTheBoard.y < 7
        ? firstHexCoord.x - positionOnTheBoard.y * hexSize / 2
        : firstHexCoord.x - (12 - positionOnTheBoard.y) * hexSize / 2);
    position = Vector2(baseX + positionOnTheBoard.x * hexSize,
        firstHexCoord.y + positionOnTheBoard.y * hexSize * 0.8);
    _figure = NoneFigure(cell: this);
  }

  void moveTo(Cell target) {
    target._figure = _figure;
    _figure = NoneFigure(cell: this);
  }

  Figure get figure {
    return _figure;
  }

  set figure(Figure value) {
    _figure.removeFromParent();
    _figure = value;
    add(_figure);
  }
}

enum CellState {
  normal,
  focused,
  available,
}
