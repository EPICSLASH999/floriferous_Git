//import 'dart:developer';
//import 'dart:ffi';
//import 'dart:html';
//import 'dart:math';

import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
//import 'package:floriferous/floriferous.dart';
import 'package:test/test.dart';



void main() {

  group('Cards: ', () {
    test('Tamaño de cards = 55', () {
    expect(gardenCards.length, equals(55));
  });
    test('Tarjeta de Flores es tipo "Flower"', () {
      FlowerCard card = FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.daisy, col: Colors.orange);
      expect(card.typeOfCard, equals(TypesOfCards.flower));
    });
    test('Requerimiento1 de BountyCard1 es "tulip"', () {
      BountyCard bounty = bountyCards.elementAt(0);
      expect(bounty.requirement1, equals(Flowers.tulip));
    });
    test('Tamaño de bountyCards es 9', () {
      expect(bountyCards.length, equals(9));
    });
    test('La primera carta de gardenCards es color "Orange"', () {
      GardenCard card = gardenCards.elementAt(0);
      expect(card._color, equals(Colors.orange));
    });
    test('La primera carta de gardenCards es tipo "Flower"', () {
      GardenCard card = gardenCards.elementAt(0);
      expect(card._typeOfCard, equals(TypesOfCards.flower));
    });
    test('Cast as FlowerCard from GardenCard', () {
      FlowerCard card = gardenCards.elementAt(0) as FlowerCard;
      expect(card, equals(isA<FlowerCard>()));
    });
    test('Las cartas no tienen piedra por "omisión"', () {
      FlowerCard card = gardenCards.elementAt(0) as FlowerCard;
      expect(card.hasStone, equals(false));
    });
    test('Primera carta de nueva lista de bounties es igual a index 0 de bountyCards', () {
      List<BountyCard> bounties = bountyCards.toList();
      BountyCard bCard = bounties.elementAt(0);
      //print(bCard);
      expect(bCard, equals(bountyCards.elementAt(0)));
    });
    test('Bounties barajeadas no es igual a lista original', () {
      List<BountyCard> randomBounties = shuffleBountyCards(bountyCards.toList());

      //print(randomBounties.elementAt(0));
      //print(bountyCards.elementAt(0));

      expect(randomBounties.equals(bountyCards), equals(false));
    });
    test('GardenCards barajeadas no es igual a lista original', () {
      List<GardenCard> randomCards = shuffleGardenCards(gardenCards.toList());

      //print(randomCards.elementAt(0));
      //print(gardenCards.elementAt(0));

      expect(randomCards.equals(gardenCards), equals(false));
    });  
    test('DesireCards son 21', () {
      expect(desireCards.length, equals(21));
    });
    test('DesireCard 1 es tipo Simple', () {
      DesireCard card = desireCards.elementAt(0);
      expect(card.typeOfDesire, TypesOfDesire.simple);
    });
    test('CrowCards son 9', () {
      expect(crowCards.length, equals(9));
    });    
    test('CrowCards barajeadas no es igual a lista original', () {
      List<CrowCard> cards = shuffleCrowCards(crowCards.toList());
      //print(cards.elementAt(0));
      //print(crowCards.elementAt(0));
      expect(cards.equals(crowCards), equals(false));
    });
    

  });
  group('In Game Cards: ', () {
    test('Tarjeta tomada de mazo es la ultima', () {
      Game game = Game();
      game._gardenCards = gardenCards.toList();
      GardenCard card = game.drawGardenCard();

      //print(gardenCards.elementAt(gardenCards.length-1));
      //print(card);

      expect(gardenCards.elementAt(gardenCards.length-1), equals(card));

    });
    test('Al tomar tarjeta se elimina del bonche', () {
      Game game = Game();
      game._gardenCards = gardenCards.toList();
      int longitudInicial = game._gardenCards.length;

      game.drawGardenCard();
      int longitudFinal = game._gardenCards.length;

      //print(longitudFinal);

      expect(longitudInicial == longitudFinal, equals(false));
    
  });
    test('El total de garden cards disminuye a 45 tras contruir el tablero', () {
      Game game = Game();
      //print(game.gardenCards);
      expect(game.getGardenCards().length, equals(45));
    });
    test('Game ha generado sus 3 bounty cards', () {
      Game game = Game();
      //print(game.GetBountyCards());
      expect(game.getBountyCards().length, equals(3));
    });
    test('Generar dia toma 10 tarjetas de Jardin', () {
      Game game = Game();
      
      int sum = game.row1.length + game.row2.length;

      expect(sum, equals(10));
    });
    test('Generar dia deja 45 tarjeas de jardin', () {
      Game game = Game();
      expect(game._gardenCards.length, equals(45));
    });
    test('Generar dia toma 3 tarjetas de Bounty', () {
      Game game = Game();
      //print(game._bountyCards);
      expect(game._bountyCards.length, equals(3));
    });
    test('En Row 1... Cards 2 y 4 estan volteadas', () {
      Game game = Game();
      bool volteada = (game.row1.elementAt(1)._isUpsidedown && game.row1.elementAt(3)._isUpsidedown);
      //print('${game.row1.elementAt(0)._isUpsidedown} ${game.row1.elementAt(1)._isUpsidedown} ${game.row1.elementAt(2)._isUpsidedown} '+
      //'${game.row1.elementAt(3)._isUpsidedown} ${game.row1.elementAt(4)._isUpsidedown}');
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
      expect(game.getDesireCards().length, equals(16));
    });
    test('Draw CrowCard toma la ultima y la resta a la baraja', () {
      Game game = Game();
      //CrowCard card1 = game._crowCards.elementAt(game._crowCards.length-1);
      game.drawCrowCard();
      //print(card1);
      //print(card2);
      expect(game._crowCards.length, equals(8));
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

      expect(game._crowCards.length, equals(8));
    });
    test('Esta bocaabajo una DesireCard', () {
      Game game = Game();
      //print(game.row3.elementAt(0)._isUpsidedown);
      game.row3.elementAt(0)._isUpsidedown = true;
      expect(game.row3.elementAt(0)._isUpsidedown, equals(true));
    });
  });
  group('Puntajes Desire Simples: ', () {   
    test('3 flores de color amarillo son 6 puntos', () {
      List<Card> misCartas = [
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.purple),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.purple, bicho: Bugs.butterfly),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.orange, bicho: Bugs.beetle),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.white, bicho: Bugs.ladybug),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.pink, bicho: Bugs.bee),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow, bicho: Bugs.moth),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.white),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.orange),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.pink),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.yellow)
      ];
      DesireCard desireC = desireCards.elementAt(2);
      int score = desireC.obtainScore(misCartas);
      expect(score, equals(6));
    });
    test('4 abejas son 12 puntos', () {
      List<Card> misCartas = [
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow, bicho: Bugs.bee),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.purple),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.purple, bicho: Bugs.butterfly),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.orange, bicho: Bugs.beetle),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.white, bicho: Bugs.ladybug),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.pink, bicho: Bugs.bee),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow, bicho: Bugs.moth),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.white),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.orange),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.pink, bicho: Bugs.bee),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.yellow, bicho: Bugs.bee)
      ];
      DesireCard desireC = DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.simple, requerimiento: Bugs.bee, puntos: [3]);
      int score = desireC.obtainScore(misCartas);
      expect(score, equals(12));
    });
    test('3 mum son 6 puntos', () {
      List<Card> misCartas = [
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.purple, bicho: Bugs.butterfly),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.orange, bicho: Bugs.beetle),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.white, bicho: Bugs.ladybug),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.white),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.orange),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.pink, bicho: Bugs.bee),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.yellow, bicho: Bugs.bee)
      ];
      DesireCard desireC = DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.simple, requerimiento: Flowers.mum, puntos: [2]);
      int score = desireC.obtainScore(misCartas);
      expect(score, equals(6));
    });
    test('1 abejas son 3 puntos', () {
      List<Card> misCartas = [
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.purple, bicho: Bugs.butterfly),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.orange, bicho: Bugs.beetle),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.white, bicho: Bugs.ladybug),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.white, bicho: Bugs.ladybug),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.orange, bicho: Bugs.ladybug),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.pink, bicho: Bugs.bee),
      ];
      DesireCard desireC = DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.simple, requerimiento: Bugs.bee, puntos: [3]);
      int score = desireC.obtainScore(misCartas);
      expect(score, equals(3));
    });
    test('0 abejas son 0 puntos', () {
      List<Card> misCartas = [
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.purple, bicho: Bugs.butterfly),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.orange, bicho: Bugs.beetle),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.white, bicho: Bugs.ladybug),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.white, bicho: Bugs.ladybug),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.orange, bicho: Bugs.ladybug),
      ];
      DesireCard desireC = DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.simple, requerimiento: Bugs.bee, puntos: [3]);
      int score = desireC.obtainScore(misCartas);
      expect(score, equals(0));
    });
  });
  group('Puntajes Desire Same: ', () {
    test('Obtener que flor aparece más', () {
      List<Card> misCartas = [
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.orange),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.pink),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.white),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.purple),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.purple, bicho: Bugs.butterfly),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.orange, bicho: Bugs.beetle),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.white, bicho: Bugs.ladybug),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.pink, bicho: Bugs.bee),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow, bicho: Bugs.moth),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.white),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.orange),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.pink),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.yellow)
      ];
      DesireCard desireC = desireCards.elementAt(1);
      expect(desireC.obtainMaxSameOccurence(misCartas).keys.first, equals(Flowers.mum));
    });
    test('Obtener que color aparece más', () {
      List<Card> misCartas = [
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.pink),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.purple, bicho: Bugs.butterfly),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.orange, bicho: Bugs.beetle),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.pink, bicho: Bugs.bee),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow, bicho: Bugs.moth),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.white),
      ];
      DesireCard desireC = desireCards.elementAt(2);
      expect(desireC.obtainMaxSameOccurence(misCartas).keys.first, equals(Colors.pink));
    });
    test('Obtener que insecto aparece más', () {
      List<Card> misCartas = [
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.orange),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.pink),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.white),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.purple),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.purple, bicho: Bugs.butterfly),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.orange, bicho: Bugs.beetle),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.white, bicho: Bugs.ladybug),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.pink, bicho: Bugs.bee),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow, bicho: Bugs.moth),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.white),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.orange),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.pink),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.yellow, bicho: Bugs.moth)
      ];
      DesireCard desireC = desireCards.elementAt(0);
      expect(desireC.obtainMaxSameOccurence(misCartas).keys.first, equals(Bugs.moth));
    });   
    test('Mayormente 3 flores amarillas son 2 puntos', () {
      List<Card> misCartas = [
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.purple),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.purple, bicho: Bugs.butterfly),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.orange, bicho: Bugs.beetle),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.white, bicho: Bugs.ladybug),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.pink, bicho: Bugs.bee),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow, bicho: Bugs.moth),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.white),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.orange),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.pink),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.yellow)
      ];
      DesireCard desireC = DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.same, requerimiento: Colors.indifferent, puntos: [0,1,2,4,7]);
      int score = desireC.obtainScore(misCartas);
      expect(score, equals(2));
    });
    test('Mayormente 6 flores amarillas son 7 puntos', () {
      List<Card> misCartas = [
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.purple, bicho: Bugs.butterfly),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.orange, bicho: Bugs.beetle),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow, bicho: Bugs.ladybug),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow, bicho: Bugs.bee),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow, bicho: Bugs.moth),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.white),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.orange),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.pink),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.yellow)
      ];
      DesireCard desireC = DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.same, requerimiento: Colors.indifferent, puntos: [0,1,2,4,7]);
      int score = desireC.obtainScore(misCartas);
      expect(score, equals(7));
    });
    test('Mayormente ningun insecto son 0 puntos', () {
      List<Card> misCartas = [
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.purple),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.white),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.orange),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.pink),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.yellow)
      ];
      DesireCard desireC = DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.same, requerimiento: Bugs.indifferent, puntos: [0,1,2,4,7]);
      int score = desireC.obtainScore(misCartas);
      expect(score, equals(0));
    });
  });
  group('Puntajes Desire Different: ', () {
    test('1 insectos diferente son 0 pts', () {
      List<Card> misCartas = [
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow, bicho: Bugs.butterfly),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.white),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.orange),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.pink),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.yellow)
      ];
      DesireCard desireC = DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.different, requerimiento: Bugs.indifferent, puntos: [0,1,2,4,7]);
      int score = desireC.obtainScore(misCartas);
      expect(score, equals(0));
    });
    test('2 insectos diferentes son 1 pts', () {
      List<Card> misCartas = [
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow, bicho: Bugs.butterfly),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.orange, bicho: Bugs.beetle),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow, bicho: Bugs.ladybug),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow, bicho: Bugs.bee),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow, bicho: Bugs.moth),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.white),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.orange),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.pink),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.yellow)
      ];
      DesireCard desireC = DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.different, requerimiento: Bugs.indifferent, puntos: [0,1,2,4,7]);
      int score = desireC.obtainScore(misCartas);
      expect(score, equals(7));
    });
    test('3 insectos diferentes son 2 pts', () {
      List<Card> misCartas = [
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.purple, bicho: Bugs.butterfly),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.orange, bicho: Bugs.beetle),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow, bicho: Bugs.ladybug),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.white),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.orange),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.pink),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.yellow)
      ];
      DesireCard desireC = DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.different, requerimiento: Bugs.indifferent, puntos: [0,1,2,4,7]);
      int score = desireC.obtainScore(misCartas);
      expect(score, equals(2));
    });
    test('5 insectos diferentes son 7 pts', () {
      List<Card> misCartas = [
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.purple, bicho: Bugs.butterfly),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.orange, bicho: Bugs.beetle),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow, bicho: Bugs.ladybug),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow, bicho: Bugs.bee),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow, bicho: Bugs.moth),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.white),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.orange),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.pink),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.yellow)
      ];
      DesireCard desireC = DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.different, requerimiento: Bugs.indifferent, puntos: [0,1,2,4,7]);
      int score = desireC.obtainScore(misCartas);
      expect(score, equals(7));
    });
    test('0 insectos diferentes son 0 pts', () {
      List<Card> misCartas = [
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.white),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.orange),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.pink),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.yellow)
      ];
      DesireCard desireC = DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.different, requerimiento: Bugs.indifferent, puntos: [0,1,2,4,7]);
      int score = desireC.obtainScore(misCartas);
      expect(score, equals(0));
    });
    test('Muchos insectos repetidos pero 5 diferentes son 7 pts', () {
      List<Card> misCartas = [
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow, bicho: Bugs.butterfly),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow, bicho: Bugs.butterfly),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.purple, bicho: Bugs.butterfly),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.orange, bicho: Bugs.beetle),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow, bicho: Bugs.ladybug),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow, bicho: Bugs.bee),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow, bicho: Bugs.moth),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.white),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.orange),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.pink),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.yellow)
      ];
      DesireCard desireC = DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.different, requerimiento: Bugs.indifferent, puntos: [0,1,2,4,7]);
      int score = desireC.obtainScore(misCartas);
      expect(score, equals(7));
    });
    test('2 insectos diferentes pero repetidos son 1 pts', () {
      List<Card> misCartas = [
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow, bicho: Bugs.butterfly),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.orange, bicho: Bugs.beetle),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.white, bicho: Bugs.butterfly),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.orange, bicho: Bugs.butterfly),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.pink),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.yellow)
      ];
      DesireCard desireC = DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.different, requerimiento: Bugs.indifferent, puntos: [0,1,2,4,7]);
      int score = desireC.obtainScore(misCartas);
      expect(score, equals(1));
    });
 
  });
  group('Puntaje ArrangementCards', () {
    test('Obtener puntaje SOLO con arrangement card', () {
      List<Card> miDeck = [
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.pink, bicho: Bugs.beetle),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.purple, bicho: Bugs.bee),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.orange, bicho: Bugs.moth),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.pink, bicho: Bugs.beetle),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.yellow, bicho: Bugs.butterfly),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.orange, bicho: Bugs.bee),
      ];
      ArrangementCard arrangementC = ArrangementCard(tipoDeCarta: TypesOfCards.arrangement, flor: Flowers.poppy, col: Colors.orange, bicho: Bugs.moth);
      int score = arrangementC.obtainScore(miDeck);
      expect(score, equals(5));
    });
    test('Obtener puntaje con arrangement card de 0 pts', () {
      List<Card> miDeck = [
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.purple, bicho: Bugs.bee),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.pink, bicho: Bugs.beetle),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.yellow, bicho: Bugs.butterfly),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.pink, bicho: Bugs.bee),
      ];
      ArrangementCard arrangementC = ArrangementCard(tipoDeCarta: TypesOfCards.arrangement, flor: Flowers.poppy, col: Colors.orange, bicho: Bugs.moth);
      int score = arrangementC.obtainScore(miDeck);
      expect(score, equals(0));
    });
    test('Arrangement cards distingue solo las carteas de flores', () {
      List<Card> miDeck = [
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.purple, bicho: Bugs.bee),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.pink, bicho: Bugs.beetle),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.yellow, bicho: Bugs.butterfly),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.pink, bicho: Bugs.bee),

        ArrangementCard(tipoDeCarta: TypesOfCards.arrangement, flor: Flowers.poppy, col: Colors.orange, bicho: Bugs.moth),
        ArrangementCard(tipoDeCarta: TypesOfCards.arrangement, flor: Flowers.poppy, col: Colors.orange, bicho: Bugs.moth),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.orange, bicho: Bugs.bee),
      ];
      ArrangementCard arrangementC = ArrangementCard(tipoDeCarta: TypesOfCards.arrangement, flor: Flowers.poppy, col: Colors.orange, bicho: Bugs.moth);
      int score = arrangementC.obtainScore(miDeck);
      expect(score, equals(1));
    });
    test('Arrangement card toma la carta que mas le conviene al jugador', () {
      List<Card> miDeck = [
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.pink, bicho: Bugs.beetle),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.purple, bicho: Bugs.bee),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.orange, bicho: Bugs.moth),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.pink, bicho: Bugs.beetle),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.yellow, bicho: Bugs.butterfly),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.pink, bicho: Bugs.moth),
      ];
      ArrangementCard arrangementC = ArrangementCard(tipoDeCarta: TypesOfCards.arrangement, flor: Flowers.poppy, col: Colors.orange, bicho: Bugs.moth);
      int score = arrangementC.obtainScore(miDeck);
      expect(score, equals(5));
    });
    test('Arrangement card toma la carta que mas le conviene al jugador (Prueba 2)', () {
      List<Card> miDeck = [
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.white, bicho: Bugs.beetle),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.tulip, col: Colors.pink, bicho: Bugs.bee),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.tulip, col: Colors.white, bicho: Bugs.butterfly),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.tulip, col: Colors.white, bicho: Bugs.bee),
      ];
      ArrangementCard arrangementC = ArrangementCard(tipoDeCarta: TypesOfCards.arrangement, flor: Flowers.tulip, col: Colors.pink, bicho: Bugs.bee);
      int score = arrangementC.obtainScore(miDeck);
      expect(score, equals(5));
    });
  });
  group('Puntajes de BountyCards', () {
    test('Puntaje de bountycard en dia 0 es 0', () {
      List<Card> miDeck = [
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.white, bicho: Bugs.bee),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.tulip, col: Colors.pink, bicho: Bugs.ladybug),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.tulip, col: Colors.white, bicho: Bugs.butterfly),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.tulip, col: Colors.white, bicho: Bugs.bee),
      ];
      BountyCard bountyC = BountyCard(requerimiento1: Flowers.tulip, requerimiento2: Bugs.ladybug, requerimiento3: Bugs.butterfly);
      //BountyCard bountyC = BountyCard(requerimiento1: Flowers.tulip, requerimiento2: Flowers.tulip, requerimiento3: Flowers.daisy);
      bountyC.checkIfCompleated(miDeck, 0);
      
      expect(bountyC.obtainScore(), equals(0));
    });
    test('Puntaje de bountycard en dia 1 es 5', () {
      List<Card> miDeck = [
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.white, bicho: Bugs.bee),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.tulip, col: Colors.pink, bicho: Bugs.ladybug),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.tulip, col: Colors.white, bicho: Bugs.butterfly),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.tulip, col: Colors.white, bicho: Bugs.bee),
      ];
      BountyCard bountyC = BountyCard(requerimiento1: Flowers.tulip, requerimiento2: Bugs.ladybug, requerimiento3: Bugs.butterfly);
      //BountyCard bountyC = BountyCard(requerimiento1: Flowers.tulip, requerimiento2: Flowers.tulip, requerimiento3: Flowers.daisy);
      bountyC.checkIfCompleated(miDeck, 1);
      
      expect(bountyC.obtainScore(), equals(5));
    });
    test('Puntaje de bountycard en dia 2 es 3', () {
      List<Card> miDeck = [
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.white, bicho: Bugs.bee),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.tulip, col: Colors.pink, bicho: Bugs.ladybug),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.tulip, col: Colors.white, bicho: Bugs.butterfly),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.tulip, col: Colors.white, bicho: Bugs.bee),
      ];
      BountyCard bountyC = BountyCard(requerimiento1: Flowers.tulip, requerimiento2: Bugs.ladybug, requerimiento3: Bugs.butterfly);
      //BountyCard bountyC = BountyCard(requerimiento1: Flowers.tulip, requerimiento2: Flowers.tulip, requerimiento3: Flowers.daisy);
      bountyC.checkIfCompleated(miDeck, 2);
      
      expect(bountyC.obtainScore(), equals(3));
    });
    test('Puntaje de bountycard en dia 3 es 2', () {
      List<Card> miDeck = [
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.white, bicho: Bugs.bee),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.tulip, col: Colors.pink, bicho: Bugs.ladybug),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.tulip, col: Colors.white, bicho: Bugs.butterfly),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.tulip, col: Colors.white, bicho: Bugs.bee),
      ];
      BountyCard bountyC = BountyCard(requerimiento1: Flowers.tulip, requerimiento2: Bugs.ladybug, requerimiento3: Bugs.butterfly);
      //BountyCard bountyC = BountyCard(requerimiento1: Flowers.tulip, requerimiento2: Flowers.tulip, requerimiento3: Flowers.daisy);
      bountyC.checkIfCompleated(miDeck, 3);
      
      expect(bountyC.obtainScore(), equals(2));
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
      game._bountyCards = myBountyCards.toList();
      game.endOfDay(miDeck);
      bool isAtLeastOneCompleated = game._bountyCards.elementAt(1).isCompleated || game._bountyCards.elementAt(1).isCompleated || game._bountyCards.elementAt(2).isCompleated;
      expect(isAtLeastOneCompleated, equals(true));
    });
    test('Comprobar que No se llene una bountycard que ya cumplio un requisito', () {
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

      BountyCard bountyC = BountyCard(requerimiento1: Flowers.tulip, requerimiento2: Flowers.tulip, requerimiento3: Flowers.daisy);
      bountyC.checkIfCompleated(miDeck, 1);
      bool compleated = bountyC.isCompleated;
      expect(compleated, equals(false));
    });
    test('Despues de los 3 dias es "gameover"', () {
      Game game = Game();
      game.endOfDay(gardenCards);
      game.endOfDay(gardenCards);
      game.endOfDay(gardenCards);
      bool isGameOver = game._gameOver;
      expect(isGameOver, equals(true));
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
    game._deck = miDeck;
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
      game._deck = miDeck;
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
      game._deck = miDeck;
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
    game._deck = miDeck;
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
    game._deck = miDeck;
    expect(game.obtainDeckScore(), equals(10));
    });
    test('Si al final queda la carta de te son 2 puntos', () {
      Game game = Game();
      expect(game.obtainCupOfTeaCardScore(), equals(2));
    });
    test('Obtener puntaje de todas bounty Cards completadas dia 1 es 15', () {
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
      for (var element in myBountyCards) {
        element.compleatedAtDay(1);
      }
      game._bountyCards = myBountyCards.toList();
      expect(game.obtainBountyCardsScore(), equals(15));

    });
    test('5 piedras son 2 pts', () {
      Game game = Game();
      game._stones = 5;
      expect(game.obtainStonesScore(), equals(2));
    });
  
  });
  group('Turns: ', () {
    
    test('Despues de turno es columna 2', () {
      Game game = Game();
      game.nextTurn();
      expect(game.column, equals(2));
    });
    test('Despues de 5 turnos es columna 1 de nuevo', () {
      Game game = Game();
      game.nextTurn();
      game.nextTurn();
      game.nextTurn();
      game.nextTurn();
      game.nextTurn();
      expect(game.column, equals(1));
    });
    
    
  });
  group('Tablero Grafico: ', () {
    test('Imprimir BountyCards Row', () {
      Game game = Game();
      game.printBountyCardsZone();
    });
    test('Imprimir Todo Row', () {
      Game game = Game();
      game.imprimirTablero();
    });
  });


}
/* -------------------------------- GAME -------------------------------------- */
class Game{
  List<BountyCard> _bountyCards = [];
  List<GardenCard> _gardenCards = [];
  List<DesireCard> _desireCards = [];
  List<CrowCard> _crowCards = [];

