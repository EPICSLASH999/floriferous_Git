import 'package:floriferous/cards.dart';
import 'package:floriferous/floriferous.dart';

class Gameboard {
  late final Game game;

  // SYMBOLOGY
  String upsideDownCard = '//';
  String isNotThereCard = '---';
  String stone = '*';

  // Constructor
  Gameboard(this.game);

  
  void printBoard(){
    printBountyCardsZone();
    if (game.day <= game.maxDays) print('DAY: ${game.day}');
    print('----------------------------------------------------');
    print('| Upside Down Card   |   Empty Slot    |   Stones  |');
    print('|        //          |       ---       |     (*)   |');
    print('----------------------------------------------------');
    print('');
    printGardenCardsZone();
    print('');
    printDesireCardsZone();
    print('');
    print('Stones: ${game.stones}');
    print('Stones (Crow): ${game.crow.howManyStonesHas()}');
    print('UsedTeaCard: ${game.usedCupOfTeaCard}');
    print('');
    List<int> vals = [5,4,3,2,1];
    int colToPrint = game.column;
    if (game.day % 2 == 0) colToPrint = vals[game.column-1];
    if (game.day <= game.maxDays) print('Column: $colToPrint');
    print('------------------------------- MY DECK -------------------------------');
    printDeckCardsZone();
    print('-----------------------------------------------------------------------');
    print('');

  }

  void printBountyCardsZone(){
    String message = '|| ';
    for (var i = 0; i < game.bountyCards.length; i++) {
      String req1 = game.bountyCards.elementAt(i).requirement1.name.toUpperCase();
      String req2 = game.bountyCards.elementAt(i).requirement2.name.toUpperCase();
      String req3 = game.bountyCards.elementAt(i).requirement3.name.toUpperCase();
      String bountyWasCompleatedAtDay = game.bountyCards.elementAt(i).wasCompleatedAtDay.toString();
      message += '$req1 $req2 $req3 (Day:$bountyWasCompleatedAtDay) ||';
    }
    String title = ' BOUNTY CARDS ';
    String line1 = '-' * ((message.length~/2) - title.length~/2);
    String line2 = '-' * (message.length);
    
    print('$line1$title$line1');
    print(message);
    print(line2);
  }
  void printGardenCardsZone(){
    List<GardenCard> row1 = game.row1;
    List<GardenCard> row2 = game.row2;

    print(createGardenRow(row1));
    print(createGardenRow(row2));
  }
  void printDesireCardsZone(){
    print(createDesireRow(game.row3));
  }
  void printDeckCardsZone(){
    print(createDeckRow(game.deck));
  }

  List<String> createGardenRow(List<GardenCard> row){
    List<GardenCard> row2 = row.toList();
    if (game.day % 2 == 0) // This affects 'even numbers' such as 2,4,6...
    {
      row2.clear();
      for (int x = row.length-1; x > -1; x--) {
        row2.add(row[x]);
      } 
    }

    List<String> line = [];
    for (var element in row2) {
      String typeOfCard = element.typeOfCard.toString().split('.').last.substring(0, 1).toUpperCase();
      String flower = element.flower.toString().split('.').last;
      String color = element.color.toString().split('.').last;
      String bug = element.bug.toString().split('.').last;
      if (bug == Bugs.none.toString().split('.').last) bug = '';

      String l = '$typeOfCard:$flower/$color/$bug';
      if (element.isUpsidedown) l = upsideDownCard;
      if (!element.isThere) l = isNotThereCard;
      if (element.hasStone){
        String stones = stone * element.stonesInSpace;
         l += '($stones)';
      }
      line.add(l);
      
    }
    return line;
  }
  List<String> createDesireRow(List<DesireCard> row){
    List<DesireCard> row2 = row.toList();
    if (game.day % 2 == 0) // This affects 'even numbers' such as 2,4,6...
    {
      row2.clear();
      for (int x = row.length-1; x > -1; x--) {
        row2.add(row[x]);
      } 
    }

    List<String> line = [];
    for (var element in row2) {
      String l = '';
      String points = element.points.toString();
      String typeOfDesire = element.typeOfDesire.toString().split('.').last;
      String requirement = element.requirement.toString();
      if (typeOfDesire != TypesOfDesire.simple.toString().split('.').last) requirement = requirement.split('.').first;
      
      l ='$points/$typeOfDesire/$requirement';
      if (element.isUpsidedown) l = upsideDownCard;
      if (!element.isThere) l = isNotThereCard;
      if (element.hasStone){
        String stones = stone * element.stonesInSpace;
        l += '($stones)';
      }
      line.add(l);
    }
    return line;
  }
  List<String> createDeckRow(List<Card> row){
    List<String> line = [];
    for (var element in row) {
      if (element.typeOfCard != TypesOfCards.desire){
        element = element as GardenCard;

        String typeOfCard = element.typeOfCard.toString().split('.').last.substring(0, 1).toUpperCase();
        String flower = element.flower.toString().split('.').last;
        String color = element.color.toString().split('.').last;
        String bug = element.bug.toString().split('.').last;
        if (bug == Bugs.none.toString().split('.').last) bug = '';

        String l = '$typeOfCard:$flower/$color/$bug';
        line.add(l);
      }
      if (element.typeOfCard == TypesOfCards.desire){
        element = element as DesireCard;

        String l = '';
        String typeOfCard = element.typeOfCard.toString().split('.').last.substring(0, 1).toUpperCase();
        String points = element.points.toString();
        String typeOfDesire = element.typeOfDesire.toString().split('.').last;
        String requirement = element.requirement.toString();
        if (typeOfDesire != TypesOfDesire.simple.toString().split('.').last) requirement = requirement.split('.').first;
        
        l ='$typeOfCard:$points/$typeOfDesire/$requirement';
        line.add(l);
      }
    }
    return line;
  }

}