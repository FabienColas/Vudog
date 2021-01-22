
import 'package:flutter/material.dart';

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
                      VerticalDivider(color: Colors.black, thickness: 1.5,),
                      _printHeight()
                    ],
                  ),
                )
              ]
            ),
          ),
          actions: <Widget>[
            OutlinedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              child: Text('Close', style: TextStyle(color: Colors.white),),
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
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: InkWell(
        child: Row(
          children: [
            CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                  widget.image,
                )
            ),
            Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                    widget.name,
                    style: TextStyle(fontSize: 18,),
                )
            ),
          ],
        ),
        onTap: () {
          _showMaterialDialog();
        },
      ),
    );
  }
}
