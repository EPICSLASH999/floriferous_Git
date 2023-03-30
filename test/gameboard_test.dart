import 'package:floriferous/cards.dart';
import 'package:floriferous/floriferous.dart';
import 'package:floriferous/gameboard.dart';
import 'package:test/test.dart';

void main() {
  group('Tablero Grafico: ', () {
    test('Imprimir BountyCards Row', () {
      Game game = Game();
      Gameboard t = Gameboard(game);
      t.printBountyCardsZone();
    });
    test('Imprimir Todo Row', () {
      Game game = Game();
      game.printGameboard();
    });
    test('Despues de 5 turnos se vuelve a generar el tablero', () {
      Game game = Game();
      game.printGameboard();
      game.nextColumn(); 
      game.nextColumn(); 
      game.nextColumn(); 
      game.nextColumn(); 
      game.nextColumn(); 
      game.printGameboard();
      expect(game.column, equals(1));
    
    });
    test('Cartas tomadas ahora aparecen con "()" y "*" por num de piedras', () {
      Game game = Game();
      game.takeCard(1);
      game.takeCard(2);
      game.printGameboard();
    });
    test('Cartas volteadas ahora aparecen con "//"', () {
      Game game = Game();
      CrowCard crowC = CrowCard(renglon: 3, reemplazo: CrowReplacements.stone, numeroDePiedras: 2);
      game.crowActs(crowC);
      game.printGameboard();
    });
  
  });
}