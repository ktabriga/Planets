import 'package:flutter/material.dart';
import 'package:space_travel/planet.dart';
import 'package:space_travel/ui/common/Separator.dart';

class PlanetSummary extends StatelessWidget {
  final Planet planet;
  final bool horizontal;
  final Function onTap;


  PlanetSummary(this.planet, {this.horizontal = true, this.onTap});
  PlanetSummary.vertical(this.planet) : horizontal = false, onTap=null; 

  _buildThumbnail() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 16),
        alignment: horizontal ? FractionalOffset.centerLeft : FractionalOffset.center,
        child: Hero(
          tag: 'planet-hero-${planet.id}',
          child: Image (
              image: AssetImage(planet.image),
              height: 92.0,
              width: 92.0
          )
        )
    );

  }

  _buildCardContent() {
    final baseTextStyle = TextStyle(
        fontFamily: 'Poppins'
    );
    final headerTextStyle = baseTextStyle.copyWith(
        color: Colors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.w600
    );
    final regularTextStyle = baseTextStyle.copyWith(
        color: Color(0xffb6b2df),
        fontSize: 9.0,
        fontWeight: FontWeight.w400
    );
    final subHeaderTextStyle = regularTextStyle.copyWith(
        fontSize: 12.0
    );

    Widget _planetValue({String value, String image}) {
      return Row(
          children: <Widget>[
            Image.asset(image, height: 12.0),
            Container(width: 8.0),
            Text(value, style: regularTextStyle),
          ]
      );

    }

    return Container(
        margin: EdgeInsets.fromLTRB(horizontal ? 76.0 : 16.0, horizontal ? 16.0 : 42.0, 16.0, 16.0),
        constraints: BoxConstraints.expand(),
        child: Column(
            crossAxisAlignment: horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: <Widget>[
              Container(height: 4.0),
              Text(planet.name, style: headerTextStyle),
              Container(height: 10.0),
              Text(planet.location, style: subHeaderTextStyle),
              Separator(),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: horizontal ? 1 : 0,
                      child: _planetValue(value: planet.distance, image: 'assets/img/ic_distance.png')
                    ),
                    Container( width: 32),
                    Expanded(
                      flex: horizontal ? 1 : 0,
                      child: _planetValue(value: planet.gravity, image: 'assets/img/ic_gravity.png')
                    )
                  ]
              )
            ]
        )
    );
  }

  _buildCard() {
    return Container(
        height: horizontal ? 120.0 : 154.0,
        margin: horizontal ? const EdgeInsets.only(left: 46.0) : EdgeInsets.only(top: 72.0),
        decoration: BoxDecoration(
            color: Color(0xFF333366),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0)
              )
            ]
        ),
        child: _buildCardContent()
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(planet),
      child: Container(
          margin:  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Stack(
              children: <Widget> [
                _buildCard(),
                _buildThumbnail()
              ]
          )
      ),
    );
  }

}


