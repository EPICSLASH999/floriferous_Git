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
      game.column = 5;
      game.nextColumn();
      game.printGameboard();
      expect(game.column, equals(1));
    
    });
    test('Cartas volteadas ahora aparecen con "//"', () {
      Game game = Game();
      CrowCard crowC = CrowCard(renglon: 3, reemplazo: CrowReplacements.card);
      game.crowActs(crowC);
      game.printGameboard();
      expect(Gameboard(game).upsideDownCard, equals('//'));
    });
    test('Cartas tomadas por cuervo ahora aparecen como "---" y con "*" por num de piedras', () {
      Game game = Game();
      CrowCard crowC = CrowCard(renglon: 3, reemplazo: CrowReplacements.stone, numeroDePiedras: 2);
      game.crowActs(crowC);
      game.printGameboard();
      expect(Gameboard(game).isNotThereCard, equals('---'));
    });
  
  });
}