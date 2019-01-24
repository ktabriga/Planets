import 'package:flutter/material.dart';
import 'package:space_travel/planet.dart';

class DetailPage extends StatelessWidget {
  final Planet planet;

  DetailPage(this.planet);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail'),),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(planet.name),
            Hero(
              tag: 'planet-hero-${planet.id}',
              child: Image.asset(planet.image, width: 96.0, height: 96.0)
            )
          ]
        ),
        
      )
    );
  }
}

