import 'package:flame/extensions.dart';
import 'package:flame/flame.dart';

class AssetsStore {
  static late Image hexImage;
  static late Image hexFocusedImage;
  static late Image hexAvailableImage;
  static late Image whitePawnImage;
  static late Image blackPawnImage;
  static Future<void> loadImages() async {
    hexImage = await Flame.images.load('hexagonCell.png');
    hexFocusedImage = await Flame.images.load('hexagonCellFocused.png');
    hexAvailableImage = await Flame.images.load('hexagonCellAvailable.png');
    whitePawnImage = await Flame.images.load('whitePawn.png');
    blackPawnImage = await Flame.images.load('blackPawn.png');
  }
}
