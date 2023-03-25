import 'dart:developer';
import 'dart:ffi';
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
    FlowerCard card = FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Daisy, col: Colors.Orange);
    expect(card.typeOfCard, equals(TypeOfCard.Flower));
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
    expect(card._typeOfCard, equals(TypeOfCard.Flower));
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
    List<GardenCard> cards = gardenCards.toList();
    GardenCard card = drawGardenCard(cards);

    print(cards.elementAt(cards.length-1));
    print(card);

    expect(cards.elementAt(cards.length-1), equals(card));

  });

  });
  
  
  group('Game1: ', () {
    
    test('El total de garden cards disminuye a 45 tras contruir el tablero', () {
      Game game = Game();
      //print(game.gardenCards);
      expect(game.GetGardenCards().length, equals(45));
    });
  });

  group('Game2: ', () {
    test('Game ha generado sus bounty cards', () {
      Game game = Game();
      //print(game.GetBountyCards());
      expect(game.GetBountyCards().length, equals(3));
    });
    test('Despues de turno es columna 2', () {
      Game game = Game();
      game.NextTurn();
      expect(game.column, equals(2));
    });
    test('Despues de 5 turnos es columna 1 de nuevo', () {
      Game game = Game();
      game.NextTurn();
      game.NextTurn();
      game.NextTurn();
      game.NextTurn();
      game.NextTurn();
      expect(game.column, equals(1));
    });
  });
  
  group('Game3: ', () {
    test('Imprimir tablero', () {
      Game game = Game();
      game.ImprimirTablero();
    });
  });


}



class Game{
  late final List<BountyCard> _bountyCards;
  List<GardenCard> _gardenCards = [];

  int day = 1;
  int column = 1;

  List<GardenCard> row1 = [];
  List<GardenCard> row2 = [];

  Game(){
    _bountyCards = generateBountyCards();

    BuildDay();
  }
  
  void BuildDay() {
    //gardenCards = generateGardenCards(gardenCards, gardenCards.length); 
    _gardenCards = gardenCards;

    BuildRows();
  }

  void NextTurn(){
    column++;
    if (column > 5){
      column = 1;
      day++;
    }
  }


  BuildRows(){
    row1 = generateGardenCards(_gardenCards, 5);
    row2 = generateGardenCards(_gardenCards, 5);

    SetCardsOfRows();
  }

  SetCardsOfRows(){
    // Move this to the BuildRows method

    row1.elementAt(1).TurnCard();
    row1.elementAt(3).TurnCard();

    row2.elementAt(0).hasStone = true;
    row2.elementAt(2).hasStone = true;
    row2.elementAt(4).hasStone = true;
  }

  void ImprimirTablero(){
    PrintBountyCardsZone();
  }

