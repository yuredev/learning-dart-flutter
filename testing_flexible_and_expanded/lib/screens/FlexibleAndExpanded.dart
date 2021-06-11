import 'package:flutter/material.dart';

class FlexibleAndExpanded extends StatefulWidget {
  @override
  _FlexibleAndExpandedState createState() => _FlexibleAndExpandedState();
}

class _FlexibleAndExpandedState extends State<FlexibleAndExpanded> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flexible And Expanded'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(
            color: Colors.yellow,
            width: 3,
          ),
        ),
        child: Column(
          children: [
            Flexible(
              fit: FlexFit.loose,
              flex: 8,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                child: Text('Flexible 1'),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                child: Text('Dorime'),
              ),
            ),
            Flexible(
              flex: 1,
              // fit: FlexFit.tight,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    Text('Flexible 1'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
