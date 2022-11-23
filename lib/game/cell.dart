// ignore_for_file: unnecessary_import

import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/image_composition.dart';
import 'package:hexagon_chess/core/constants.dart';
import 'package:hexagon_chess/game/assets_store.dart';
import 'package:hexagon_chess/game/figures/figure.dart';
import 'package:hexagon_chess/game/figures/none_figure.dart';

import 'board.dart';

class Cell extends SpriteComponent with TapCallbacks {
  late Figure _figure;
  CellState _state = CellState.normal;
  Vector2 positionOnTheBoard;
  Board board;
  Cell({required this.positionOnTheBoard, required this.board})
      : super(
            sprite: Sprite(AssetsStore.hexImage),
            size: Vector2(hexSpriteSize.toDouble(), hexSpriteSize.toDouble())) {
    double baseX = (positionOnTheBoard.y < 7
        ? firstHexCoord.x - positionOnTheBoard.y * hexSize / 2
        : firstHexCoord.x - (12 - positionOnTheBoard.y) * hexSize / 2);
    position = Vector2(baseX + positionOnTheBoard.x * hexSize,
        firstHexCoord.y + positionOnTheBoard.y * hexSize * 0.8);
    _figure = NoneFigure(cell: this);
  }

  void moveTo(Cell target) {
    target.figure = figure.copy(newCell: target);
    figure = NoneFigure(cell: this);
  }

  Figure get figure {
    return _figure;
  }

  set figure(Figure value) {
    if (_figure.cell.hasChildren) {
      remove(_figure);
    }
    _figure = value;
    if (_figure is! NoneFigure) {
      add(_figure);
    }
  }

  CellState get state {
    return _state;
  }

  set state(CellState value) {
    _state = value;
    switch (state) {
      case CellState.normal:
        sprite = Sprite(AssetsStore.hexImage);
        break;
      case CellState.focused:
        sprite = Sprite(AssetsStore.hexFocusedImage);
        break;
      case CellState.available:
        sprite = Sprite(AssetsStore.hexAvailableImage);
        break;
    }
  }

  @override
  void onTapDown(TapDownEvent event) {
    switch (state) {
      case CellState.normal:
        if (figure is! NoneFigure) {
          for (var row in board.cells) {
            for (var element in row) {
              element.state = CellState.normal;
            }
          }
          figure.getAvailableCells(board).forEach((element) {
            element.state = CellState.available;
          });
          state = CellState.focused;
          board.focusedCell = this;
        }
        break;
      case CellState.focused:
        for (var row in board.cells) {
          for (var element in row) {
            element.state = CellState.normal;
          }
        }
        board.focusedCell = null;
        break;
      case CellState.available:
        board.focusedCell?.moveTo(this);
        for (var row in board.cells) {
          for (var element in row) {
            element.state = CellState.normal;
          }
        }
        board.focusedCell = null;
        break;
    }
  }
}

enum CellState {
  normal,
  focused,
  available,
}
