import 'package:flutter/material.dart';
import 'package:space_travel/ui/home/PlanetRow.dart';
import 'package:space_travel/planet.dart';

class HomePageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            color: Color(0xFF736AB7),
            child: CustomScrollView(
                scrollDirection: Axis.vertical,
                slivers: <Widget>[
                  SliverPadding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      sliver: SliverFixedExtentList(
                          itemExtent: 152.0,
                          delegate: SliverChildBuilderDelegate(
                              (context, index) => PlanetRow(planet: planets[index]),
                              childCount: planets.length
                          )
                      )
                  )
                ]
            )
        )
    );
    return Expanded(
        child: ListView.builder(
            itemCount: planets.length,
            itemBuilder: (context, index) => PlanetRow(planet: planets[index]),
            itemExtent: 152.0,
            padding: new EdgeInsets.symmetric(vertical: 16.0)
        )
    );
  }

}

