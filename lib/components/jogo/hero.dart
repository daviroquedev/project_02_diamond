import 'package:bonfire/bonfire.dart';
import 'package:project_02_diamond/components/jogo/game_sprite_sheet.dart';

class GameHero extends SimplePlayer with BlockMovementCollision {
  @override
  Future<void> onLoad() {
    add(RectangleHitbox(size: Vector2(40, 45)));
    return super.onLoad();
  }

  GameHero(Vector2 position)
      : super(
          size: Vector2(50, 52),
          position: position,
          animation: SimpleDirectionAnimation(
            idleRight: GameSpriteSheet.heroIdRight,
            idleLeft: GameSpriteSheet.heroIdLeft,
            runLeft: GameSpriteSheet.heroRunLeft,
            runRight: GameSpriteSheet.heroRunRight,
          ),
          speed: 90,
        );
}
