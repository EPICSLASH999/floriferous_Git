import 'package:floriferous/floriferous.dart';
import 'package:test/test.dart';

void main() {
  test('calculate', () {
    expect(calculate(), 42);
  });
}

enum Flowers {Daisy, Lily, Mum, Poppy, Tulip}
enum Colors {White, Yellow, Orange, Pink, Purple}
enum Bugs {Bee, Beetle, Butterfly, Ladybug, Moth}

class Card{
  late final Flowers _flower;
  late final Colors _color;
  late final Bugs _bug; 

  Flowers get flower => _flower;
  Colors get color => _color;
  Bugs get bug => _bug;

}

class ArrangementCard extends Card{
  
}