  List<GardenCard> row1 = [];
  List<GardenCard> row2 = [];
  List<DesireCard> row3 = [];

  List<Card> _deck = [];

  int _finalScore = 0;
  int get finalScore => _finalScore;

  int day = 1;
  int column = 1;

  bool _usedCupOfTeaCard = false;

  int _stones = 0;

  bool _gameOver = false;

  Game(){
    _gardenCards = shuffleGardenCards(gardenCards.toList()).toList();
    _desireCards = shuffleDesireCards(desireCards.toList()).toList();
    _crowCards = shuffleCrowCards(crowCards.toList()).toList();
    generateBountyRow();

    generateDay();
  }

  void generateDay() {
    generateGardenRows();
    setCardsOfGardenRows();
    generateDesireRow();
  }

  // GENERATE ROWS 
  void generateBountyRow() {
    List<BountyCard> shuffledBCards = shuffleBountyCards(bountyCards.toList()).toList();
    List<BountyCard> tempCards = [];
    for (var i = 0; i < 3; i++) {
      tempCards.add(shuffledBCards.elementAt(i));
    }
    _bountyCards = tempCards.toList();
  }
  void generateGardenRows(){
    row1 = drawGardenCards(5).toList();
    row2 = drawGardenCards(5).toList();
  }
  void setCardsOfGardenRows(){

    row1.elementAt(1).TurnCard();
    row1.elementAt(3).TurnCard();

    row2.elementAt(0).hasStone = true;
    row2.elementAt(2).hasStone = true;
    row2.elementAt(4).hasStone = true;
  }
  void generateDesireRow() {
    row3 = drawDesireCards(5).toList();
  }
  
