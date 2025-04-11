import 'dart:math';

import 'package:flutter/cupertino.dart';

class SORTController extends ChangeNotifier{

  final List<String> _nomes = [];
  List<String> get nomes => _nomes;

  String resultado = '';

  void add(String nome) {
    if (nome.isNotEmpty) {
        _nomes.add(nome);
        notifyListeners();
    }
  }

  void sortearNome() {
    if (_nomes.isNotEmpty) {
      final random = Random();
      final nomeSorteado = _nomes[random.nextInt(_nomes.length)];
        resultado = 'Sorteado: $nomeSorteado';
      notifyListeners();
    }
  }

  void limparLista() {
      _nomes.clear();
      resultado = '';
      notifyListeners();
    }

}