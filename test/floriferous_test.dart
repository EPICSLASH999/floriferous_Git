import 'package:floriferous/floriferous.dart';
import 'package:test/test.dart';

void main() {
  test('Tamaño de cards = 51', () {
    expect(cards.length, equals(51));
  });
}

enum Flowers {Daisy, Lily, Mum, Poppy, Tulip, Null}
enum Colors {White, Yellow, Orange, Pink, Purple, Null}
enum Bugs {Bee, Beetle, Butterfly, Ladybug, Moth, Null}

List<Card> cards = [
  Card(flor: Flowers.Mum, col: Colors.Orange),
  Card(flor: Flowers.Mum, col: Colors.Pink),
  Card(flor: Flowers.Mum, col: Colors.Yellow),
  Card(flor: Flowers.Mum, col: Colors.White),
  Card(flor: Flowers.Mum, col: Colors.Purple),
  Card(flor: Flowers.Mum, col: Colors.Purple, bicho: Bugs.Butterfly),
  Card(flor: Flowers.Mum, col: Colors.Orange, bicho: Bugs.Beetle),
  Card(flor: Flowers.Mum, col: Colors.White, bicho: Bugs.Ladybug),
  Card(flor: Flowers.Mum, col: Colors.Pink, bicho: Bugs.Bee),
  Card(flor: Flowers.Mum, col: Colors.Yellow, bicho: Bugs.Moth),
  Card(flor: Flowers.Poppy, col: Colors.White),
  Card(flor: Flowers.Poppy, col: Colors.Orange),
  Card(flor: Flowers.Poppy, col: Colors.Pink),
  Card(flor: Flowers.Poppy, col: Colors.Yellow),
  Card(flor: Flowers.Poppy, col: Colors.Purple),
  Card(flor: Flowers.Poppy, col: Colors.Purple, bicho: Bugs.Beetle),
  Card(flor: Flowers.Poppy, col: Colors.Pink, bicho: Bugs.Butterfly),
  Card(flor: Flowers.Poppy, col: Colors.Orange, bicho: Bugs.Ladybug),
  Card(flor: Flowers.Poppy, col: Colors.Yellow, bicho: Bugs.Bee),
  Card(flor: Flowers.Poppy, col: Colors.White, bicho: Bugs.Moth),
  Card(flor: Flowers.Tulip, col: Colors.Pink),
  Card(flor: Flowers.Tulip, col: Colors.Orange),
  Card(flor: Flowers.Tulip, col: Colors.White),
  Card(flor: Flowers.Tulip, col: Colors.Yellow),
  Card(flor: Flowers.Tulip, col: Colors.Purple),
  Card(flor: Flowers.Tulip, col: Colors.Pink, bicho: Bugs.Beetle),
  Card(flor: Flowers.Tulip, col: Colors.Orange, bicho: Bugs.Moth),
  Card(flor: Flowers.Tulip, col: Colors.White, bicho: Bugs.Bee),
  Card(flor: Flowers.Tulip, col: Colors.Yellow, bicho: Bugs.Butterfly),
  Card(flor: Flowers.Tulip, col: Colors.Purple, bicho: Bugs.Ladybug),
  Card(flor: Flowers.Daisy, col: Colors.Purple),
  Card(flor: Flowers.Daisy, col: Colors.Pink),
  Card(flor: Flowers.Daisy, col: Colors.White),
  Card(flor: Flowers.Daisy, col: Colors.Orange),
  Card(flor: Flowers.Daisy, col: Colors.Yellow),
  Card(flor: Flowers.Daisy, col: Colors.Purple, bicho: Bugs.Moth),
  Card(flor: Flowers.Daisy, col: Colors.Pink, bicho: Bugs.Ladybug),
  Card(flor: Flowers.Daisy, col: Colors.White, bicho: Bugs.Butterfly),
  Card(flor: Flowers.Daisy, col: Colors.Orange, bicho: Bugs.Bee),
  Card(flor: Flowers.Daisy, col: Colors.Yellow, bicho: Bugs.Beetle),
  Card(flor: Flowers.Lily, col: Colors.Purple),
  Card(flor: Flowers.Lily, col: Colors.Orange),
  Card(flor: Flowers.Lily, col: Colors.White),
  Card(flor: Flowers.Lily, col: Colors.Yellow),
  Card(flor: Flowers.Lily, col: Colors.Pink),
  Card(flor: Flowers.Lily, col: Colors.Purple, bicho: Bugs.Bee),
  Card(flor: Flowers.Lily, col: Colors.Orange, bicho: Bugs.Butterfly),
  Card(flor: Flowers.Lily, col: Colors.White, bicho: Bugs.Beetle),
  Card(flor: Flowers.Lily, col: Colors.Yellow, bicho: Bugs.Ladybug),
  Card(flor: Flowers.Lily, col: Colors.Pink, bicho: Bugs.Moth),

  CupOfTeaCard(flor: Flowers.Null, col: Colors.Null)
  ];


class Card{
  late final Flowers _flower;
  late final Colors _color;
  late final Bugs _bug; 

  Flowers get flower => _flower;
  Colors get color => _color;
  Bugs get bug => _bug;

  Card({required Flowers flor,required Colors col, Bugs bicho = Bugs.Null}){
    _flower = flor;
    _color = col;
    _bug = bicho;
  }

}

class ArrangementCard extends Card{
  ArrangementCard({required super.flor, required super.col}){

  }
  
}

class CupOfTeaCard extends Card{
  CupOfTeaCard({required super.flor, required super.col});

}