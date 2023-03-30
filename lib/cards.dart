import 'package:equatable/equatable.dart';


// ENUMS
enum Flowers {daisy, lily, mum, poppy, tulip, indifferent}
enum Colors {white, yellow, orange, pink, purple, indifferent}
enum Bugs {bee, beetle, butterfly, ladybug, moth, none, indifferent}

enum TypesOfCards {flower, arrangement, desire}
enum TypesOfDesire {simple, same, different}
enum CrowReplacements {stone, card}

// LISTS
List<GardenCard> _gardenCards = [
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
List <BountyCard> _bountyCards = [
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
List<DesireCard> _desireCards = [
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
List<CrowCard> _crowCards = [
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

class ListsOfCards{
  List<GardenCard> get gardenCards => _gardenCards;
  List <BountyCard> get bountyCards => _bountyCards;
  List<DesireCard> get desireCards => _desireCards;
  List<CrowCard> get crowCards => _crowCards;
}

// CLASSES
class Card extends Equatable{

  late final TypesOfCards _typeOfCard;
  TypesOfCards get typeOfCard => _typeOfCard;

  bool _isUpsidedown = false;
  bool get isUpsidedown => _isUpsidedown;

  bool _isThere = true;
  bool get isThere => _isThere;

  int _stonesInSpace = 0;
  int get stonesInSpace => _stonesInSpace;

  bool get hasStone => !(_stonesInSpace == 0);

  Card({required TypesOfCards tipoDeCarta}){
    _typeOfCard = tipoDeCarta;
  }

  void setUpsideDown(bool value){
    _isUpsidedown = value;
  }
  void setStonesInSpace(int value){
    _stonesInSpace = value;
  }
  void setIsThere(bool value){
    _isThere = value;
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

  void turnCard(){
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

  bool get isCompleated  => !(_wasCompleatedAtDay == 0);

  int _wasCompleatedAtDay = 0;
  int get wasCompleatedAtDay => _wasCompleatedAtDay;

  List points = [0,5,3,2];

  BountyCard({required Enum requerimiento1, required Enum requerimiento2, required Enum requerimiento3}) {
    requirement1 = requerimiento1;
    requirement2 = requerimiento2;
    requirement3 = requerimiento3;
  }

  void checkIfCompleated(List<Card> deck, int day){
    if (isCompleated) return;
    
    List<String> requirements = [requirement1.toString(),requirement2.toString(),requirement3.toString()];
    requirements.sort();
    int counter = 0;
    List<Card> tempCards = deck.toList();
    Map map = {};

    for (var element in tempCards) {
      if (element.typeOfCard != TypesOfCards.flower) continue;
      element = element as FlowerCard;
      if (requirements[0].split('.').first == 'Bugs'){
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
    
    List sortedValues = map.values.toList()..sort();
    if (sortedValues.isNotEmpty) {
      int leastValuableValue = sortedValues.first;
      var key = map.keys.firstWhere((k)
            => map[k] == leastValuableValue, orElse: () => null);
      tempCards.remove(key);
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
    
    sortedValues = map.values.toList()..sort();
    if (sortedValues.isNotEmpty) {
      int leastValuableValue = sortedValues.first;
      var key = map.keys.firstWhere((k)
            => map[k] == leastValuableValue, orElse: () => null);
      tempCards.remove(key);
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
    
    sortedValues = map.values.toList()..sort();
    if (sortedValues.isNotEmpty) {
      int leastValuableValue = sortedValues.first;
      var key = map.keys.firstWhere((k)
            => map[k] == leastValuableValue, orElse: () => null);
      tempCards.remove(key);
      counter++;
      map = {};
    }

    // Final piece of code 
    if (counter == 3) {
      compleatedAtDay(day);
    }
  }


  void compleatedAtDay(int day){
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
      case 'simple': score = obtainSimpleScore(listOfCards);
        break;
      case 'same': score = obtainSameScore(listOfCards);
        break;
      case 'different': score = obtainDifferentScore(listOfCards);
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

    int score = points[occurrences-1];
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
    
    var map2 = {};
    map2[key] = popularValue;

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

  int get replaceRowAt => _replaceRowAt;
  Enum get replaceWith => _replaceWith;
  int get numberOfStones => _numberOfStones;

  CrowCard({required int renglon, required CrowReplacements reemplazo, int numeroDePiedras = 0}){
    _replaceRowAt = renglon;
    _replaceWith = reemplazo;
    _numberOfStones = numeroDePiedras;
  }

  
  @override
  List<Object?> get props => [_replaceRowAt, _replaceWith, _numberOfStones];

}


// FUNCTIONS
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


