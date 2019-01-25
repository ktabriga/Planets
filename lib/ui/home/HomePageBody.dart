import 'package:flutter/material.dart';
import 'package:space_travel/ui/common/PlanetSummary.dart';
import 'package:space_travel/planet.dart';
import 'package:space_travel/ui/detail/DetailPage.dart';

class HomePageBody extends StatelessWidget {

  _navigateToDetail(context) => (planet) {
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (_) => DetailPage(planet)
        )
    ); 
  };

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
                              (context, index) => PlanetSummary(planets[index], onTap: _navigateToDetail(context)),
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
            itemBuilder: (context, index) => PlanetSummary(planets[index]),
            itemExtent: 152.0,
            padding: new EdgeInsets.symmetric(vertical: 16.0)
        )
    );
  }

}

