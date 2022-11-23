import 'package:flame/extensions.dart';
import 'package:flame/flame.dart';

class AssetsStore {
  static late Image hexNoneFigureImage;
  static late Image whitePawnImage;
  static late Image blackPawnImage;
  static Future<void> loadImages() async {
    hexNoneFigureImage = await Flame.images.load('hexagonCell.png');
    whitePawnImage = await Flame.images.load('whitePawn.png');
    blackPawnImage = await Flame.images.load('blackPawn.png');
  }
}
