import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sqfite_database/database/notes_database.dart';
import 'package:sqfite_database/models/note.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isLoading = false;
  final List<Note> notes = [];
  final _formKey = GlobalKey<FormState>();

  bool isImportant = false;
  int? number;
  String title = '';
  String description = '';
  DateTime? createdTime;
  late final Future loadNotesFuture;

  @override
  void initState() {
    super.initState();
    loadNotesFuture = refreshNotes();
  }

  Future<void> refreshNotes() async {
    final loadedNotes = await NotesDatabase.instance.getAll();
    setState(() {
      notes.clear();
      notes.addAll(loadedNotes);
    });
    return Future.value();
  }

  void showNotesForm() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Título',
                  ),
                  onChanged: (data) => setState(() {
                    title = data;
                  }),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Descrição',
                  ),
                  onChanged: (data) => setState(() {
                    description = data;
                  }),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Number',
                  ),
                  onChanged: (data) => setState(() {
                    number = int.tryParse(data);
                  }),
                  keyboardType: TextInputType.number,
                ),
                Row(
                  children: [
                    Text('Is important?'),
                    ModalSwitch(
                      onChanged: (value) {
                        setState(() => isImportant = value);
                      },
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () async {
                        createdTime = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2019),
                          lastDate: DateTime(2025),
                        );
                      },
                      child: Text('Time'),
                    ),
                  ],
                ),
                Container(
                  child: ElevatedButton(
                    child: Text('Cadastrar'),
                    onPressed: () {
                      final note = Note(
                        createdTime: createdTime!,
                        description: description,
                        isImportant: isImportant,
                        number: number!,
                        title: title,
                      );
                      NotesDatabase.instance.create(note);
                      refreshNotes();
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQFlite App'),
      ),
      body: FutureBuilder(
        future: loadNotesFuture,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                  Text('Something wrong happened'),
                ],
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            itemCount: notes.length,
            itemBuilder: (context, index) => Card(
              elevation: 3,
              child: ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.note),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                title: Text(notes[index].title),
                subtitle: Text(notes[index].description),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: showNotesForm,
      ),
    );
  }
}

class ModalSwitch extends StatefulWidget {
  final Function(bool value) onChanged;
  ModalSwitch({required this.onChanged});

  @override
  _State createState() => _State();
}

class _State extends State<ModalSwitch> {
  var _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _isSwitched,
      onChanged: (newValue) {
        setState(() => _isSwitched = newValue);
        widget.onChanged(newValue);
      },
      activeColor: Theme.of(context).primaryColor,
    );
  }
}