  // DRAW CARDS
  GardenCard drawGardenCard() {
    GardenCard card = _gardenCards.elementAt(_gardenCards.length-1);
    _gardenCards.removeAt(_gardenCards.length-1);
    return card;
  }
  List<GardenCard> drawGardenCards(int numberOfCards){
    List<GardenCard> tempCards = [];
    for (var i = 0; i < numberOfCards; i++) {
      tempCards.add(drawGardenCard());
    }
    return tempCards;
  }
  DesireCard drawDesireCard(){
    DesireCard card = _desireCards.elementAt(_desireCards.length-1);
    _desireCards.removeAt(_desireCards.length-1);
    return card;
  }
  List<DesireCard> drawDesireCards(int numberOfCards){
    List<DesireCard> tempCards = [];
    for (var i = 0; i < numberOfCards; i++) {
      tempCards.add(drawDesireCard());
    }
    return tempCards;
  }
  CrowCard drawCrowCard() {
    if (_crowCards.isEmpty){
      _crowCards = shuffleCrowCards(crowCards.toList()).toList();
    }

    CrowCard card = _crowCards.elementAt(_crowCards.length-1);
    _crowCards.removeAt(_crowCards.length-1);
    return card;
  }

  // TURSN & DAYS
  void nextTurn(){
    column++;
    if (column > 5) endOfDay(_deck);
  }
  void endOfDay(List<Card> myDeck) {
    day++;
    column = 1;
    for (var element in _bountyCards) {
      element.checkIfCompleated(myDeck, day);
    }
    if (day > 3) gameOver();
  }

