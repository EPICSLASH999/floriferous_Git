import 'package:floriferous/floriferous.dart';
import 'package:test/test.dart';

void main() {
  test('Tamaño de cards = 56', () {
    expect(gardenCards.length, equals(56));
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

}

enum Flowers {Daisy, Lily, Mum, Poppy, Tulip}
enum Colors {White, Yellow, Orange, Pink, Purple}
enum Bugs {Bee, Beetle, Butterfly, Ladybug, Moth, Null}

enum TypeOfCard {Flower, Arrangement, CupOfTea, Bounty, Desire, Crow}

List<Card> gardenCards = [
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

  CupOfTeaCard(tipoDeCarta: TypeOfCard.CupOfTea),

  ArrangementCard(tipoDeCarta: TypeOfCard.Arrangement, flor: Flowers.Poppy, col: Colors.Orange, bicho: Bugs.Moth),
  ArrangementCard(tipoDeCarta: TypeOfCard.Arrangement, flor: Flowers.Tulip, col: Colors.Yellow, bicho: Bugs.Ladybug),
  ArrangementCard(tipoDeCarta: TypeOfCard.Arrangement, flor: Flowers.Lily, col: Colors.Purple, bicho: Bugs.Butterfly),
  ArrangementCard(tipoDeCarta: TypeOfCard.Arrangement, flor: Flowers.Daisy, col: Colors.White, bicho: Bugs.Moth),
  ArrangementCard(tipoDeCarta: TypeOfCard.Arrangement, flor: Flowers.Mum, col: Colors.Pink, bicho: Bugs.Beetle),
];

List <BountyCard> bountyCards = [
  BountyCard(tipoDeCarta: TypeOfCard.Bounty, requerimiento1: Flowers.Tulip, requerimiento2: Bugs.Ladybug, requerimiento3: Bugs.Butterfly),
  BountyCard(tipoDeCarta: TypeOfCard.Bounty, requerimiento1: Flowers.Tulip, requerimiento2: Flowers.Tulip, requerimiento3: Flowers.Daisy),
  BountyCard(tipoDeCarta: TypeOfCard.Bounty, requerimiento1: Bugs.Beetle, requerimiento2: Bugs.Ladybug, requerimiento3: Bugs.Bee),
  BountyCard(tipoDeCarta: TypeOfCard.Bounty, requerimiento1: Flowers.Lily, requerimiento2: Flowers.Mum, requerimiento3: Flowers.Tulip),
  BountyCard(tipoDeCarta: TypeOfCard.Bounty, requerimiento1: Flowers.Daisy, requerimiento2: Flowers.Mum, requerimiento3: Bugs.Bee),
  BountyCard(tipoDeCarta: TypeOfCard.Bounty, requerimiento1: Flowers.Lily, requerimiento2: Flowers.Lily, requerimiento3: Bugs.Ladybug),
  BountyCard(tipoDeCarta: TypeOfCard.Bounty, requerimiento1: Flowers.Poppy, requerimiento2: Flowers.Daisy, requerimiento3: Bugs.Beetle),
  BountyCard(tipoDeCarta: TypeOfCard.Bounty, requerimiento1: Flowers.Lily, requerimiento2: Flowers.Poppy, requerimiento3: Bugs.Moth),
  BountyCard(tipoDeCarta: TypeOfCard.Bounty, requerimiento1: Flowers.Poppy, requerimiento2: Flowers.Mum, requerimiento3: Bugs.Butterfly),
  
];

class Card{

  late final TypeOfCard _typeOfCard;
  TypeOfCard get typeOfCard => _typeOfCard;

  Card({required TypeOfCard tipoDeCarta}){
    _typeOfCard = tipoDeCarta;
  }

}

class FlowerCard extends Card{
  late final Flowers _flower;
  late final Colors _color;
  late final Bugs _bug; 

  Flowers get flower => _flower;
  Colors get color => _color;
  Bugs get bug => _bug;

  FlowerCard({required super.tipoDeCarta, required Flowers flor,required Colors col, Bugs bicho = Bugs.Null}){
    _flower = flor;
    _color = col;
    _bug = bicho;
  }
}

class ArrangementCard extends Card{
  late final Flowers _flower;
  late final Colors _color;
  late final Bugs _bug; 

  Flowers get flower => _flower;
  Colors get color => _color;
  Bugs get bug => _bug;

  ArrangementCard({required super.tipoDeCarta, required Flowers flor,required Colors col, required Bugs bicho}){
    _flower = flor;
    _color = col;
    _bug = bicho;
  }
  
  
}

class CupOfTeaCard extends Card{
  CupOfTeaCard({required super.tipoDeCarta});

}

class BountyCard extends Card{

  late final Enum requirement1;
  late final Enum requirement2;
  late final Enum requirement3;

  BountyCard({required super.tipoDeCarta, required Enum requerimiento1, required Enum requerimiento2, required Enum requerimiento3}) {
    requirement1 = requerimiento1;
    requirement2 = requerimiento2;
    requirement3 = requerimiento3;
  }

}

class DesireCard extends Card{
  DesireCard({required super.tipoDeCarta});

}

class CrowCard extends Card{

  late final int replaceRowAt;
  late final replaceWith;

  CrowCard({required super.tipoDeCarta});

}

