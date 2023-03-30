import 'package:floriferous/cards.dart';
import 'package:floriferous/floriferous.dart';

class Gameboard {
  late final Game game;

  Gameboard(this.game);

  /* ------ TABLERO GRAFICO ------ */
  void printBoard(){
    printBountyCardsZone();
    if (game.day <= game.maxDays) print('DAY: $game.day');
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
    if (game.day == 2) colToPrint = vals[game.column-1];
    if (game.day <= game.maxDays) print('Column: $colToPrint');
    print('------------------------------- MY DECK -------------------------------');
    printDeckCardsZone();
    print('-----------------------------------------------------------------------');
    print('');

  }

  void printBountyCardsZone(){
    // ignore: prefer_interpolation_to_compose_strings
    String message = ('|| ${game.bountyCards.elementAt(0).requirement1.name} ${game.bountyCards.elementAt(0).requirement2.name} ${game.bountyCards.elementAt(0).requirement3.name} (${game.bountyCards.elementAt(0).wasCompleatedAtDay}) || '+
          ' ${game.bountyCards.elementAt(1).requirement1.name} ${game.bountyCards.elementAt(1).requirement2.name} ${game.bountyCards.elementAt(1).requirement3.name} (${game.bountyCards.elementAt(1).wasCompleatedAtDay})' +
         ' || ${game.bountyCards.elementAt(2).requirement1.name} ${game.bountyCards.elementAt(2).requirement2.name} ${game.bountyCards.elementAt(2).requirement3.name} (${game.bountyCards.elementAt(2).wasCompleatedAtDay}) ||');

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
    if (game.day == 2)
    {
      row2.clear();
      for (int x = row.length-1; x > -1; x--) {
        row2.add(row[x]);
      } 
    }

    List<String> line = [];
    for (var element in row2) {
      String l = '${element.typeOfCard.toString().split('.').last.toUpperCase()}:${element.flower.toString().split('.').last}/${element.color.toString().split('.').last}/${element.bug.toString().split('.').last}';
      if (element.isUpsidedown) l = '//';
      if (!element.isThere) l = '---';
      if (element.hasStone){
        String stones = '*' * element.stonesInSpace;
         l += '($stones)';
      }
      line.add(l);
      
    }
    return line;
  }
  List<String> createDesireRow(List<DesireCard> row){
    List<DesireCard> row2 = row.toList();
    if (game.day == 2)
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
      if (!element.isThere) l = '---';
      if (element.hasStone){
        String stones = '*' * element.stonesInSpace;
        l += '($stones)';
      }
      line.add(l);
    }
    return line;
  }
  List<String> createDeckRow(List<Card> row){
    List<String> line = [];
    for (var element in game.deck) {
      if (element.typeOfCard != TypesOfCards.desire){
        element = element as GardenCard;
        line.add('${element.typeOfCard.toString().split('.').last.toUpperCase()}:${element.flower.toString().split('.').last}/${element.color.toString().split('.').last}/${element.bug.toString().split('.').last}');
      }
      if (element.typeOfCard == TypesOfCards.desire){
        element = element as DesireCard;
        line.add('${element.typeOfCard.toString().split('.').last.toUpperCase()}:${element.points.toString()}/${element.typeOfDesire.toString().split('.').last}/${element.requirement.toString()}');
      }
    }
    return line;
  }


  
}