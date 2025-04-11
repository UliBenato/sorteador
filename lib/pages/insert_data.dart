import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../sort_controller.dart';

class InsertData extends StatelessWidget{
  InsertData({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nome = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("teste");
    final nomes = Provider.of<SORTController>(context).nomes;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sorteador"),
        centerTitle: true
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nome,
                  decoration: InputDecoration(
                    labelText: "Insira um nome na lista!",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),),
                  ),
                  validator: (value) {

                      if (value == null || value.isEmpty) {
                      return "Por favor, insira um nome na lista";
                      }
                      return null;
                      },
          ),
                  const SizedBox(
                  height: 6,
                  ),
                ElevatedButton(
                  key: Key('addButton'),
                    onPressed: (){
                      if (_formKey.currentState!.validate()) {
                        Provider.of<SORTController>(context, listen: false).add(_nome.text);
                      }
                      _nome.clear();
                    },
                    child: const Text("Adicionar")),
                Expanded(
                  child: nomes.isEmpty
                      ? const Center(child: Text("Nenhum nome na lista."))
                  : ListView.builder(
                    itemCount: nomes.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const Icon(Icons.person),
                        title: Text(nomes[index]),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  key: Key('sortearButton'),
                  onPressed: (){
                    Provider.of<SORTController>(context, listen: false).sortearNome();
                    Navigator.pushNamed(context, '/sorteioresult');
                  },
                  child: Text('Sortear'),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Provider.of<SORTController>(context, listen: false).limparLista();
                    _nome.clear();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Lista de nomes limpa!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: Text('Limpar Lista'),
                )

              ],
          ),
        ),
      ),
    );
  }

}