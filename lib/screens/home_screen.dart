import 'package:bonfire/tiled/model/tiled_world_data.dart';
import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:project_02_diamond/components/jogo/hero.dart';

class TestMap extends StatelessWidget {
  const TestMap({super.key});

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      joystick: Joystick(directional: JoystickDirectional()),
      map: WorldMapByTiled('map/island.tmj', forceTileSize: Vector2(36, 38)),
      player: GameHero(Vector2(17 * 36, 10 * 38)),
    );
  }
}
