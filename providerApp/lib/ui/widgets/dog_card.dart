
import 'package:flutter/material.dart';
import 'package:flutter_dogapp/assets/constants.dart' as Constants;

class DogCard extends StatefulWidget {
  DogCard({Key key, this.name, this.image, this.origin,
    this.lifespan, this.weightMetric, this.heightMetric,
    this.temperament}) : super(key: key);

  final String name;
  final String image;
  final String origin;
  final String lifespan;
  final String weightMetric;
  final String heightMetric;
  final String temperament;

  @override
  _DogCardState createState() => _DogCardState();
}

class _DogCardState extends State<DogCard> {

  Widget _printTemperament() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Temperament", style: TextStyle(fontWeight: FontWeight.bold),),
            Container(
              margin: EdgeInsets.only(left: 5),
              child: Icon(Icons.pets, size: 18,),
            )
          ],
        ),
        Text(widget.temperament)
      ],
    );
  }

  Widget _printLifeSpan() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Lifespan(years)", style: TextStyle(fontWeight: FontWeight.bold),),
        Text(widget.lifespan)
      ],
    );
  }

  Widget _printWeight() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Weight(kg)", style: TextStyle(fontWeight: FontWeight.bold),),
        Text(widget.weightMetric)
      ],
    );
  }

  Widget _printHeight() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Height(cm)", style: TextStyle(fontWeight: FontWeight.bold),),
        Text(widget.heightMetric)
      ],
    );
  }

  Widget _spaceAround() {
    return Container(
      height: 10,
    );
  }

  _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(widget.name, style: TextStyle(fontWeight: FontWeight.bold),),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(child: Image.network(widget.image,))
                  ],
                ),
                _spaceAround(),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _printWeight(),
                      VerticalDivider(color: Colors.grey, thickness: 1.5,),
                      _printHeight(),
                    ],
                  ),
                ),
                _spaceAround(),
                _printLifeSpan(),
                _spaceAround(),
                _printTemperament()
              ]
            ),
          ),
          actions: <Widget>[
            OutlinedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Constants.GREEN),
              ),
              child: Text('Close', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: InkWell(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                      widget.image,
                    )
                ),
              ),
              Flexible(
                child: Text(
                  widget.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          onTap: () {
            _showMaterialDialog();
          },
        ),
      ),
    );
  }
}
