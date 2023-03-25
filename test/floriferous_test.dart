import 'dart:developer';
import 'dart:ffi';
//import 'dart:html';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:floriferous/floriferous.dart';
import 'package:test/test.dart';



void main() {

  group('Cards: ', () {
    test('Tamaño de cards = 55', () {
    expect(gardenCards.length, equals(55));
  });
    test('Tarjeta de Flores es tipo "Flower"', () {
      FlowerCard card = FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Daisy, col: Colors.Orange);
      expect(card.typeOfCard, equals(TypesOfCard.Flower));
    });
    test('Requerimiento1 es "tulip"', () {
      BountyCard bounty = bountyCards.elementAt(0);
      expect(bounty.requirement1, equals(Flowers.Tulip));
    });
    test('Tamaño de bountyCards es 9', () {
      expect(bountyCards.length, equals(9));
    });
    test('La primera carta de gardenCards es color "Orange"', () {
      GardenCard card = gardenCards.elementAt(0);
      expect(card._color, equals(Colors.Orange));
    });
    test('La primera carta de gardenCards es tipo "Flower"', () {
      GardenCard card = gardenCards.elementAt(0);
      expect(card._typeOfCard, equals(TypesOfCard.Flower));
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
      List<BountyCard> bounties = bountyCards;
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
    test('DesireCards son 21', () {
      expect(desireCards.length, equals(21));
    });
    test('DesireCard 1 es tipo Simple', () {
      DesireCard card = desireCards.elementAt(0);
      expect(card.typeOfDesire, TypesOfDesire.Simple);
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
      bool volteada = game.row1.elementAt(1)._isUpsidedown && game.row1.elementAt(3)._isUpsidedown;
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

  });
  
  
  group('Game: ', () {
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
    test('Total de DesireCards disminuye a 16 tras startgame', () {
      Game game = Game();
      expect(game.getDesireCards().length, equals(16));
    });

  });

  group('xxx: ', () {
    
    
    
  });
  
  group('Tablero Grafico: ', () {
    test('Imprimir BountyCards Row', () {
      Game game = Game();
      game.imprimirTablero();
    });
  });


}



class Game{
  late final List<BountyCard> _bountyCards;
  List<GardenCard> _gardenCards = [];
  List<DesireCard> _desireCards = [];

  List<GardenCard> row1 = [];
  List<GardenCard> row2 = [];
  List<DesireCard> row3 = [];

  int day = 1;
  int column = 1;

  Game(){
    _gardenCards = shuffleGardenCards(gardenCards.toList()).toList();
    _desireCards = shuffleDesireCards(desireCards.toList()).toList();

    generateDay();
  }

  void generateDay() {
    generateBountyRow();
    generateGardenRows();
    setCardsOfGardenRows();
    generateDesireRow();
  }

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

  void nextTurn(){
    column++;
    if (column > 5){
      column = 1;
      day++;
    }
  }


 /* ------ TABLERO GRAFICO ------ */
  void imprimirTablero(){
    printBountyCardsZone();
  }

  void printBountyCardsZone(){
    // ignore: prefer_interpolation_to_compose_strings
    String message = ('|| ${_bountyCards.elementAt(0).requirement1.name} ${_bountyCards.elementAt(0).requirement2.name} ${_bountyCards.elementAt(0).requirement3.name} || '+
          ' ${_bountyCards.elementAt(1).requirement1.name} ${_bountyCards.elementAt(1).requirement2.name} ${_bountyCards.elementAt(1).requirement3.name} ' +
         ' || ${_bountyCards.elementAt(2).requirement1.name} ${_bountyCards.elementAt(2).requirement2.name} ${_bountyCards.elementAt(2).requirement3.name} ||');;

    String title = ' BOUNTY CARDS ';

    String line1 = '-' * ((message.length~/2) - title.length~/2);
    String line2 = '-' * (message.length);
    
    print('$line1$title$line1');
    print(message);
    print(line2);
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
  

}




/* ---------------------------------- CARDS ---------------------------------- */

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

// ENUMS
enum Flowers {Daisy, Lily, Mum, Poppy, Tulip}
enum Colors {White, Yellow, Orange, Pink, Purple}
enum Bugs {Bee, Beetle, Butterfly, Ladybug, Moth, Null}

enum TypesOfCard {Flower, Arrangement}
enum TypesOfDesire {Simple, Same, Different}

// LISTS
List<GardenCard> gardenCards = [
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Mum, col: Colors.Orange),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Mum, col: Colors.Pink),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Mum, col: Colors.Yellow),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Mum, col: Colors.White),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Mum, col: Colors.Purple),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Mum, col: Colors.Purple, bicho: Bugs.Butterfly),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Mum, col: Colors.Orange, bicho: Bugs.Beetle),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Mum, col: Colors.White, bicho: Bugs.Ladybug),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Mum, col: Colors.Pink, bicho: Bugs.Bee),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Mum, col: Colors.Yellow, bicho: Bugs.Moth),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Poppy, col: Colors.White),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Poppy, col: Colors.Orange),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Poppy, col: Colors.Pink),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Poppy, col: Colors.Yellow),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Poppy, col: Colors.Purple),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Poppy, col: Colors.Purple, bicho: Bugs.Beetle),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Poppy, col: Colors.Pink, bicho: Bugs.Butterfly),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Poppy, col: Colors.Orange, bicho: Bugs.Ladybug),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Poppy, col: Colors.Yellow, bicho: Bugs.Bee),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Poppy, col: Colors.White, bicho: Bugs.Moth),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Tulip, col: Colors.Pink),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Tulip, col: Colors.Orange),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Tulip, col: Colors.White),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Tulip, col: Colors.Yellow),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Tulip, col: Colors.Purple),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Tulip, col: Colors.Pink, bicho: Bugs.Beetle),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Tulip, col: Colors.Orange, bicho: Bugs.Moth),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Tulip, col: Colors.White, bicho: Bugs.Bee),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Tulip, col: Colors.Yellow, bicho: Bugs.Butterfly),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Tulip, col: Colors.Purple, bicho: Bugs.Ladybug),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Daisy, col: Colors.Purple),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Daisy, col: Colors.Pink),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Daisy, col: Colors.White),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Daisy, col: Colors.Orange),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Daisy, col: Colors.Yellow),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Daisy, col: Colors.Purple, bicho: Bugs.Moth),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Daisy, col: Colors.Pink, bicho: Bugs.Ladybug),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Daisy, col: Colors.White, bicho: Bugs.Butterfly),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Daisy, col: Colors.Orange, bicho: Bugs.Bee),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Daisy, col: Colors.Yellow, bicho: Bugs.Beetle),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Lily, col: Colors.Purple),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Lily, col: Colors.Orange),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Lily, col: Colors.White),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Lily, col: Colors.Yellow),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Lily, col: Colors.Pink),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Lily, col: Colors.Purple, bicho: Bugs.Bee),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Lily, col: Colors.Orange, bicho: Bugs.Butterfly),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Lily, col: Colors.White, bicho: Bugs.Beetle),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Lily, col: Colors.Yellow, bicho: Bugs.Ladybug),
  FlowerCard(tipoDeCarta: TypesOfCard.Flower, flor: Flowers.Lily, col: Colors.Pink, bicho: Bugs.Moth),

  ArrangementCard(tipoDeCarta: TypesOfCard.Arrangement, flor: Flowers.Poppy, col: Colors.Orange, bicho: Bugs.Moth),
  ArrangementCard(tipoDeCarta: TypesOfCard.Arrangement, flor: Flowers.Tulip, col: Colors.Yellow, bicho: Bugs.Ladybug),
  ArrangementCard(tipoDeCarta: TypesOfCard.Arrangement, flor: Flowers.Lily, col: Colors.Purple, bicho: Bugs.Butterfly),
  ArrangementCard(tipoDeCarta: TypesOfCard.Arrangement, flor: Flowers.Daisy, col: Colors.White, bicho: Bugs.Bee),
  ArrangementCard(tipoDeCarta: TypesOfCard.Arrangement, flor: Flowers.Mum, col: Colors.Pink, bicho: Bugs.Beetle),
];
List <BountyCard> bountyCards = [
  BountyCard(requerimiento1: Flowers.Tulip, requerimiento2: Bugs.Ladybug, requerimiento3: Bugs.Butterfly),
  BountyCard(requerimiento1: Flowers.Tulip, requerimiento2: Flowers.Tulip, requerimiento3: Flowers.Daisy),
  BountyCard( requerimiento1: Bugs.Beetle, requerimiento2: Bugs.Ladybug, requerimiento3: Bugs.Bee),
  BountyCard(requerimiento1: Flowers.Lily, requerimiento2: Flowers.Mum, requerimiento3: Flowers.Tulip),
  BountyCard(requerimiento1: Flowers.Daisy, requerimiento2: Flowers.Mum, requerimiento3: Bugs.Bee),
  BountyCard(requerimiento1: Flowers.Lily, requerimiento2: Flowers.Lily, requerimiento3: Bugs.Ladybug),
  BountyCard(requerimiento1: Flowers.Poppy, requerimiento2: Flowers.Daisy, requerimiento3: Bugs.Beetle),
  BountyCard(requerimiento1: Flowers.Lily, requerimiento2: Flowers.Poppy, requerimiento3: Bugs.Moth),
  BountyCard(requerimiento1: Flowers.Poppy, requerimiento2: Flowers.Mum, requerimiento3: Bugs.Butterfly)
  
];
List<DesireCard> desireCards = [
  DesireCard(tipo: TypesOfDesire.Simple, requerimiento: Bugs.Bee, puntos: [3]),
  DesireCard(tipo: TypesOfDesire.Simple, requerimiento: Flowers.Mum, puntos: [2]),
  DesireCard(tipo: TypesOfDesire.Simple, requerimiento: Colors.Yellow, puntos: [2]),
  DesireCard(tipo: TypesOfDesire.Same, requerimiento: Bugs.Null, puntos: [0,2,4,7,10]),
  DesireCard(tipo: TypesOfDesire.Simple, requerimiento: Bugs.Butterfly, puntos: [3]),
  DesireCard(tipo: TypesOfDesire.Simple, requerimiento: Colors.Orange, puntos: [2]),
  DesireCard(tipo: TypesOfDesire.Different, requerimiento: Colors.Yellow, puntos: [0,0,1,3,5]),
  DesireCard(tipo: TypesOfDesire.Simple, requerimiento: Bugs.Beetle, puntos: [3]),
  DesireCard(tipo: TypesOfDesire.Simple, requerimiento: Colors.White, puntos: [2]),
  DesireCard(tipo: TypesOfDesire.Simple, requerimiento: Bugs.Ladybug, puntos: [3]),
  DesireCard(tipo: TypesOfDesire.Simple, requerimiento: Flowers.Lily, puntos: [2]),
  DesireCard(tipo: TypesOfDesire.Same, requerimiento: Flowers.Daisy, puntos: [0,1,2,4,7]),
  DesireCard(tipo: TypesOfDesire.Different, requerimiento: Flowers.Daisy, puntos: [0,0,1,3,5]),
  DesireCard(tipo: TypesOfDesire.Simple, requerimiento: Colors.Purple, puntos: [2]),
  DesireCard(tipo: TypesOfDesire.Simple, requerimiento: Colors.Pink, puntos: [2]),
  DesireCard(tipo: TypesOfDesire.Same, requerimiento: Colors.Orange, puntos: [0,1,2,4,7]),
  DesireCard(tipo: TypesOfDesire.Simple, requerimiento: Flowers.Tulip, puntos: [2]),
  DesireCard(tipo: TypesOfDesire.Different, requerimiento: Bugs.Null, puntos: [0,1,2,4,7]),
  DesireCard(tipo: TypesOfDesire.Simple, requerimiento: Bugs.Moth, puntos: [3]),
  DesireCard(tipo: TypesOfDesire.Simple, requerimiento: Flowers.Daisy, puntos: [2]),
  DesireCard(tipo: TypesOfDesire.Simple, requerimiento: Flowers.Poppy, puntos: [2])
];
// CLASSES
class GardenCard extends Equatable{

