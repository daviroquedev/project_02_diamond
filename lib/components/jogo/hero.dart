import 'package:bonfire/bonfire.dart';
import 'package:bonfire/player/simple_player.dart';
import 'package:project_02_diamond/components/jogo/game_sprite_sheet.dart';

class GameHero extends SimplePlayer {
  GameHero(Vector2 position)
      : super(
            size: Vector2(32, 32),
            position: position,
            animation: SimpleDirectionAnimation(
              idleRight: GameSpriteSheet.heroIdRight,
              idleLeft: GameSpriteSheet.heroIdLeft,
              runLeft: GameSpriteSheet.heroRunLeft,
              runRight: GameSpriteSheet.heroRunRight,
            ));
}
