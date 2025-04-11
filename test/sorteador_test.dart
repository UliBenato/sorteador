
import 'package:flutter_test/flutter_test.dart';
import 'package:sorteador/sort_controller.dart';

void main(){
  late SORTController controller;
  //obriga o desenvolvedor a criar uma classe
  //específica para a lógica do sorteador
  setUp((){
    controller = SORTController();
  }); //antes de rodar qualquer teste, ele vai rodar o que está dentro do setup

  group("Teste do Sorteador",(){
    test('Lista começa vazia', ()
    {
      expect(controller.nomes, isEmpty);
    });
    test('Adiciona um nome à lista', () {
      controller.add('João');
      expect(controller.nomes.length, 1);
      expect(controller.nomes.contains('João'), isTrue);
    });
    test('Adiciona dois nomes à lista', () {
      controller.add('João');
      controller.add('Maria');
      expect(controller.nomes.length, 2);
      expect(controller.nomes.toSet().containsAll(['João', 'Maria']), isTrue);
    });
    test('Sorteio de nome', () {
      controller.add('João');
      controller.add('Maria');
      controller.sortearNome();
      expect(controller.resultado.isEmpty, isFalse);
    });
    test('Limpa lista', () {
      controller.add('João');
      controller.add('Maria');
      controller.limparLista();
      expect(controller.nomes, isEmpty);
    });
  });
}