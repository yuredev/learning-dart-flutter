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

  Future<void> refreshNotes() async {
    print('aaaaaa');
    final loadedNotes = await NotesDatabase.instance.getAll();
    setState(() {
      notes.clear();
      notes.addAll(loadedNotes);
    });
  }

  @override
  Widget build(BuildContext context) {
    final notesForm = Form(
      key: _formKey,
      child: FutureBuilder(
        future: refreshNotes(),
        builder: (ctx, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Ocorreu um erro ao buscar as notas do banco',
              ),
            );
          }
          return Padding(
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
          );
        },
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('SQFlite App'),
      ),
      body: ListView.builder(
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
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (ctx) {
              return notesForm;
            },
          );
        },
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
