import 'package:flutter/material.dart';

import '../common/button.dart';
import '../common/input.dart';
import '../models/person_dart.dart';


class Inscription extends StatefulWidget {
  const Inscription({super.key});

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  final _formKey = GlobalKey<FormState>();
  final Person person= Person();
  DateTime? birthdate;
  String _selectedSexe = 'Homme';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text("Inscription"),
        actions: [
          Icon(Icons.more_vert),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Inputwidget(
                name: 'Nom',

                validator: (value) {
                  if (value!.isEmpty) {
                    return " Champ obligatoire";
                  }
                },
                onSaved: (value) {
                  person.name=value;
                },

                prefixIcon: Icon(Icons.person),
              ),
              SizedBox(height: 10,),
              Inputwidget(
                name: 'Prenom',

                validator: (value) {
                  if (value!.isEmpty) {
                    return " Champ obligatoire";
                  }
                },
                onSaved: (value) {
                  person.surname=value;
                },

                prefixIcon: Icon(Icons.person),
              ),
              SizedBox(height: 10,),
              ListTile(
                title: Text("Date de naissance"),
                subtitle: Text("$birthdate"),
                trailing: Icon(Icons.calendar_month),
                onTap: () async {
                  birthdate = await showDatePicker(
                      cancelText: "Annuler",
                      confirmText: "Confirmer",
                      barrierColor: Colors.green.shade50,
                      context: context,
                      firstDate: DateTime(1990),
                      lastDate: DateTime.now());
                  setState(() {});
                },
              ),
              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text("SEXE",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
              ),

              Row(
                children: [
                  Radio(
                    value: 'Homme',
                    groupValue: _selectedSexe,
                    onChanged: (value) {
                      setState(() {
                        _selectedSexe = "Homme";
                      });
                    },
                  ),
                  Text("Homme"),
                  Radio(
                    value: 'Femme',
                    groupValue: _selectedSexe,
                    onChanged: (value) {
                      setState(() {
                        _selectedSexe = "Femme";
                      });
                    },
                  ),
                  Text("Femme"),
                ],
              ),
              ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Button(
          onPressed: () {
            if(  _formKey.currentState!.validate()){
              _formKey.currentState!.save();
              Navigator.pop(context, person);
            }
          },
          text: 'Se connecter',
        ),
      ),
    );
  }
}