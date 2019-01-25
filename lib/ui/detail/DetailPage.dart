import 'package:flutter/material.dart';
import 'package:space_travel/planet.dart';
import 'package:space_travel/ui/common/PlanetSummary.dart';
import 'package:space_travel/ui/common/Separator.dart';
import 'package:space_travel/ui/TextStyle.dart';

class DetailPage extends StatelessWidget {
  final Planet planet;

  DetailPage(this.planet);

  _getBackground() {
    return Container(
      child: Image.network(planet.picture, fit: BoxFit.cover, height: 300.0),
      constraints: BoxConstraints.expand(height: 300.0),
    );
  }

  _getGradient() {
    return Container(
      margin: EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            new Color(0x00736AB7),
            new Color(0xFF736AB7)
          ],
          stops: [0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0)
        )
      ),
    );
  }

  Widget _getContent() {
    return ListView(
      padding: EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
      children: <Widget>[
        PlanetSummary.vertical(planet),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('OVERVIEW', style: Style.headerTextStyle),
              Separator(),
              Text(planet.description, style: Style.commonTextStyle)
            ],
          ),
        )
      ],
    );
  }

  Container _getToolbar(context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context)
        .padding.top),
        child: BackButton(color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: new Color(0xFF736AB7),
        child: Stack(
          children: <Widget>[
            _getBackground(),
            _getGradient(),
            _getContent(),
            _getToolbar(context)
          ],
        ),
      ),
    );
    }
}

