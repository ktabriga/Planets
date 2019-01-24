import 'package:flutter/material.dart';
import 'package:space_travel/ui/home/PlanetRow.dart';
import 'package:space_travel/planet.dart';

class HomePageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return PlanetRow(planet: planets[0]);
  }

}

