import 'package:floriferous/cards.dart';
import 'package:floriferous/floriferous.dart';
import 'package:test/test.dart';


void main() {

  group('In Game Cards: ', () {
    test('Tarjeta tomada de mazo es la ultima', () {
      Game game = Game();
      game.setGardenCards(ListsOfCards().gardenCards.toList());
      GardenCard card = game.drawGardenCard();

      //print(gardenCards.elementAt(gardenCards.length-1));
      //print(card);

      expect(ListsOfCards().gardenCards.elementAt(ListsOfCards().gardenCards.length-1), equals(card));

    });
    test('Al tomar tarjeta se elimina del bonche', () {
      Game game = Game();
      game.setGardenCards(ListsOfCards().gardenCards.toList());
      int longitudInicial = game.gardenCards.length;

      game.drawGardenCard();
      int longitudFinal = game.gardenCards.length;

      //print(longitudFinal);

      expect(longitudInicial == longitudFinal, equals(false));
    
  });
    test('El total de garden cards disminuye a 45 tras contruir el tablero', () {
      Game game = Game();
      //print(game.gardenCards);
      expect(game.gardenCards.length, equals(45));
    });
    test('Game ha generado sus 3 bounty cards', () {
      Game game = Game();
      //print(game.GetBountyCards());
      expect(game.bountyCards.length, equals(3));
    });
    test('Generar dia toma 10 tarjetas de Jardin', () {
      Game game = Game();
      
      int sum = game.row1.length + game.row2.length;

      expect(sum, equals(10));
    });
    test('Generar dia deja 45 tarjeas de jardin', () {
      Game game = Game();
      expect(game.gardenCards.length, equals(45));
    });
    test('Generar dia toma 3 tarjetas de Bounty', () {
      Game game = Game();
      //print(game._bountyCards);
      expect(game.bountyCards.length, equals(3));
    });
    test('En Row 1... Cards 2 y 4 estan volteadas', () {
      Game game = Game();
      bool volteada = (game.row1.elementAt(1).isUpsidedown && game.row1.elementAt(3).isUpsidedown);
      //print('${game.row1.elementAt(0).isUpsidedown} ${game.row1.elementAt(1).isUpsidedown} ${game.row1.elementAt(2).isUpsidedown} '+
      //'${game.row1.elementAt(3).isUpsidedown} ${game.row1.elementAt(4).isUpsidedown}');
      expect(volteada, equals(true));
    });
    test('En Row2... Cards 1,3 y 5 tienen piedra', () {
      Game game = Game();
      bool tienenPiedras = game.row2.elementAt(0).hasStone && game.row2.elementAt(2).hasStone && game.row2.elementAt(4).hasStone;
      //print('${game.row2.elementAt(0).hasStone} ${game.row2.elementAt(1).hasStone} ${game.row2.elementAt(2).hasStone} '+
      //'${game.row2.elementAt(3).hasStone} ${game.row2.elementAt(4).hasStone}');
      expect(tienenPiedras, equals(true));
    });
    test('Generar dia toma 5 tarjetas Desire', () {
      Game game = Game();
      expect(game.row3.length, equals(5));
    });   
    test('Total de DesireCards disminuye a 16 tras startgame', () {
      Game game = Game();
      expect(game.desireCards.length, equals(16));
    });
    test('Draw CrowCard toma la ultima y la resta a la baraja', () {
      Game game = Game();
      //CrowCard card1 = game._crowCards.elementAt(game._crowCards.length-1);
      game.drawCrowCard();
      //print(card1);
      //print(card2);
      expect(game.crowCards.length, equals(8));
    });
    test('Al tomar las 9 CrowCards se reinicia la baraja', () {
      Game game = Game();
      game.drawCrowCard();
      game.drawCrowCard();
      game.drawCrowCard();
      game.drawCrowCard();
      game.drawCrowCard();
      game.drawCrowCard();
      game.drawCrowCard();
      game.drawCrowCard();
      game.drawCrowCard();
      game.drawCrowCard();

      expect(game.crowCards.length, equals(8));
    });
    test('Esta bocaabajo una DesireCard', () {
      Game game = Game();
      //print(game.row3.elementAt(0).isUpsidedown);
      game.row3.elementAt(0).setUpsideDown(true);
      expect(game.row3.elementAt(0).isUpsidedown, equals(true));
    });
  });
  group('Final de dia: ', () {
    test('Al terminar el dia es "Dia 2"', () {
      Game game = Game();
      game.endOfDay(List.empty());
      expect(game.day, equals(2));
    });
    test('Comprobar si se llena una bounty card', () {
      List<Card> miDeck = [
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.white, bicho: Bugs.bee),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.tulip, col: Colors.pink, bicho: Bugs.ladybug),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.tulip, col: Colors.white, bicho: Bugs.butterfly),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.tulip, col: Colors.white, bicho: Bugs.bee),
      ];
      BountyCard bountyC = BountyCard(requerimiento1: Flowers.tulip, requerimiento2: Bugs.ladybug, requerimiento3: Bugs.butterfly);
      //BountyCard bountyC = BountyCard(requerimiento1: Flowers.tulip, requerimiento2: Flowers.tulip, requerimiento3: Flowers.daisy);
      bountyC.checkIfCompleated(miDeck, 1);
      bool compleated = bountyC.isCompleated;
      expect(compleated, equals(true));
    });
    test('Comprobar si se llena alguna bounty card', () {
      List<Card> miDeck = [
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.white, bicho: Bugs.beetle),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.tulip, col: Colors.pink, bicho: Bugs.ladybug),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.tulip, col: Colors.white, bicho: Bugs.butterfly),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.tulip, col: Colors.white, bicho: Bugs.bee),
      ];
      List <BountyCard> myBountyCards = [
        BountyCard(requerimiento1: Flowers.tulip, requerimiento2: Bugs.ladybug, requerimiento3: Bugs.butterfly),
        BountyCard(requerimiento1: Flowers.tulip, requerimiento2: Flowers.tulip, requerimiento3: Flowers.daisy),
        BountyCard(requerimiento1: Bugs.beetle, requerimiento2: Bugs.ladybug, requerimiento3: Bugs.bee)
      ];
      Game game = Game();
      game.setBountyCards(myBountyCards.toList());
      game.endOfDay(miDeck);
      bool isAtLeastOneCompleated = game.bountyCards.elementAt(1).isCompleated || game.bountyCards.elementAt(1).isCompleated || game.bountyCards.elementAt(2).isCompleated;
      expect(isAtLeastOneCompleated, equals(true));
    });
    test('Comprobar que No se llene una bountycard que ya cumplio un requisito', () {
      List<Card> miDeck = [
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.white, bicho: Bugs.beetle),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.tulip, col: Colors.pink, bicho: Bugs.ladybug),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.tulip, col: Colors.white, bicho: Bugs.butterfly),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.tulip, col: Colors.white, bicho: Bugs.bee),
      ];

      BountyCard bountyC = BountyCard(requerimiento1: Flowers.tulip, requerimiento2: Flowers.tulip, requerimiento3: Flowers.daisy);
      bountyC.checkIfCompleated(miDeck, 1);
      bool compleated = bountyC.isCompleated;
      expect(compleated, equals(false));
    });
    


  });
  group('Puntaje final: ', () {
    test('Obtener puntaje de 3 con desire cards', () {
      List<Card> miDeck = [
      FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.pink),
      FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.purple, bicho: Bugs.bee),
      FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.orange, bicho: Bugs.butterfly),
      FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.white, bicho: Bugs.beetle),
      FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.yellow, bicho: Bugs.ladybug),
      FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.pink, bicho: Bugs.moth),

      //ArrangementCard(tipoDeCarta: TypesOfCards.arrangement, flor: Flowers.poppy, col: Colors.orange, bicho: Bugs.moth),

      DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.simple, requerimiento: Bugs.bee, puntos: [3]),
      DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.same, requerimiento: Bugs.indifferent, puntos: [0,2,4,7,10]),
    ];
    Game game = Game();
    game.setDeck(miDeck);
    expect(game.obtainDeckScore(), equals(3));
    });
    test('Obtener puntaje de 5 con desire cards', () {
      List<Card> miDeck = [
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.pink),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.purple, bicho: Bugs.bee),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.orange, bicho: Bugs.butterfly),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.white, bicho: Bugs.beetle),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.yellow, bicho: Bugs.ladybug),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.pink, bicho: Bugs.moth),

        //ArrangementCard(tipoDeCarta: TypesOfCards.arrangement, flor: Flowers.poppy, col: Colors.orange, bicho: Bugs.moth),

        DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.simple, requerimiento: Bugs.bee, puntos: [3]),
        DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.simple, requerimiento: Flowers.mum, puntos: [2]),
        DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.simple, requerimiento: Colors.yellow, puntos: [2]),
        DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.same, requerimiento: Bugs.indifferent, puntos: [0,2,4,7,10]),
      ];
      Game game = Game();
      game.setDeck(miDeck);
      expect(game.obtainDeckScore(), equals(5));
    });
    test('Obtener puntaje de 9 con desire cards', () {
      List<Card> miDeck = [
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.pink, bicho: Bugs.beetle),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.purple, bicho: Bugs.bee),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.orange, bicho: Bugs.butterfly),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.white, bicho: Bugs.beetle),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.yellow, bicho: Bugs.butterfly),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.pink, bicho: Bugs.butterfly),

        //ArrangementCard(tipoDeCarta: TypesOfCards.arrangement, flor: Flowers.poppy, col: Colors.orange, bicho: Bugs.moth),

        DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.simple, requerimiento: Bugs.bee, puntos: [3]),
        DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.simple, requerimiento: Flowers.mum, puntos: [2]),
        DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.simple, requerimiento: Colors.yellow, puntos: [2]),
        DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.same, requerimiento: Bugs.indifferent, puntos: [0,2,4,7,10]),
      ];
      Game game = Game();
      game.setDeck(miDeck);
      expect(game.obtainDeckScore(), equals(9));
    });
    test('Obtener puntaje con arrangement cards', () {
      List<Card> miDeck = [
      FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.pink),
      FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.purple, bicho: Bugs.bee),
      FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.orange, bicho: Bugs.moth),
      FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.white, bicho: Bugs.beetle),
      FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.orange, bicho: Bugs.ladybug),
      FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.pink, bicho: Bugs.moth),

      ArrangementCard(tipoDeCarta: TypesOfCards.arrangement, flor: Flowers.poppy, col: Colors.orange, bicho: Bugs.moth),

      //DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.simple, requerimiento: Bugs.bee, puntos: [3]),
      //DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.same, requerimiento: Bugs.indifferent, puntos: [0,2,4,7,10]),
    ];
    Game game = Game();
    game.setDeck(miDeck);
    expect(game.obtainDeckScore(), equals(5));
    });
    test('Obtener puntaje con arrangement cards y desire cards', () {
      List<Card> miDeck = [
      FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.pink),
      FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.purple, bicho: Bugs.bee),
      FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.orange, bicho: Bugs.moth),
      FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.white, bicho: Bugs.beetle),
      FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.orange, bicho: Bugs.ladybug),
      FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.pink, bicho: Bugs.moth),

      ArrangementCard(tipoDeCarta: TypesOfCards.arrangement, flor: Flowers.poppy, col: Colors.orange, bicho: Bugs.moth),

      DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.simple, requerimiento: Bugs.bee, puntos: [3]),
      DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.same, requerimiento: Bugs.indifferent, puntos: [0,2,4,7,10]),
    ];
    Game game = Game();
    game.setDeck(miDeck);
    expect(game.obtainDeckScore(), equals(10));
    });
    test('Si al final queda la carta de te son 2 puntos', () {
      Game game = Game();
      expect(game.obtainCupOfTeaCardScore(), equals(2));
    });
    test('Obtener puntaje de todas bounty Cards completadas dia 1 es 15', () {
      
      List <BountyCard> myBountyCards = [
        BountyCard(requerimiento1: Flowers.tulip, requerimiento2: Bugs.ladybug, requerimiento3: Bugs.butterfly),
        BountyCard(requerimiento1: Flowers.tulip, requerimiento2: Flowers.tulip, requerimiento3: Flowers.daisy),
        BountyCard(requerimiento1: Bugs.beetle, requerimiento2: Bugs.ladybug, requerimiento3: Bugs.bee)
      ];
      Game game = Game();
      for (var element in myBountyCards) {
        element.compleatedAtDay(1);
      }
      game.setBountyCards(myBountyCards.toList());
      expect(game.obtainBountyCardsScore(), equals(15));

    });
    test('5 piedras son 2 pts', () {
      Game game = Game();
      game.setStones(5);
      expect(game.obtainStonesScore(), equals(2));
    });
  
  });
  group('Turns & Days: ', () {
    
    test('Despues de turno es columna 2', () {
      Game game = Game();
      game.nextColumn();
      expect(game.column, equals(2));
    });
    test('Despues de 5 turnos es columna 1 de nuevo', () {
      Game game = Game();
      game.nextColumn();
      game.nextColumn();
      game.nextColumn();
      game.nextColumn();
      game.nextColumn();
      expect(game.column, equals(1));
    });
    test('Despues de los 3 dias es "gameover"', () {
      Game game = Game();
      game.endOfDay(ListsOfCards().gardenCards);
      game.endOfDay(ListsOfCards().gardenCards);
      game.endOfDay(ListsOfCards().gardenCards);
      bool isGameOver = game.isGameOver;
      expect(isGameOver, equals(true));
    });
    
  });
  group('Jugabilidad:', () {
    test('Tomar tarjeta de columa 1 renglon 1', () {
      Game game = Game();
      game.takeCard(1);
      Card c1 = game.deck.elementAt(0);
      Card c2 = game.row1.elementAt(0);

      expect(c1 == c2, equals(true));

    });
    test('Tarjeta tomada dice que esta tomada', () {
      Game game = Game();
      //game.imprimirTablero();
      game.takeCard(1);
      //game.imprimirTablero();
      

      expect(game.row1.elementAt(0).isThere, equals(false));

    });
    test('Tarjeta tomada cambia a siguiente columna', () {
      Game game = Game();
      game.takeCard(1);
      game.nextColumn();
      expect(game.column, equals(2));
    });
    test('Tomar 4 cartas sigue siendo dia 1', () {
      Game game = Game();
      game.takeCard(1); game.nextColumn();
      game.takeCard(2); game.nextColumn();
      game.takeCard(3); game.nextColumn();
      game.takeCard(2); game.nextColumn();
      //game.imprimirTablero();
      expect(game.day, equals(1));
    });
    test('Tomar una tarjeta con piedra la da al jugador', () {
      Game game = Game();
      game.takeCard(2);
      //game.imprimirTablero();
      expect(game.stones, equals(1));
    });
    test('Si se usa carta de te es "true"', () {
      Game game = Game();
      game.useCupOfTea();
      expect(game.usedCupOfTeaCard, equals(true));
    });
    test('Si se toman solo pierdras desaparecen del tablero y se suman', () {
      Game game = Game();
      CrowCard crowC = CrowCard(renglon: 3, reemplazo: CrowReplacements.stone, numeroDePiedras: 2);
      game.crowActs(crowC);
      game.takeCard(3);
      expect(game.stones, equals(2));
    });
    test('Despues de turno jugador es turno del cuervo', () {
      Game game = Game();
      game.useCupOfTea();
      game.endOfTurn();
      //game.printGameboard();
      
    });

  });
  group('Jugabilidad del cuervo:', () {
    test('Cuervo reemplaza carta y deja 2 piedras', () {
      Game game = Game();
      CrowCard crowC = CrowCard(renglon: 3, reemplazo: CrowReplacements.stone, numeroDePiedras: 2);
      game.crowActs(crowC);
      bool didHappen = (game.row3.elementAt(0).isThere == false) && (game.row3.elementAt(0).stonesInSpace == 2);
      //game.imprimirTablero();
      expect(didHappen, equals(true));
    });
    test('Cuervo reemplaza carta desire con otra', () {
      Game game = Game();
      DesireCard c1 = game.row3.first;
      CrowCard crowC = CrowCard(renglon: 3, reemplazo: CrowReplacements.card);
      //game.imprimirTablero();
      game.crowActs(crowC);
      DesireCard c2 = game.row3.first;
      //game.imprimirTablero();
      expect(c1 == c2, equals(false));
    });
    test('Que pasa al tomar cartas que isThere==false y dejo piedras el cuervo', () {
      Game game = Game();
      CrowCard crowC = CrowCard(renglon: 3, reemplazo: CrowReplacements.stone, numeroDePiedras: 2);
      game.crowActs(crowC);
      game.takeCard(3);
      //game.imprimirTablero();
      expect(game.stones, equals(2));
    });
    test('Cuando cuervo reemplaza carta ren3 queda UpsideDown', () {
      Game game = Game();
      CrowCard crowC = CrowCard(renglon: 3, reemplazo: CrowReplacements.card, numeroDePiedras: 2);
      //game.imprimirTablero();
      game.crowActs(crowC);
      //game.imprimirTablero();
      expect(game.row3[0].isUpsidedown, equals(true));
    });
    test('Cuando cuervo reemplaza carta ren2 queda UpsideDown', () {
      Game game = Game();
      CrowCard crowC = CrowCard(renglon: 2, reemplazo: CrowReplacements.card, numeroDePiedras: 2);
      //game.imprimirTablero();
      game.crowActs(crowC);
      //game.imprimirTablero();
      expect(game.row2[0].isUpsidedown, equals(true));
    });
    test('Cuervo puede quitar carta', () {
      List<Card> miDeck = [
      FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.pink),
      FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.purple, bicho: Bugs.bee),
      FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.orange, bicho: Bugs.butterfly),
      FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.white, bicho: Bugs.beetle),
      FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.yellow, bicho: Bugs.ladybug),
      FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.pink, bicho: Bugs.moth),
    ];
      Game game = Game();
      game.setDeck(miDeck.toList());
      int d1 = game.deck.length;
      game.crowTakesCardAtPosition(1);
      int d2 = game.deck.length;
      expect(d1 == d2, equals(false));
    });
    test('Si cuervo tiene 4 o mas piedras se debe pagar carta', () {
      Game game = Game();
      game.crow.addStones(4);
      expect(game.crow.crowHasEnoughStonesToTakeACard(), equals(true));
    });
    
    
  });
  
}