  // END OF GAME
  void gameOver(){
    _gameOver = true;
  }

  // OBTAIN SCORE
  int obtainFinalScore(){
    _finalScore += obtainDeckScore();
    _finalScore += obtainBountyCardsScore();
    _finalScore += obtainCupOfTeaCardScore();
    _finalScore += obtainStonesScore();
    return _finalScore;
  }
  int obtainDeckScore(){
    int score = 0;
    for (var element in _deck) {
      if (element.typeOfCard == TypesOfCards.desire){
        element = element as DesireCard;
        score += element.obtainScore(_deck);
      }
      if (element.typeOfCard == TypesOfCards.arrangement){
        element = element as ArrangementCard;
        score += element.obtainScore(_deck);
      }
    }
    return score;
  }
  int obtainCupOfTeaCardScore(){
    if (!_usedCupOfTeaCard) return 2;
    return 0;
  }
  int obtainBountyCardsScore() {
    int score = 0;
    for (var element in _bountyCards) {
      score += element.obtainScore();
    }
    return score;
  }
  int obtainStonesScore(){
    return (_stones/2).floor();
  }

 /* ------ TABLERO GRAFICO ------ */
  void imprimirTablero(){
    printBountyCardsZone();
    print('DAY: $day');
    print('');
    printGardenCardsZone();
    print('');
    printDesireCardsZone();
    print('');
    print('Column: $column');

  }

