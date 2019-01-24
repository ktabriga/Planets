import 'package:flutter/material.dart';
import 'package:space_travel/planet.dart';
import 'package:space_travel/ui/home/DetailPage.dart';

class PlanetRow extends StatelessWidget {
  final Planet planet;


  PlanetRow({@required this.planet});

  _buildThumbnail() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 16),
        alignment: FractionalOffset.centerLeft,
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
        margin: EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
        constraints: BoxConstraints.expand(),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(height: 4.0),
              Text(planet.name, style: headerTextStyle),
              Container(height: 10.0),
              Text(planet.location, style: subHeaderTextStyle),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  height: 2.0,
                  width: 18.0,
                  color: Color(0xff00c6ff)
              ),
              Row(
                  children: <Widget>[
                    Expanded(
                        child: _planetValue(value: planet.distance, image: 'assets/img/ic_distance.png')
                    ),
                    Expanded(
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
        height: 120.0,
        margin: const EdgeInsets.only(left: 46.0),
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
      onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
              builder: (_) => DetailPage(planet)
          )
      ),
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


