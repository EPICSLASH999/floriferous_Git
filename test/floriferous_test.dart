//import 'dart:developer';
//import 'dart:ffi';
//import 'dart:html';
//import 'dart:math';

import 'dart:io';
//import 'dart:math';

import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
//import 'package:floriferous/cards.dart';
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
      expect(card.color, equals(Colors.orange));
    });
    test('La primera carta de gardenCards es tipo "Flower"', () {
      GardenCard card = gardenCards.elementAt(0);
      expect(card.typeOfCard, equals(TypesOfCards.flower));
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
      //print(game.row3.elementAt(0).isUpsidedown);
      game.row3.elementAt(0)._isUpsidedown = true;
      expect(game.row3.elementAt(0).isUpsidedown, equals(true));
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
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow, bicho: Bugs.butterfly),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow, bicho: Bugs.butterfly),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.mum, col: Colors.yellow, bicho: Bugs.butterfly),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.white),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.orange),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.pink),
        FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.poppy, col: Colors.yellow)
      ];
      DesireCard desireC = DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.different, requerimiento: Bugs.indifferent, puntos: [0,1,2,4,7]);
      int score = desireC.obtainScore(misCartas);
      expect(score, equals(1));
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
      game.endOfDay(gardenCards);
      game.endOfDay(gardenCards);
      game.endOfDay(gardenCards);
      bool isGameOver = game._gameOver;
      expect(isGameOver, equals(true));
    });
    
  });
  group('Jugabilidad:', () {
    test('Tomar tarjeta de columa 1 renglon 1', () {
      Game game = Game();
      //game.imprimirTablero();
      game.takeCard(1);
      //game.imprimirTablero();
      Card c1 = game._deck.elementAt(0);
      Card c2 = game.row1.elementAt(0);

      expect(c1 == c2, equals(true));

    });
    test('Tarjeta tomada dice que esta tomada', () {
      Game game = Game();
      //game.imprimirTablero();
      game.takeCard(1);
      //game.imprimirTablero();
      

      expect(game.row1.elementAt(0)._isThere, equals(false));

    });
    test('Tarjeta tomada cambia a siguiente columna', () {
      Game game = Game();
      //game.imprimirTablero();
      game.takeCard(1);
      //game.imprimirTablero();
      expect(game.column, equals(2));
    });
    test('Jugado un dia (casi) completo', () {
      Game game = Game();
      game.takeCard(1);
      game.takeCard(2);
      game.takeCard(3);
      game.takeCard(2);
      //game.imprimirTablero();
      expect(game.day, equals(1));
    });
    test('Tomar una tarjeta con piedra la da al jugador', () {
      Game game = Game();
      game.takeCard(2);
      //game.imprimirTablero();
      expect(game._stones, equals(1));
    });
    test('Si se usa carta de te es "true"', () {
      Game game = Game();
      game.useCupOfTea();
      expect(game._usedCupOfTeaCard, equals(true));
    });
    test('Si se toman solo pierdras desaparecen del tablero', () {
      Game game = Game();
      CrowCard crowC = CrowCard(renglon: 3, reemplazo: CrowReplacements.stone, numeroDePiedras: 2);
      game.crowActs(crowC);
      game.takeCard(3);
      game.imprimirTablero();
      expect(game._stones, equals(2));
    });
    test('Despues de turno jugador es turno del cuervo', () {
      Game game = Game();
      game.imprimirTablero();
      game.takeTurn();
      game.imprimirTablero();
      
    });

  });
  group('Jugabilidad del cuervo', () {
    test('Cuervo reemplaza carta y deja 2 piedras', () {
      Game game = Game();
      CrowCard crowC = CrowCard(renglon: 3, reemplazo: CrowReplacements.stone, numeroDePiedras: 2);
      game.crowActs(crowC);
      bool didHappen = (game.row3.elementAt(0)._isThere == false) && (game.row3.elementAt(0)._stonesInSpace == 2);
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
      expect(game._stones, equals(2));
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

      //ArrangementCard(tipoDeCarta: TypesOfCards.arrangement, flor: Flowers.poppy, col: Colors.orange, bicho: Bugs.moth),

      //(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.simple, requerimiento: Bugs.bee, puntos: [3]),
      //DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.same, requerimiento: Bugs.indifferent, puntos: [0,2,4,7,10]),
    ];
      Game game = Game();
      game._deck = miDeck.toList();
      int d1 = game._deck.length;
      game.crowTakesCardAtPosition(1);
      int d2 = game._deck.length;
      //game.imprimirTablero();
      expect(d1 == d2, equals(false));
    });
    test('Si cuervo tiene 4 o mas piedras se debe pagar carta', () {
      List<Card> miDeck = [
      FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.pink),
      FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.purple, bicho: Bugs.bee),
      FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.orange, bicho: Bugs.butterfly),
      FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.white, bicho: Bugs.beetle),
      FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.yellow, bicho: Bugs.ladybug),
      FlowerCard(tipoDeCarta: TypesOfCards.flower, flor: Flowers.lily, col: Colors.pink, bicho: Bugs.moth),

      //ArrangementCard(tipoDeCarta: TypesOfCards.arrangement, flor: Flowers.poppy, col: Colors.orange, bicho: Bugs.moth),

      //(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.simple, requerimiento: Bugs.bee, puntos: [3]),
      //DesireCard(tipoDeCarta: TypesOfCards.desire, tipoDeDesire: TypesOfDesire.same, requerimiento: Bugs.indifferent, puntos: [0,2,4,7,10]),
    ];
      /*Game game = Game();
      game._deck = miDeck.toList();
      game.imprimirTablero();
      game.crow._stones = 4;
      game.endOfDay(miDeck);
      game.imprimirTablero();*/
    });
    test('Si se usa tasa de te cuervo no actua ese turno', () {
      //Game game = Game();
      //game.cupOfTeaOrCrow();
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
    test('Despues de 5 turnos se vuelve a generar el tablero', () {
      Game game = Game();
      game.imprimirTablero();
      game.nextColumn(); game.imprimirTablero();
      game.nextColumn(); game.imprimirTablero();
      game.nextColumn(); game.imprimirTablero();
      game.nextColumn(); game.imprimirTablero();
      game.nextColumn(); game.imprimirTablero();
      expect(game.column, equals(1));
    
    });
    test('Cartas tomadas ahora aparecen con "()" y "*" por num de piedras', () {
      Game game = Game();
      game.takeCard(1);
      game.takeCard(2);
      game.imprimirTablero();
    });
    test('Cartas volteadas ahora aparecen con "//"', () {
      Game game = Game();
      CrowCard crowC = CrowCard(renglon: 3, reemplazo: CrowReplacements.stone, numeroDePiedras: 2);
      game.crowActs(crowC);
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

  Crow crow = Crow();

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

    row1[1].TurnCard();
    row1[3].TurnCard();

    row2[0].hasStone = true; row2[0]._stonesInSpace = 1;
    row2[2].hasStone = true; row2[2]._stonesInSpace = 1;
    row2[4].hasStone = true; row2[4]._stonesInSpace = 1;
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
    if (_desireCards.isEmpty){
      _desireCards = shuffleDesireCards(desireCards).toList();
    }
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

  // TAKE CARD (AS A PLAYER)
  void takeCard(int row){
    if (_gameOver) return;
    switch (row){
      case 1: GardenCard card = row1.elementAt(column-1);
              if (!card._isThere && card.hasStone){
                crow.subtractStones(card._stonesInSpace);
              }
              if (card._isThere){
                _deck.add(card);
                card._isThere = false; // probar si funciona esto, sino reemplazar por "row1.elementAt(column-1)._isThere = false"
              }
              if (card.hasStone) {
                _stones += card._stonesInSpace;
                card._stonesInSpace = 0;
                card.hasStone = false;
              }
        break;
      case 2: GardenCard card = row2.elementAt(column-1);
              if (!card._isThere && card.hasStone){
                crow.subtractStones(card._stonesInSpace);
              }
              if (card._isThere){
                _deck.add(card);
                card._isThere = false; 
              }
              if (card.hasStone) {
                _stones += card._stonesInSpace;
                card._stonesInSpace = 0;
                card.hasStone = false;
              }
        break;
      case 3: DesireCard card = row3.elementAt(column-1);
              if (!card._isThere && card.hasStone){
                crow.subtractStones(card._stonesInSpace);
              }
              if (card._isThere){
                _deck.add(card);
                card._isThere = false; 
              }
              if (card.hasStone) {
                _stones += card._stonesInSpace;
                card._stonesInSpace = 0;
                card.hasStone = false;
              }
        break;
    }
    nextColumn();

  }
  void useCupOfTea(){
    _usedCupOfTeaCard = true;
  }

  // TURNS & DAYS
  void takeTurn(){
    imprimirTablero();
    printMessage('Which card shall thou take?');
    String response = obtainResponse('Int');
    int numericResponse = int.parse(response);
    takeCard(numericResponse);
  }
  void nextColumn(){
    column++;
    if (column <= 5) {
      cupOfTeaOrCrow();
    }
    if (column > 5) endOfDay(_deck);
  }
  void endOfDay(List<Card> myDeck) {
    for (var element in _bountyCards) {
      element.checkIfCompleated(myDeck, day);
    }
    if (crow.howManyStonesHas() >= 4){
      crowActionAtEndOfDay();
    }
    day++;
    column = 1;
    if (day > 3) {
      gameOver();
      return;
    }
    generateDay();
  }
  void cupOfTeaOrCrow(){
    if (!_usedCupOfTeaCard){
      printMessage('Do you want to use Cup of Tea? Y/N');
      String response = obtainResponse('String').toUpperCase();
      if (response == 'Y'){
        useCupOfTea();
        return;
      }
    }
    crowActs(drawCrowCard());
  }

  // DEVIL CROW
  void crowActs(CrowCard crowC) {
    //print(crowC);
    switch(crowC._replaceWith){
      case CrowReplacements.stone:
        switch (crowC._replaceRowAt){
          case 1: row1.elementAt(column-1)._isThere = false;
                  row1.elementAt(column-1).hasStone = true;
                  row1.elementAt(column-1)._stonesInSpace = crowC._numberOfStones;
            break;
          case 2: row2.elementAt(column-1)._isThere = false;
                  row2.elementAt(column-1).hasStone = true;
                  row2.elementAt(column-1)._stonesInSpace = crowC._numberOfStones;
            break;
          case 3: row3.elementAt(column-1)._isThere = false;
                  row3.elementAt(column-1).hasStone = true;
                  row3.elementAt(column-1)._stonesInSpace = crowC._numberOfStones;
            break;
        }
        crow.addStones(crowC._numberOfStones);
        break;
      case CrowReplacements.card: 
        switch (crowC._replaceRowAt){
          case 1: row1[column-1] = drawGardenCard();
                  row1[column-1]._isUpsidedown = true;
            break;
          case 2: row2[column-1] = drawGardenCard();
                  row2[column-1]._isUpsidedown = true;
            break;
          case 3: row3[column-1] = drawDesireCard();
                  row3[column-1]._isUpsidedown = true;
            break;
        }
        break;
    }
  }
  void obtainCardToSteal(){ 
    List<GardenCard> tempList = [];
    for (var element in _deck) {
      if (element.typeOfCard != TypesOfCards.desire){
        tempList.add(element as GardenCard);
      }
    }
    if (tempList.isEmpty){
      printMessage('No GardenCards to give. Crow does not take nothing...');
      return;
    }
    printMessage('You have to pay to the crow a card from the following list:');
    print(tempList);
    String positionOfCard = obtainResponse('Int');
    int posOfCard = int.parse(positionOfCard);
    if (posOfCard > tempList.length) posOfCard = 1;

    crowTakesCard(tempList.elementAt(posOfCard-1));
    //_deck.remove(tempList.elementAt(posOfCard-1));
    //crowTakesCardAtPosition(posOfCard);
  }
  void crowTakesCardAtPosition(int positionOfCard){
    _deck.removeAt(positionOfCard-1);
  }
  void crowTakesCard(Card card){
    _deck.remove(card);
  }
  void payToCrow(int stones){
    crow.subtractStones(stones);
  }
  void crowActionAtEndOfDay(){
    print('Do you want to pay stones to crow? Y/N');
    String? response = stdin.readLineSync();
    response ??= 'N';
    response = response.toUpperCase();
    if (response == 'Y'){
      getStonesToPayCrow();
    }
    if (crow._stones >= 4){
      obtainCardToSteal();
    }
    
  }
  void getStonesToPayCrow(){
    int stones = 0;
    String? response = stdin.readLineSync();
    response ??= '0';
    stones = int.parse(response);
    if (stones > _stones){
      stones = 0;
    }

    payToCrow(stones);
  }

  // START OF GAME
  void startGame(){
    while (!_gameOver){
      takeTurn();
    }
  }
  // END OF GAME
  void gameOver(){
    printMessage('**************** GAME OVER ****************');
    _gameOver = true;
    obtainFinalScore();
    printMessage('--> FINAL SCORE: $finalScore');
    printMessage('--> Your Mood: ${obtainScoringMood()}');
  }

  // OBTAIN SCORE
  int obtainFinalScore(){
    _finalScore += obtainDeckScore();
    print('Score of Arrangement & Desire: ${obtainDeckScore()}');
    _finalScore += obtainBountyCardsScore();
    print('Score of BountyCards: ${obtainBountyCardsScore()}');
    _finalScore += obtainCupOfTeaCardScore();
    print('Score of Cup Of Tea: ${obtainCupOfTeaCardScore()}');
    _finalScore += obtainStonesScore();
    print('Score of stones: ${obtainStonesScore()}');
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
  String obtainScoringMood(){
    if (_finalScore < 21) return 'Anxious';
    if (_finalScore>= 21 && _finalScore <= 26) return 'Chill';
    if (_finalScore >= 27 && _finalScore <= 32) return 'Cool as a Cucumber';
    if (_finalScore >= 33 && _finalScore <= 38) return 'Really Relaxed';
    if (_finalScore >= 39 && _finalScore <= 44) return 'Utter Zen';
    return 'Nirvana';
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
    print('Stones: $_stones');
    print('Stones (Crow): ${crow.howManyStonesHas()}');
    print('UsedTeaCard: $_usedCupOfTeaCard');
    print('');
    List<int> vals = [5,4,3,2,1];
    int colToPrint = column;
    if (day == 2) colToPrint = vals[column-1];
    print('Column: $colToPrint');
    print('------------------------------- MY DECK -------------------------------');
    printDeckCardsZone();
    print('-----------------------------------------------------------------------');
    print('');

  }

  void printBountyCardsZone(){
    // ignore: prefer_interpolation_to_compose_strings
    String message = ('|| ${_bountyCards.elementAt(0).requirement1.name} ${_bountyCards.elementAt(0).requirement2.name} ${_bountyCards.elementAt(0).requirement3.name} (${_bountyCards.elementAt(0).wasCompleatedAtDay}) || '+
          ' ${_bountyCards.elementAt(1).requirement1.name} ${_bountyCards.elementAt(1).requirement2.name} ${_bountyCards.elementAt(1).requirement3.name} (${_bountyCards.elementAt(1).wasCompleatedAtDay})' +
         ' || ${_bountyCards.elementAt(2).requirement1.name} ${_bountyCards.elementAt(2).requirement2.name} ${_bountyCards.elementAt(2).requirement3.name} (${_bountyCards.elementAt(2).wasCompleatedAtDay}) ||');

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
  void printDeckCardsZone(){
    print(createDeckRow(_deck));
  }

  List<String> createGardenRow(List<GardenCard> row){
    List<GardenCard> row2 = row.toList();
    if (day == 2)
    {
      row2.clear();
      for (int x = row.length-1; x > -1; x--) {
        row2.add(row[x]);
      } 
    }

    List<String> line = [];
    for (var element in row2) {
      String l = '${element.typeOfCard.toString().split('.').last.toUpperCase()}:${element._flower.toString().split('.').last}/${element.color.toString().split('.').last}/${element._bug.toString().split('.').last}';
      if (element.isUpsidedown) l = '//';
      if (!element._isThere) l = '---';
      if (element.hasStone){
        String stones = '*' * element._stonesInSpace;
         l += '($stones)';
      }
      line.add(l);
      
    }
    return line;
  }
  List<String> createDesireRow(List<DesireCard> row){
    List<DesireCard> row2 = row.toList();
    if (day == 2)
    {
      row2.clear();
      for (int x = row.length-1; x > -1; x--) {
        row2.add(row[x]);
      } 
    }

    List<String> line = [];
    for (var element in row2) {
      String l = '';
      
      l ='${element.points.toString()}/${element.typeOfDesire.toString().split('.').last}/${element.requirement.toString()}';
      if (element.isUpsidedown) l = '//';
      if (!element._isThere) l = '---';
      if (element.hasStone){
        String stones = '*' * element._stonesInSpace;
        l += '($stones)';
      }
      line.add(l);
    }
    return line;
  }
  List<String> createDeckRow(List<Card> row){
    List<String> line = [];
    for (var element in _deck) {
      if (element.typeOfCard != TypesOfCards.desire){
        element = element as GardenCard;
        line.add('${element.typeOfCard.toString().split('.').last.toUpperCase()}:${element._flower.toString().split('.').last}/${element.color.toString().split('.').last}/${element._bug.toString().split('.').last}');
      }
      if (element.typeOfCard == TypesOfCards.desire){
        element = element as DesireCard;
        line.add('${element.typeOfCard.toString().split('.').last.toUpperCase()}:${element.points.toString()}/${element.typeOfDesire.toString().split('.').last}/${element.requirement.toString()}');
      }
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
  
  /* MISC FUNCTIONS */
  void printMessage(String message){
    print(message);
  }
  String obtainResponse(String typeOfValue){
    String? response = stdin.readLineSync();
    String nullResponse = 'N';
    if (typeOfValue == 'Int') nullResponse = '1';
    response ??= nullResponse;
    return response;
  }

}

class Crow{
  int _stones = 0;

  int howManyStonesHas(){
    return _stones;
  }
  void addStones(int s){
    _stones += s;
  }
  void subtractStones(int s){
    _stones -= s;
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

  bool hasStone = false;

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
  void checkIfCompleated2(List<Card> deck, int day){
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
  void checkIfCompleated(List<Card> deck, int day){
    if (isCompleated) return;
    List<String> requirements = [requirement1.toString(),requirement2.toString(),requirement3.toString()];
    requirements.sort();
    //print(requirements);
    int counter = 0;
    List<Card> tempCards = deck.toList();
    //List requirementsList = [requirement1, requirement2, requirement3];
    Map map = {};

    for (var element in tempCards) {
      if (element.typeOfCard != TypesOfCards.flower) continue;
      element = element as FlowerCard;
      //print(requirements[0]);
      if (requirements[0].split('.').first == 'Bugs'){
        //print(element._bug.toString() == requirements[0]);
        if ((element._bug.toString() == requirements[0])){
            
          if (!map.containsKey(element)) {
            map[element] = 1;
          } else {
            map[element] += 1;
          }
          if (requirements[1].split('.').first != 'Bugs'){
            if (requirements[1] == element._flower.toString()) map[element] += 1;
          }
          if (requirements[2].split('.').first != 'Bugs'){
            if (requirements[2] == element._flower.toString()) map[element] += 1;
          }
        }
      } else {
        if (element._flower.toString() == requirements[0]){
          if (!map.containsKey(element)) {
            map[element] = 1;
          } else {
            map[element] += 1;
          }
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

    /* SECOND CHECK */
    for (var element in tempCards) {
      if (element.typeOfCard != TypesOfCards.flower) continue;
      element = element as FlowerCard;
      if (requirements[1].split('.').first == 'Bugs'){
        if ((element._bug.toString() == requirements[1])){
          if (!map.containsKey(element)) {
            map[element] = 1;
          } else {
            map[element] += 1;
          }
          if (requirements[2].split('.').first != 'Bugs'){
            if (requirements[2] == element._flower.toString()) map[element] += 1;
          }

        }
       
      } else {
        if (element._flower.toString() == requirements[1]){
          if (!map.containsKey(element)) {
            map[element] = 1;
          } else {
            map[element] += 1;
          }
        }
        
      }
        
    }
    
    //print(map);
    sortedValues = map.values.toList()..sort();
    if (sortedValues.isNotEmpty) {
      int leastValuableValue = sortedValues.first;
      var key = map.keys.firstWhere((k)
            => map[k] == leastValuableValue, orElse: () => null);
      tempCards.remove(key);
      //print(key);
      counter++;
      map = {};
    }

    /* THIRD CHECK */
    for (var element in tempCards) {
      if (element.typeOfCard != TypesOfCards.flower) continue;
      element = element as FlowerCard;
      if (requirements[2].split('.').first == 'Bugs'){
        if ((element._bug.toString() == requirements[2])){
          if (!map.containsKey(element)) {
            map[element] = 1;
          } else {
            map[element] += 1;
          }

        }
       
      } else {
        if (element._flower.toString() == requirements[2]){
          if (!map.containsKey(element)) {
            map[element] = 1;
          } else {
            map[element] += 1;
          }
        }
      }
    }
    
    //print(map);
    sortedValues = map.values.toList()..sort();
    if (sortedValues.isNotEmpty) {
      int leastValuableValue = sortedValues.first;
      var key = map.keys.firstWhere((k)
            => map[k] == leastValuableValue, orElse: () => null);
      tempCards.remove(key);
      //print(key);
      counter++;
      map = {};
    }




    // Final piece of code "return"
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
  
  @override
  List<Object?> get props => [points, typeOfDesire, requirement];
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