  void printBountyCardsZone(){
    // ignore: prefer_interpolation_to_compose_strings
    String message = ('|| ${_bountyCards.elementAt(0).requirement1.name} ${_bountyCards.elementAt(0).requirement2.name} ${_bountyCards.elementAt(0).requirement3.name} || '+
          ' ${_bountyCards.elementAt(1).requirement1.name} ${_bountyCards.elementAt(1).requirement2.name} ${_bountyCards.elementAt(1).requirement3.name} ' +
         ' || ${_bountyCards.elementAt(2).requirement1.name} ${_bountyCards.elementAt(2).requirement2.name} ${_bountyCards.elementAt(2).requirement3.name} ||');

    String title = ' BOUNTY CARDS ';

    String line1 = '-' * ((message.length~/2) - title.length~/2);
    String line2 = '-' * (message.length);
    
    print('$line1$title$line1');
    print(message);
    print(line2);
  }
  void printGardenCardsZone(){
    List<GardenCard> row1 = this.row1;
    List<GardenCard> row2 = this.row2;
    List<DesireCard> row3 = this.row3;

    print(createGardenRow(row1));
    print(createGardenRow(row2));
    
  }
  void printDesireCardsZone(){
    print(createDesireRow(row3));
  }

  List<String> createGardenRow(List<GardenCard> row){
    List<String> line = [];
    for (var element in row) {
      line.add('${element._flower.toString().split('.').last}/${element._color.toString().split('.').last}/${element._bug.toString().split('.').last}');
    }
    return line;
  }
  List<String> createDesireRow(List<DesireCard> row){
    List<String> line = [];
    for (var element in row) {
      line.add('${element.points.toString()}/${element.typeOfDesire.toString().split('.').last}/${element.requirement.toString()}');
    }
    return line;
  }
  
 /* ----------------------------- */

  List<GardenCard> getRowsByColumn(){
    return [row1.elementAt(column-1), row2.elementAt(column-1)];

  }

  List<GardenCard> getGardenCards(){
    return _gardenCards;
  }
  List<BountyCard> getBountyCards(){
    return _bountyCards;
  }
  List<DesireCard> getDesireCards(){
    return _desireCards;
  }
  List<CrowCard> getCrowCards(){
    return _crowCards;
  }
  
  
  
  
}
/* ----------------------------- END OF GAME ---------------------------------- */


/* ---------------------------------------------------------------------------- */
/* ----------------------------------- CARDS ---------------------------------- */
// ENUMS
enum Flowers {daisy, lily, mum, poppy, tulip, indifferent}
enum Colors {white, yellow, orange, pink, purple, indifferent}
enum Bugs {bee, beetle, butterfly, ladybug, moth, none, indifferent}

enum TypesOfCards {flower, arrangement, desire}
enum TypesOfDesire {simple, same, different}
enum CrowReplacements {stone, card}