  void PrintBountyCardsZone(){
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


  List<GardenCard> GetRowByColumn(){
    return [row1.elementAt(column-1), row2.elementAt(column-1)];

  }

  List<GardenCard> GetGardenCards(){
    return _gardenCards;
  }
  List<BountyCard> GetBountyCards(){
    return _bountyCards;
  }

  List<GardenCard> generateGardenCards(List<GardenCard> receivedCarts, int numberOfCards) {
    List<GardenCard> temporalCards = receivedCarts;
    List<GardenCard> finalCards = [];

    for (var i = 0; i < numberOfCards; i++) {
      final _random = new Random();
      GardenCard c = temporalCards[_random.nextInt(temporalCards.length)];
      finalCards.add(c);
      temporalCards.remove(c);
    }

    _gardenCards = temporalCards;
    return finalCards;
}


}




/* ---------------------------------- CARDS ---------------------------------- */
List<BountyCard> generateBountyCards() {
  List<BountyCard> temporalCards = bountyCards;
  List<BountyCard> finalCards = [];

  for (var i = 0; i < 3; i++) {
    final _random = new Random();
    BountyCard c = temporalCards[_random.nextInt(temporalCards.length)];
    finalCards.add(c);
    temporalCards.remove(c);
  }

  return finalCards;
}

List<BountyCard> shuffleBountyCards(List<BountyCard> cards){
  cards.shuffle();
  return cards;
}
List<GardenCard> shuffleGardenCards(List<GardenCard> cards){
  cards.shuffle();
  return cards;
}
GardenCard drawGardenCard(List<GardenCard> cards) {
  return cards.elementAt(cards.length-1);

}

enum Flowers {Daisy, Lily, Mum, Poppy, Tulip}
enum Colors {White, Yellow, Orange, Pink, Purple}
enum Bugs {Bee, Beetle, Butterfly, Ladybug, Moth, Null}

enum TypeOfCard {Flower, Arrangement}

List<GardenCard> gardenCards = [
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Mum, col: Colors.Orange),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Mum, col: Colors.Pink),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Mum, col: Colors.Yellow),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Mum, col: Colors.White),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Mum, col: Colors.Purple),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Mum, col: Colors.Purple, bicho: Bugs.Butterfly),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Mum, col: Colors.Orange, bicho: Bugs.Beetle),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Mum, col: Colors.White, bicho: Bugs.Ladybug),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Mum, col: Colors.Pink, bicho: Bugs.Bee),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Mum, col: Colors.Yellow, bicho: Bugs.Moth),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Poppy, col: Colors.White),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Poppy, col: Colors.Orange),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Poppy, col: Colors.Pink),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Poppy, col: Colors.Yellow),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Poppy, col: Colors.Purple),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Poppy, col: Colors.Purple, bicho: Bugs.Beetle),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Poppy, col: Colors.Pink, bicho: Bugs.Butterfly),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Poppy, col: Colors.Orange, bicho: Bugs.Ladybug),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Poppy, col: Colors.Yellow, bicho: Bugs.Bee),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Poppy, col: Colors.White, bicho: Bugs.Moth),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Tulip, col: Colors.Pink),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Tulip, col: Colors.Orange),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Tulip, col: Colors.White),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Tulip, col: Colors.Yellow),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Tulip, col: Colors.Purple),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Tulip, col: Colors.Pink, bicho: Bugs.Beetle),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Tulip, col: Colors.Orange, bicho: Bugs.Moth),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Tulip, col: Colors.White, bicho: Bugs.Bee),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Tulip, col: Colors.Yellow, bicho: Bugs.Butterfly),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Tulip, col: Colors.Purple, bicho: Bugs.Ladybug),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Daisy, col: Colors.Purple),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Daisy, col: Colors.Pink),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Daisy, col: Colors.White),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Daisy, col: Colors.Orange),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Daisy, col: Colors.Yellow),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Daisy, col: Colors.Purple, bicho: Bugs.Moth),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Daisy, col: Colors.Pink, bicho: Bugs.Ladybug),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Daisy, col: Colors.White, bicho: Bugs.Butterfly),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Daisy, col: Colors.Orange, bicho: Bugs.Bee),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Daisy, col: Colors.Yellow, bicho: Bugs.Beetle),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Lily, col: Colors.Purple),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Lily, col: Colors.Orange),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Lily, col: Colors.White),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Lily, col: Colors.Yellow),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Lily, col: Colors.Pink),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Lily, col: Colors.Purple, bicho: Bugs.Bee),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Lily, col: Colors.Orange, bicho: Bugs.Butterfly),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Lily, col: Colors.White, bicho: Bugs.Beetle),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Lily, col: Colors.Yellow, bicho: Bugs.Ladybug),
  FlowerCard(tipoDeCarta: TypeOfCard.Flower, flor: Flowers.Lily, col: Colors.Pink, bicho: Bugs.Moth),

  ArrangementCard(tipoDeCarta: TypeOfCard.Arrangement, flor: Flowers.Poppy, col: Colors.Orange, bicho: Bugs.Moth),
  ArrangementCard(tipoDeCarta: TypeOfCard.Arrangement, flor: Flowers.Tulip, col: Colors.Yellow, bicho: Bugs.Ladybug),
  ArrangementCard(tipoDeCarta: TypeOfCard.Arrangement, flor: Flowers.Lily, col: Colors.Purple, bicho: Bugs.Butterfly),
  ArrangementCard(tipoDeCarta: TypeOfCard.Arrangement, flor: Flowers.Daisy, col: Colors.White, bicho: Bugs.Bee),
  ArrangementCard(tipoDeCarta: TypeOfCard.Arrangement, flor: Flowers.Mum, col: Colors.Pink, bicho: Bugs.Beetle),
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

class GardenCard extends Equatable{

  late final TypeOfCard _typeOfCard;
  TypeOfCard get typeOfCard => _typeOfCard;

  late final Flowers _flower;
  late final Colors _color;
  late final Bugs _bug; 

  Flowers get flower => _flower;
  Colors get color => _color;
  Bugs get bug => _bug;

  bool hasStone = false;
  bool _isUpsidedown = false;
  bool get isUpsidedown => _isUpsidedown;


  GardenCard({required TypeOfCard tipoDeCarta}){
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
  DesireCard();

}

class CrowCard{

  late final int replaceRowAt;
  late final replaceWith;

  CrowCard();

}

/* ---------------------------------------------------------------------------- */
