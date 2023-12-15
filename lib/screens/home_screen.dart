import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:project_02_diamond/components/jogo/hero.dart';

class TestMap extends StatelessWidget {
  const TestMap({super.key});

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      joystick: Joystick(directional: JoystickDirectional()),
      map: WorldMapByTiled('map/island.tmj', forceTileSize: Vector2(40, 42)),
      player: GameHero(
        Vector2(17 * 36, 10 * 38),
      ),
      showCollisionArea: false,
    );
  }
}