// LISTS
List<GardenCard> gardenCards = [
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.orange),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.pink),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.white),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.purple),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.purple, bicho: Bugs.butterfly),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.orange, bicho: Bugs.beetle),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.white, bicho: Bugs.ladybug),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.pink, bicho: Bugs.bee),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow, bicho: Bugs.moth),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.white),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.orange),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.pink),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.yellow),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.purple),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.purple, bicho: Bugs.beetle),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.pink, bicho: Bugs.butterfly),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.orange, bicho: Bugs.ladybug),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.yellow, bicho: Bugs.bee),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.white, bicho: Bugs.moth),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.tulip, col: Colors.pink),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.tulip, col: Colors.orange),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.tulip, col: Colors.white),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.tulip, col: Colors.yellow),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.tulip, col: Colors.purple),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.tulip, col: Colors.pink, bicho: Bugs.beetle),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.tulip, col: Colors.orange, bicho: Bugs.moth),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.tulip, col: Colors.white, bicho: Bugs.bee),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.tulip, col: Colors.yellow, bicho: Bugs.butterfly),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.tulip, col: Colors.purple, bicho: Bugs.ladybug),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.daisy, col: Colors.purple),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.daisy, col: Colors.pink),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.daisy, col: Colors.white),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.daisy, col: Colors.orange),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.daisy, col: Colors.yellow),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.daisy, col: Colors.purple, bicho: Bugs.moth),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.daisy, col: Colors.pink, bicho: Bugs.ladybug),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.daisy, col: Colors.white, bicho: Bugs.butterfly),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.daisy, col: Colors.orange, bicho: Bugs.bee),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.daisy, col: Colors.yellow, bicho: Bugs.beetle),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.purple),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.orange),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.white),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.yellow),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.pink),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.purple, bicho: Bugs.bee),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.orange, bicho: Bugs.butterfly),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.white, bicho: Bugs.beetle),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.yellow, bicho: Bugs.ladybug),
  FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.pink, bicho: Bugs.moth),

  ArrangementCard(tipoDeCarta: TypesOfCards.arrangement, flor: Flowers.poppy, col: Colors.orange, bicho: Bugs.moth),
  ArrangementCard(tipoDeCarta: TypesOfCards.arrangement, flor: Flowers.tulip, col: Colors.yellow, bicho: Bugs.ladybug),
  ArrangementCard(tipoDeCarta: TypesOfCards.arrangement, flor: Flowers.lily, col: Colors.purple, bicho: Bugs.butterfly),
  ArrangementCard(tipoDeCarta: TypesOfCards.arrangement, flor: Flowers.daisy, col: Colors.white, bicho: Bugs.bee),
  ArrangementCard(tipoDeCarta: TypesOfCards.arrangement, flor: Flowers.mum, col: Colors.pink, bicho: Bugs.beetle),
];
List <BountyCard> bountyCards = [
  BountyCard(requerimiento1: Flowers.tulip, requerimiento2: Bugs.ladybug, requerimiento3: Bugs.butterfly),
  BountyCard(requerimiento1: Flowers.tulip, requerimiento2: Flowers.tulip, requerimiento3: Flowers.daisy),
  BountyCard( requerimiento1: Bugs.beetle, requerimiento2: Bugs.ladybug, requerimiento3: Bugs.bee),
  BountyCard(requerimiento1: Flowers.lily, requerimiento2: Flowers.mum, requerimiento3: Flowers.tulip),
  BountyCard(requerimiento1: Flowers.daisy, requerimiento2: Flowers.mum, requerimiento3: Bugs.bee),
  BountyCard(requerimiento1: Flowers.lily, requerimiento2: Flowers.lily, requerimiento3: Bugs.ladybug),
  BountyCard(requerimiento1: Flowers.poppy, requerimiento2: Flowers.daisy, requerimiento3: Bugs.beetle),
  BountyCard(requerimiento1: Flowers.lily, requerimiento2: Flowers.poppy, requerimiento3: Bugs.moth),
  BountyCard(requerimiento1: Flowers.poppy, requerimiento2: Flowers.mum, requerimiento3: Bugs.butterfly)
  
];
List<DesireCard> desireCards = [
  DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.simple, requerimiento: Bugs.bee, puntos: [3]),
  DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.simple, requerimiento: Flowers.mum, puntos: [2]),
  DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.simple, requerimiento: Colors.yellow, puntos: [2]),
  DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.same, requerimiento: Bugs.indifferent, puntos: [0,2,4,7,10]),
  DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.simple, requerimiento: Bugs.butterfly, puntos: [3]),
  DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.simple, requerimiento: Colors.orange, puntos: [2]),
  DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.different, requerimiento: Colors.indifferent, puntos: [0,0,1,3,5]),
  DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.simple, requerimiento: Bugs.beetle, puntos: [3]),
  DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.simple, requerimiento: Colors.white, puntos: [2]),
  DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.simple, requerimiento: Bugs.ladybug, puntos: [3]),
  DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.simple, requerimiento: Flowers.lily, puntos: [2]),
  DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.same, requerimiento: Flowers.indifferent, puntos: [0,1,2,4,7]),
  DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.different, requerimiento: Flowers.indifferent, puntos: [0,0,1,3,5]),
  DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.simple, requerimiento: Colors.purple, puntos: [2]),
  DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.simple, requerimiento: Colors.pink, puntos: [2]),
  DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.same, requerimiento: Colors.indifferent, puntos: [0,1,2,4,7]),
  DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.simple, requerimiento: Flowers.tulip, puntos: [2]),
  DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.different, requerimiento: Bugs.indifferent, puntos: [0,1,2,4,7]),
  DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.simple, requerimiento: Bugs.moth, puntos: [3]),
  DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.simple, requerimiento: Flowers.daisy, puntos: [2]),
  DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.simple, requerimiento: Flowers.poppy, puntos: [2])
];
List<CrowCard> crowCards = [
  CrowCard(renglon: 3, reemplazo: CrowReplacements.stone, numeroDePiedras: 2),
  CrowCard(renglon: 3, reemplazo: CrowReplacements.stone, numeroDePiedras: 1),
  CrowCard(renglon: 3, reemplazo: CrowReplacements.card),
  CrowCard(renglon: 1, reemplazo: CrowReplacements.stone, numeroDePiedras: 2),
  CrowCard(renglon: 2, reemplazo: CrowReplacements.stone, numeroDePiedras: 2),
  CrowCard(renglon: 1, reemplazo: CrowReplacements.stone, numeroDePiedras: 1),
  CrowCard(renglon: 1, reemplazo: CrowReplacements.card),
  CrowCard(renglon: 2, reemplazo: CrowReplacements.stone, numeroDePiedras: 1),
  CrowCard(renglon: 2, reemplazo: CrowReplacements.card)
];

// CLASSES
class Card extends Equatable{

  late final TypesOfCards _typeOfCard;
  TypesOfCards get typeOfCard => _typeOfCard;

  bool _isUpsidedown = false;
  bool get isUpsidedown => _isUpsidedown;

  bool _isThere = true;
  int _stonesInSpace = 0;

  Card({required TypesOfCards tipoDeCarta}){
    _typeOfCard = tipoDeCarta;
  }
  @override
  List<Object?> get props => [];
}

class GardenCard extends Card{
  late final Flowers _flower;
  late final Colors _color;
  late final Bugs _bug; 

  Flowers get flower => _flower;
  Colors get color => _color;
  Bugs get bug => _bug;

  bool hasStone = false;

  // ignore: empty_constructor_bodies
  GardenCard({required super.tipoDeCarta}){
    
  }

  void TurnCard(){
    _isUpsidedown = !_isUpsidedown;
  }

  @override
  List<Object?> get props => [_flower, _color, _bug];

}

class FlowerCard extends GardenCard{

  FlowerCard({required super.tipoDeCarta, required Flowers flor,required Colors col, Bugs bicho = Bugs.none}){
    _flower = flor;
    _color = col;
    _bug = bicho;
  }


}

class ArrangementCard extends GardenCard{

  final List<int> points = [1,3,5];

  ArrangementCard({required super.tipoDeCarta, required Flowers flor,required Colors col, required Bugs bicho}){
    _flower = flor;
    _color = col;
    _bug = bicho;
  }
  
