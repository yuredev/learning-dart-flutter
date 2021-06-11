import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _navigateToFlexibleAndExpanded() {
      Navigator.of(context).pushNamed('/flexible_and_expanded');
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text('Main Menu'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _navigateToFlexibleAndExpanded,
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).accentColor,
              ),
              child: Text('Flexible and Expanded'),
            )
          ],
        ),
      ),
    );
  }
}
