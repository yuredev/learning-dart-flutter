import 'package:flutter/material.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {

  final Function(Settings) onSettingsChange;
  final Settings settings;

  const SettingsScreen(
    this.settings,  
    this.onSettingsChange,
  );

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings _settings;

  @override
  void initState() {
    super.initState();
    _settings = widget.settings;
  }

  Widget _createSwitch({
    String title,
    String subtitle,
    bool value,
    void Function(bool) onChanged,
  }) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChange(_settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Configurações',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _createSwitch(
                    title: 'Sem Glutén',
                    subtitle: 'Só exibe refeições sem glutén!',
                    value: _settings.isGlutenFree,
                    onChanged: (value) {
                      setState(() => _settings.isGlutenFree = value);
                    },
                  ),
                  _createSwitch(
                    title: 'Sem Lactose',
                    subtitle: 'Só exibe refeições sem lactose!',
                    value: _settings.isLactoseFree,
                    onChanged: (value) {
                      setState(() => _settings.isLactoseFree = value);
                    },
                  ),
                  _createSwitch(
                    title: 'Vegetariana',
                    subtitle: 'Só exibe refeições vegetarianas!',
                    value: _settings.isVegetarian,
                    onChanged: (value) {
                      setState(() => _settings.isVegetarian = value);
                    },
                  ),
                  _createSwitch(
                    title: 'Vegana',
                    subtitle: 'Só exibe refeições veganas!',
                    value: _settings.isVegan,
                    onChanged: (value) {
                      setState(() => _settings.isVegan = value);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