  int obtainScore2(List<Card> miDeck) {
    int counter = 0;
    List<Card> tempCards = miDeck.toList();

      for (var element in tempCards) {
        if (element.typeOfCard != TypesOfCards.flower) continue;
        element = element as FlowerCard;
        if (element._bug == _bug){
          tempCards.remove(element);
          counter++;
          break;
        }
      }
    
    for (var element in tempCards) {
        if (element.typeOfCard != TypesOfCards.flower) continue;
        element = element as FlowerCard;
        if (element._flower == _flower){
          tempCards.remove(element);
          counter++;
          break;
        }
    }

    for (var element in tempCards) {
        if (element.typeOfCard != TypesOfCards.flower) continue;
        element = element as FlowerCard;
        if (element._color == _color){
          tempCards.remove(element);
          counter++;
          break;
        }
    }
    if (counter == 0) return 0;
    return points[counter-1];
  }
  int obtainScore(List<Card> miDeck) {
    int counter = 0;
    List<Card> tempCards = miDeck.toList();
    Map map = {};

      for (var element in tempCards) {
        if (element.typeOfCard != TypesOfCards.flower) continue;
        element = element as FlowerCard;
        if (element._bug == _bug){
          if (!map.containsKey(element)) {
            map[element] = 1;
          } else {
            map[element] += 1;
          }
          if (element._flower == _flower) map[element] += 1;
          if (element._color == _color) map[element] += 1;
        }
      }
      List sortedValues = map.values.toList()..sort();
      if (sortedValues.isNotEmpty) {
        int leastValuableValue = sortedValues.first;
        var key = map.keys.firstWhere((k)
              => map[k] == leastValuableValue, orElse: () => null);
        tempCards.remove(key);
        counter++;
        map = {};
      }
      
      
    for (var element in tempCards) {
        if (element.typeOfCard != TypesOfCards.flower) continue;
        element = element as FlowerCard;
        if (element._flower == _flower){
          if (!map.containsKey(element)) {
            map[element] = 1;
          } else {
            map[element] += 1;
          }
          if (element._color == _color) map[element] += 1;
        }
    }
    sortedValues = map.values.toList()..sort();
      if (sortedValues.isNotEmpty) {
        int leastValuableValue = sortedValues.first;
        var key = map.keys.firstWhere((k)
              => map[k] == leastValuableValue, orElse: () => null);
        tempCards.remove(key);
        counter++;
        map = {};
      }

    for (var element in tempCards) {
        if (element.typeOfCard != TypesOfCards.flower) continue;
        element = element as FlowerCard;
        if (element._color == _color){
          tempCards.remove(element);
          counter++;
          break;
        }
    }
    if (counter == 0) return 0;
    return points[counter-1];
  }
  
  
}

class BountyCard extends Equatable{
  // Equatable is for its "parameters" to be seen when print

  late final Enum requirement1;
  late final Enum requirement2;
  late final Enum requirement3;

  bool _isCompleated = false;
  bool get isCompleated  => _isCompleated;

  int _wasCompleatedAtDay = 0;
  int get wasCompleatedAtDay => _wasCompleatedAtDay;

  List points = [0,5,3,2];

  BountyCard({required Enum requerimiento1, required Enum requerimiento2, required Enum requerimiento3}) {
    requirement1 = requerimiento1;
    requirement2 = requerimiento2;
    requirement3 = requerimiento3;
  }

  void checkIfCompleated4(List<Card> deck, int day) {
    int counter = 0;
    List<Card> tempCards = deck.toList();
    List list = [requirement1, requirement2, requirement3];

    for (var i = 0; i < 3; i++) {
      for (var element in tempCards) {
        if (element.typeOfCard != TypesOfCards.flower) continue;
        FlowerCard? c = checkIfMeetsRequirements(element, list[i]);
        if(c != null) {
          counter++;
          tempCards.remove(c);
          break;
        }
      }
    }
    if (counter == 3) {
      compleatedAtDay(day);
    }
  }
  void checkIfCompleated3(List<Card> deck, int day){
    int counter = 0;
    List<Card> tempCards = deck.toList();
    List list = [requirement1, requirement2, requirement3];
    Map map = {};

    for (var i = 0; i < 3; i++) {
      for (var element in tempCards) {
        if (element.typeOfCard != TypesOfCards.flower) continue;
        element = element as FlowerCard;
        if ((element._bug == list[0]) || (element._bug == list[1]) || (element._bug == list[2])){
          if (!map.containsKey(element)) {
            map[element] = 1;
          } else {
            map[element] += 1;
          }
        }
        if ((element._flower == list[0]) || (element._flower == list[1]) || (element._flower == list[2])){
          if (!map.containsKey(element)) {
            map[element] = 1;
          } else {
            map[element] += 1;
          }
        }
      }
      print(map);
      List sortedValues = map.values.toList()..sort();
      if (sortedValues.isNotEmpty) {
        int leastValuableValue = sortedValues.first;
        var key = map.keys.firstWhere((k)
              => map[k] == leastValuableValue, orElse: () => null);
        tempCards.remove(key);
        counter++;
        map = {};
      }
    }
      
      /* 
      for (var element in tempCards) {
        if (element.typeOfCard != TypesOfCards.flower) continue;
        element = element as FlowerCard;
        if ((element._bug == list[0]) || (element._bug == list[1]) || (element._bug == list[2])){
          if (!map.containsKey(element)) {
            map[element] = 1;
          } else {
            map[element] += 1;
          }
        }
        if ((element._flower == list[0]) || (element._flower == list[1]) || (element._flower == list[2])){
          if (!map.containsKey(element)) {
            map[element] = 1;
          } else {
            map[element] += 1;
          }
        }
      }
      print(map);
      sortedValues = map.values.toList()..sort();
      if (sortedValues.isNotEmpty) {
        int leastValuableValue = sortedValues.first;
        var key = map.keys.firstWhere((k)
              => map[k] == leastValuableValue, orElse: () => null);
        tempCards.remove(key);
        counter++;
        map = {};
      }
      
      //
      for (var element in tempCards) {
        if (element.typeOfCard != TypesOfCards.flower) continue;
        element = element as FlowerCard;
        if ((element._bug == list[0]) || (element._bug == list[1]) || (element._bug == list[2])){
          if (!map.containsKey(element)) {
            map[element] = 1;
          } else {
            map[element] += 1;
          }
        }
        if ((element._flower == list[0]) || (element._flower == list[1]) || (element._flower == list[2])){
          if (!map.containsKey(element)) {
            map[element] = 1;
          } else {
            map[element] += 1;
          }
        }
      }
      print(map);
      sortedValues = map.values.toList()..sort();
      if (sortedValues.isNotEmpty) {
        int leastValuableValue = sortedValues.first;
        var key = map.keys.firstWhere((k)
              => map[k] == leastValuableValue, orElse: () => null);
        tempCards.remove(key);
        counter++;
        map = {};
      }*/

      if (counter == 3) {
      _isCompleated = true;
      compleatedAtDay(day);
    }
      
  }
  void checkIfCompleated(List<Card> deck, int day){
    int counter = 0;
    List<Card> tempCards = deck.toList();
    List requirementsList = [requirement1, requirement2, requirement3];
    Map map = {};

    for (var i = 0; i < 3; i++) {
      for (var element in tempCards) {
        if (element.typeOfCard != TypesOfCards.flower) continue;
        element = element as FlowerCard;
        if ((element._bug == requirementsList[0]) || (element._bug == requirementsList[1]) || (element._bug == requirementsList[2])){
          if (!map.containsKey(element)) {
            map[element] = 1;
          } else {
            map[element] += 1;
          }
        }
        if ((element._flower == requirementsList[0]) || (element._flower == requirementsList[1]) || (element._flower == requirementsList[2])){
          if (!map.containsKey(element)) {
            map[element] = 1;
          } else {
            map[element] += 1;
          }
        }
      }
    
      //print(map);
      List sortedValues = map.values.toList()..sort();
      if (sortedValues.isNotEmpty) {
        int leastValuableValue = sortedValues.first;
        var key = map.keys.firstWhere((k)
              => map[k] == leastValuableValue, orElse: () => null);
        tempCards.remove(key);
        //print(key);
        counter++;
        map = {};
      }
    
      }
      
      if (counter == 3) {
      _isCompleated = true;
      compleatedAtDay(day);
    }
      
  }
  

