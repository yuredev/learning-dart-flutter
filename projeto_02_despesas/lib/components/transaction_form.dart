import 'package:flutter/material.dart';
import 'package:weekly_expenses/components/adaptative/adaptative_button.dart';
import 'package:weekly_expenses/components/adaptative/adaptative_date_picker.dart';
import 'package:weekly_expenses/components/adaptative/adaptative_textfield.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    // se não conseguir converter o valor padrão será 0
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isNotEmpty && value > 0 && _selectedDate != null) {
      // para acessar atributos do componente
      // dentro da classe do estado
      // usamos o atributo widget que é herdado
      // na classe do estado de State
      // desta forma podemos usar o onSubmit que está
      // na classe do componente e não do estado
      widget.onSubmit(title, value, _selectedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            // MediaQuery.of(context).viewInsets.bottom
            // é o espaço que o teclado ocupa quando está aberto
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
            left: 10,
          ),
          child: Column(
            children: <Widget>[
              AdaptativeTextField(
                controller: _titleController,
                onSubmitted: (_) => _submitForm(),
                label: 'Título',
              ),
              AdaptativeTextField(
                controller: _valueController,
                onSubmitted: (_) => _submitForm(),
                label: 'Valor (R\$)',
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              AdaptativeDatePicker(
                selectedDate: _selectedDate,
                onDateChange: (newDate) {
                  setState(() => _selectedDate = newDate);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  AdaptativeButton(
                    label: 'Nova transação',
                    onPressed: _submitForm,
                  ),
                  // RaisedButton(
                  //   textColor: Theme.of(context).textTheme.button.color,
                  //   onPressed: _submitForm,
                  //   color: Theme.of(context).primaryColor,
                  //   child: Text('Nova transação'),
                  // ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