  late final TypesOfCard _typeOfCard;
  TypesOfCard get typeOfCard => _typeOfCard;

  late final Flowers _flower;
  late final Colors _color;
  late final Bugs _bug; 

  Flowers get flower => _flower;
  Colors get color => _color;
  Bugs get bug => _bug;

  bool hasStone = false;
  bool _isUpsidedown = false;
  bool get isUpsidedown => _isUpsidedown;


  GardenCard({required TypesOfCard tipoDeCarta}){
    _typeOfCard = tipoDeCarta;
  }

  void TurnCard(){
    _isUpsidedown = !_isUpsidedown;
  }

  @override
  List<Object?> get props => [_flower, _color, _bug];

}

class FlowerCard extends GardenCard{

  FlowerCard({required super.tipoDeCarta, required Flowers flor,required Colors col, Bugs bicho = Bugs.Null}){
    _flower = flor;
    _color = col;
    _bug = bicho;
  }


}

class ArrangementCard extends GardenCard{

  ArrangementCard({required super.tipoDeCarta, required Flowers flor,required Colors col, required Bugs bicho}){
    _flower = flor;
    _color = col;
    _bug = bicho;
  }
  
  
}

class CupOfTeaCard{

}

class BountyCard extends Equatable{
  // Equatable is for its "parameters" to be seen when print

  late final Enum requirement1;
  late final Enum requirement2;
  late final Enum requirement3;

  bool _isCompleated = false;
  bool get isCompleated  => _isCompleated;

  late final int _wasCompleatedAtDay;
  int get wasCompleatedAtDay => _wasCompleatedAtDay;

  BountyCard({required Enum requerimiento1, required Enum requerimiento2, required Enum requerimiento3}) {
    requirement1 = requerimiento1;
    requirement2 = requerimiento2;
    requirement3 = requerimiento3;
  }

  void compleatedAtDay(int day){
    _wasCompleatedAtDay = day;
  }

  @override
  List<Object?> get props => [requirement1, requirement2, requirement3];

}

class DesireCard{

  late final Enum typeOfDesire;
  late final Enum requirement;
  late final List<int> points;

  DesireCard({required TypesOfDesire tipo, required Enum requerimiento, required List<int> puntos}){
    typeOfDesire = tipo;
    requirement = requerimiento;
    points = puntos;
  }

}

class CrowCard{

  late final int replaceRowAt;
  late final replaceWith;

  CrowCard();

}

/* ---------------------------------------------------------------------------- */