  FlowerCard? checkIfMeetsRequirements(Card element, Enum requirement) {
    element = element as FlowerCard;
    if ((element._bug == requirement) || (element._flower == requirement)){
      return element;
    }
    FlowerCard? c;
    return c;
  }

  void compleatedAtDay(int day){
    _isCompleated = true;
    _wasCompleatedAtDay = day;
  }

  int obtainScore(){
    return points[wasCompleatedAtDay];
  }

  @override
  List<Object?> get props => [requirement1, requirement2, requirement3];
}

class DesireCard extends Card{

  late final Enum typeOfDesire;
  late final Enum requirement;
  late final List<int> points;
  final occurrencesLimit = 5;

  DesireCard({required super.tipoDeCarta, required TypesOfDesire tipoDeDesire, required Enum requerimiento, required List<int> puntos}){
    typeOfDesire = tipoDeDesire;
    requirement = requerimiento;
    points = puntos;
  }

  int obtainScore(List<Card> listOfCards) {
    String type = typeOfDesire.toString().split('.').last;
    int score = 0;
    switch(type){
      case 'simple': score += obtainSimpleScore(listOfCards);
        break;
      case 'same': score += obtainSameScore(listOfCards);
        break;
      case 'different': score += obtainDifferentScore(listOfCards);
        break;
    }
    return score;
  }

  int obtainSimpleScore(List<Card> listOfCards){
    int maxOccurrence = obtainRequerimentOccurence(listOfCards);
    int score = maxOccurrence * points[0];
    return score;
  }
  int obtainSameScore(List<Card> listOfCards){
    Map maxOccurrence = obtainMaxSameOccurence(listOfCards);
    int occurrences = maxOccurrence.values.first > occurrencesLimit? occurrencesLimit:maxOccurrence.values.first;
    if (occurrences <= 0) occurrences = 1;

    //print(occurrences);
    int score = points[occurrences-1];
    //print(maxOccurrence);
    //print(maxOccurrence.keys.first);
    //print(maxOccurrence.values.first);
    return score;
  }
  int obtainDifferentScore(List<Card> listOfCards){
    int occurrences = obtainDifferentOccurrences(listOfCards);
    if (occurrences > occurrencesLimit) occurrences = occurrencesLimit;
    if (occurrences <= 0) occurrences = 1;
    int score = points[occurrences-1];
    return score;
  }

  int obtainRequerimentOccurence(List<Card> listOfCards){
    var map = Map();

    for (var element in listOfCards) {
      if (element.typeOfCard != TypesOfCards.flower) continue;
      GardenCard card = element as GardenCard;

      Enum? keyValue;
      String enumName = requirement.toString().split('.').first;

      switch (enumName){
        case "Flowers": keyValue = card._flower; 
          break;
        case "Colors": keyValue = card._color; 
          break; 
        case "Bugs": keyValue = card._bug; 
          break;
      }

      if (!map.containsKey(keyValue)) {
        map[keyValue] = 1;
      } else {
        map[keyValue] += 1;
      }
    }
    if (map.containsKey(Bugs.none)) map.remove(Bugs.none);
    
    if (map[requirement] == null) return 0;
    return map[requirement];
  } 
  Map obtainMaxSameOccurence(List<Card> listOfCards){
    var map = {};
    
    for (var element in listOfCards) {
      if (element.typeOfCard != TypesOfCards.flower) continue;
      GardenCard card = element as GardenCard;

      Enum? keyValue;
      String enumName = requirement.toString().split('.').first;

      switch (enumName){
        case "Flowers": keyValue = card._flower; 
          break;
        case "Colors": keyValue = card._color; 
          break; 
        case "Bugs": keyValue = card._bug; 
          break;
      }

      if (!map.containsKey(keyValue)) {
        map[keyValue] = 1;
      } else {
        map[keyValue] += 1;
      }
    }
    if (map.containsKey(Bugs.none)) map.remove(Bugs.none);
    
    List sortedValues = map.values.toList()..sort();
    if (sortedValues.isEmpty) return {requirement:0};

    int popularValue = sortedValues.last;
    var key = map.keys.firstWhere((k)
          => map[k] == popularValue, orElse: () => null);
    
    var map2 = Map();
    map2[key] = popularValue;

    //return key; //it was return Enum
    return map2;
  }
  int obtainDifferentOccurrences(List<Card> listOfCards){
    var map = {};

    for (var element in listOfCards) {
      if (element.typeOfCard != TypesOfCards.flower) continue;
      GardenCard card = element as GardenCard;

      Enum? keyValue;
      String enumName = requirement.toString().split('.').first;

      switch (enumName){
        case "Flowers": keyValue = card._flower; 
          break;
        case "Colors": keyValue = card._color; 
          break; 
        case "Bugs": keyValue = card._bug; 
          break;
      }

      if (!map.containsKey(keyValue)) {
        map[keyValue] = 1;
      } else {
        map[keyValue] += 1;
      }
    }
    if (map.containsKey(Bugs.none)) map.remove(Bugs.none);
    if (map.containsKey(Bugs.indifferent)) map.remove(Bugs.indifferent);
    
    List sortedValues = map.values.toList()..sort();
    if (sortedValues.isEmpty) return 0;

    return sortedValues.length;
  }
  

}

class CrowCard extends Equatable{

  late final int _replaceRowAt;
  late final Enum _replaceWith;
  late final int _numberOfStones;

  CrowCard({required int renglon, required CrowReplacements reemplazo, int numeroDePiedras = 0}){
    _replaceRowAt = renglon;
    _replaceWith = reemplazo;
    _numberOfStones = numeroDePiedras;
  }

  
  @override
  List<Object?> get props => [_replaceRowAt, _replaceWith, _numberOfStones];

}


// FUNCIONES
List<BountyCard> shuffleBountyCards(List<BountyCard> cards){
  cards.shuffle();
  return cards;
}
List<GardenCard> shuffleGardenCards(List<GardenCard> cards){
  cards.shuffle();
  return cards;
}
List<DesireCard> shuffleDesireCards(List<DesireCard> cards){
  cards.shuffle();
  return cards;
}
List<CrowCard> shuffleCrowCards(List<CrowCard> cards){
  cards.shuffle();
  return cards;
}


/* ---------------------------- END OF CARDS ---------------------------------- */
/* ---------------------------------------------------------------------------- */
