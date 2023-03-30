import 'package:collection/collection.dart';
import 'package:floriferous/cards.dart';
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
      expect(bCard, equals(bountyCards.elementAt(0)));
    });
    test('Bounties barajeadas no es igual a lista original', () {
      List<BountyCard> randomBounties = shuffleBountyCards(bountyCards.toList());
      expect(randomBounties.equals(bountyCards), equals(false));
    });
    test('GardenCards barajeadas no es igual a lista original', () {
      List<GardenCard> randomCards = shuffleGardenCards(gardenCards.toList());
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
      expect(cards.equals(crowCards), equals(false));
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
      bountyC.checkIfCompleated(miDeck, 3);
      expect(bountyC.obtainScore(), equals(2));
    });


  });
  
}