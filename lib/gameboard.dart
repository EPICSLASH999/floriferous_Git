import 'package:chalkdart/chalk.dart';
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
    print(chalk.yellow.onBlue('Hello world!'));

    printBountyCardsZone();
    if (game.day <= game.maxDays) print('DAY: ${game.day}');
    if (game.day <= game.maxDays) printSymbology();
    print('');
    printHeaderRow();
    printGardenCardsZone();
    printDesireCardsZone();
    printHeaderRow();
    print('');
    print('Stones: ${game.stones}');
    //print('Stones (Crow): ${game.crow.stones}');
    print('UsedTeaCard: ${game.usedCupOfTeaCard}');
    print('');
    if (game.day <= game.maxDays) print('Column: ${game.obtainColumn()}');
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
      String bountyWasCompleatedAtDay = '(Day:${game.bountyCards.elementAt(i).wasCompleatedAtDay.toString()})';
      if (game.bountyCards.elementAt(i).wasCompleatedAtDay == 0) bountyWasCompleatedAtDay = '';
      message += '$req1 $req2 $req3 $bountyWasCompleatedAtDay || ';
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

    printNormalizedRow(createGardenRow(row1), '|');
    printNormalizedRow(createGardenRow(row2), '|');
  }
  void printDesireCardsZone(){
    printNormalizedRow(createDesireRow(game.row3), '|');
  }
  void printDeckCardsZone(){
    print(createDeckRow(game.deck));
  }
  void printHeaderRow(){
    printNormalizedRow(createHeaderRow(game.row1), '');
  }
  void printSymbology(){
    print('----------------------------------------------------');
    print('| Upside Down Card   |   Empty Slot    |   Stones  |');
    print('|        //          |       ---       |     (*)   |');
    print('----------------------------------------------------');
  }

  List<String> createGardenRow(List<GardenCard> row){
    List<Card> row2 = row.toList();
    if (game.day % 2 == 0) // This affects 'even numbers' such as 2,4,6...
    {row2 = flipOrderOfCards(row.toList());}

    List<String> line = [];
    for (var element in row2) {
      String l = obtainValuesOfCardToPrintInGameboard(element);
      line.add(normalizeSpacevalue(l));
    }
    return line;
  }
  List<String> createDesireRow(List<DesireCard> row){
    List<Card> row2 = row.toList();
    if (game.day % 2 == 0) // This affects 'even numbers' such as 2,4,6...
    {row2 = flipOrderOfCards(row.toList());}

    List<String> line = [];
    for (var element in row2) {
      String l = obtainValuesOfCardToPrintInGameboard(element);
      line.add(normalizeSpacevalue(l));
    }
    return line;
  }
  List<String> createDeckRow(List<Card> row){
    List<String> line = [];
    for (var element in row) {
      line.add(obtainValuesOfCardToPrint(element));
    }
    return line;
  }
  List<String> createRowToGiveToCrowACard(List<Card> row){
    List<String> line = [];
    for (int i = 0; i < row.length; i++) {
      line.add('${obtainValuesOfCardToPrint(row[i])}(${i+1})');
    }
    return line;
  }
  List<String> createHeaderRow(List row){
    List<String> list = [];
    for (int i = 0; i < row.length; i++) { 
      String l = '';
      if (i == (game.obtainColumn()-1)) l = '           #';
      l = normalizeSpacevalue(l);
      list.add(l);
    }
    return list;
  }

  List<Card> flipOrderOfCards(List<Card> originalCards){
    List<Card> newCards = [];
    for (int x = originalCards.length-1; x > -1; x--) {
      newCards.add(originalCards[x]);
    } 
    return newCards;
  }

  String obtainValuesOfCardToPrintInGameboard(Card card){
    String l = '';
    switch(card.typeOfCard){
      case TypesOfCards.desire: card = card as DesireCard;
        String points = card.points.toString().replaceAll(' ', '');
        String typeOfDesire = card.typeOfDesire.toString().split('.').last;
        String requirement = '/${card.requirement.toString()}';
        if (typeOfDesire != TypesOfDesire.simple.toString().split('.').last) requirement = requirement.split('.').first;
        typeOfDesire = (typeOfDesire == TypesOfDesire.simple.toString().split('.').last)? '' : '/$typeOfDesire';

        l ='$points$typeOfDesire$requirement';
        if (card.isUpsidedown) l = upsideDownCard;
        if (!card.isThere) l = isNotThereCard;
        if (card.hasStone){
          String stones = stone * card.stonesInSpace;
          l += '($stones)';
        }
      break;
      default: card = card as GardenCard;
        String typeOfCard = card.typeOfCard.toString().split('.').last.substring(0, 1).toUpperCase();
        String flower = card.flower.toString().split('.').last;
        String color = '/${card.color.toString().split('.').last}';
        String bug = card.bug.toString().split('.').last;
        bug = (bug == Bugs.none.toString().split('.').last)? '' : '/$bug';

        l = '$typeOfCard:$flower$color$bug';
        if (card.isUpsidedown) l = upsideDownCard;
        if (!card.isThere) l = isNotThereCard;
        if (card.hasStone){
          String stones = stone * card.stonesInSpace;
          l += '($stones)';
        }
      break;
    }
    return l;
  }
  String obtainValuesOfCardToPrint(Card card){
    String l = '';
    switch(card.typeOfCard){
      case TypesOfCards.desire: card = card as DesireCard;

        String typeOfCard = card.typeOfCard.toString().split('.').last.substring(0, 1).toUpperCase();
        String points = card.points.toString();
        String typeOfDesire = card.typeOfDesire.toString().split('.').last;
        String requirement = card.requirement.toString();
        if (typeOfDesire != TypesOfDesire.simple.toString().split('.').last) requirement = requirement.split('.').first;
            
        l ='$typeOfCard:$points/$typeOfDesire/$requirement';
      break;
      default: card = card as GardenCard;
        String typeOfCard = card.typeOfCard.toString().split('.').last.substring(0, 1).toUpperCase();
        String flower = card.flower.toString().split('.').last;
        String color = card.color.toString().split('.').last;
        String bug = card.bug.toString().split('.').last;
        if (bug == Bugs.none.toString().split('.').last) bug = '';

        l = '$typeOfCard:$flower/$color/$bug';
      break;
    }
    return l;
  }
  
  String normalizeSpacevalue(String value){
    String header = 'L:';
    String largestFlower = Flowers.daisy.toString().split('.').last;
    String largestColor = Colors.orange.toString().split('.').last;
    String largestBug = Bugs.butterfly.toString().split('.').last;
    int largestSize = ('$header:$largestFlower/$largestColor/$largestBug(**)').length;

    int leftSpace = largestSize - value.length;
    if (leftSpace < 0 ) leftSpace = 0;
    String extraSpace = ' ' * leftSpace;

    return (value + extraSpace);
  }

  void printNormalizedRow(List<String> row, String separator){
    String line = separator;
    for (var element in row) {
      line += ' $element $separator';
    }
    print(line);
  }
}