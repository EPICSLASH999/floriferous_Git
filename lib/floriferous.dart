import 'dart:io';
import 'gameboard.dart';
import 'cards.dart';

enum TypesOfValues {string, int}

// CLASS CROW
class Crow{
  int _stones = 0;
  int get stones => _stones;

  void addStones(int s){
    _stones += s;
  }
  void subtractStones(int s){
    _stones -= s;
  }
  void resetStones(){
    _stones = 0;
  }

  bool crowHasEnoughStonesToTakeACard() => _stones >= 4;
  

}

// CLASS GAME
class Game{
  List<BountyCard> _bountyCards = [];
  List<GardenCard> _gardenCards = [];
  List<DesireCard> _desireCards = [];
  List<CrowCard> _crowCards = [];

  List<BountyCard> get bountyCards => _bountyCards;
  List<GardenCard> get gardenCards => _gardenCards;
  List<DesireCard> get desireCards => _desireCards;
  List<CrowCard> get crowCards => _crowCards;

  List<GardenCard> row1 = [];
  List<GardenCard> row2 = [];
  List<DesireCard> row3 = [];

  // ignore: prefer_final_fields
  List<Card> _deck = [];
  List<Card> get deck => _deck;

  int _finalScore = 0;
  int get finalScore => _finalScore;

  int day = 1;
  final int maxDays = 3;
  int column = 1;
  final maxColumns = 5;

  bool _usedCupOfTeaCard = false;
  bool get usedCupOfTeaCard => _usedCupOfTeaCard;

  int _stones = 0;
  int get stones => _stones;

  bool _isGameOver = false;
  bool get isGameOver => _isGameOver;

  Crow crow = Crow();

  Game(){
    setGardenCards(shuffleGardenCards(ListsOfCards().gardenCards.toList()));
    setDesireCards(shuffleDesireCards(ListsOfCards().desireCards.toList()));
    setCrowCards(shuffleCrowCards(ListsOfCards().crowCards.toList()));
    setBountyCards(obtainThreeBountyCards().toList());

    generateDay();
  }

  // START OF GAME
  void startGame(){
    while (!_isGameOver){
      printGameboard();
      takeTurn();
    }
  }
  
  // SET GAME'S LISTS OF CARDS FROM THERE TO PICK
  void setGardenCards(List<GardenCard> cards){
    _gardenCards = cards.toList();
  }
  void setDesireCards(List<DesireCard> cards){
    _desireCards = cards.toList();
  }
  void setCrowCards(List<CrowCard> cards){
    _crowCards = cards.toList();
  }
  void setBountyCards(List<BountyCard> cards){
    _bountyCards = cards.toList();
  }
 
  // DAYS
  void generateDay() {
    generateGardenRows();
    setCardsOfGardenRows();
    generateDesireRow();
  }
  void endOfDay(List<Card> myDeck) {
    for (var element in _bountyCards) {
      element.checkIfCompleated(myDeck, day);
    }
    
    printMessage('>>>Crow has ${crow.stones} stones.');
    if (crow.crowHasEnoughStonesToTakeACard()){
      crowActionAtEndOfDay();
    }
    day++;
    column = 1;
    if (day > maxDays) {
      gameOver();
      return;
    }
    generateDay();
  }

  // GENERATE ROWS 
  List<BountyCard> obtainThreeBountyCards() {
    List<BountyCard> shuffledBCards = shuffleBountyCards(ListsOfCards().bountyCards.toList()).toList();
    List<BountyCard> tempCards = [];
    for (var i = 0; i < 3; i++) {
      tempCards.add(shuffledBCards.elementAt(i));
    }
    return tempCards.toList();
  }
  void generateGardenRows(){
    row1 = drawGardenCards(5).toList();
    row2 = drawGardenCards(5).toList();
  }
  void setCardsOfGardenRows(){
    row1[1].turnCard();
    row1[3].turnCard();

    row2[0].setStonesInSpace(1);
    row2[2].setStonesInSpace(1);
    row2[4].setStonesInSpace(1);
  }
  void generateDesireRow() {
    row3 = drawDesireCards(5).toList();
  }
  
  // DRAW CARDS
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
    if (_desireCards.isEmpty){
      _desireCards = shuffleDesireCards(desireCards).toList();
    }
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
  CrowCard drawCrowCard() {
    if (_crowCards.isEmpty) _crowCards = shuffleCrowCards(ListsOfCards().crowCards.toList()).toList();
    
    CrowCard card = _crowCards.elementAt(_crowCards.length-1);
    _crowCards.removeAt(_crowCards.length-1);
    return card;
  }
  
  // TURNS
  void takeTurn(){
    printMessage('Which card shall thou take?');
    List<String> validAnswers = fillListOfNumbers(1, 3);
    int numericResponse = obtainSpecificNumericResponse(validAnswers);
    takeCard(numericResponse);
    endOfTurn();
  }
  void endOfTurn(){
    nextColumn();
    if (column <= maxColumns) {
      cupOfTeaOrCrow();
    }
    if (column > maxColumns) endOfDay(_deck);
  }
  void nextColumn(){
    column++;
  }
  void cupOfTeaOrCrow(){
    if (!_usedCupOfTeaCard){
      printMessage('Do you want to use Cup of Tea? Y/N');
      String response = obtainResponse().toUpperCase();
      if (response == 'Y'){
        useCupOfTea();
        return;
      }
    }
    crowActs(drawCrowCard());
  }

  // TAKE CARD (AS A PLAYER)
  void takeCard(int row){
    if (_isGameOver) return;
    switch (row){
      case 1: GardenCard card = row1.elementAt(column-1);
              if (!card.isThere && card.hasStone){
                crow.subtractStones(card.stonesInSpace);
              }
              if (card.isThere){
                _deck.add(card);
                card.setIsThere(false); // si NO funciona esto, reemplazar por "row1.elementAt(column-1)._isThere = false"
                printMessage('>>>Card taken: ${Gameboard(this).obtainValuesOfCardToPrint(card)}');
              }
              if (card.hasStone) {
                _stones += card.stonesInSpace;
                card.setStonesInSpace(0);
              }
        break;
      case 2: GardenCard card = row2.elementAt(column-1);
              if (!card.isThere && card.hasStone){
                crow.subtractStones(card.stonesInSpace);
              }
              if (card.isThere){
                _deck.add(card);
                card.setIsThere(false);
                printMessage('>>>Card taken: ${Gameboard(this).obtainValuesOfCardToPrint(card)}'); 
              }
              if (card.hasStone) {
                _stones += card.stonesInSpace;
                card.setStonesInSpace(0);
              }
        break;
      case 3: DesireCard card = row3.elementAt(column-1);
              if (!card.isThere && card.hasStone){
                crow.subtractStones(card.stonesInSpace);
              }
              if (card.isThere){
                _deck.add(card);
                card.setIsThere(false);
                printMessage('>>>Card taken: ${Gameboard(this).obtainValuesOfCardToPrint(card)}'); 
              }
              if (card.hasStone) {
                _stones += card.stonesInSpace;
                card.setStonesInSpace(0);
              }
        break;
    }

  }
  void useCupOfTea(){
    _usedCupOfTeaCard = true;
  }

  // DEVIL CROW
  void crowActs(CrowCard crowC) {
    String crowReplacement = crowC.replaceWith.toString().split('.').last;
    String crowStones = '';
    if (crowReplacement == CrowReplacements.stone.toString().split('.').last) crowStones = '(${crowC.numberOfStones.toString()})';
    print('>>>Crow: Replaces(${crowC.replaceRowAt}) with $crowReplacement$crowStones');
    switch(crowC.replaceWith){
      case CrowReplacements.stone:
        switch (crowC.replaceRowAt){
          case 1: row1.elementAt(column-1).setIsThere(false);
                  row1.elementAt(column-1).setStonesInSpace(crowC.numberOfStones);
            break;
          case 2: row2.elementAt(column-1).setIsThere(false);
                  row2.elementAt(column-1).setStonesInSpace(crowC.numberOfStones);
            break;
          case 3: row3.elementAt(column-1).setIsThere(false);
                  row3.elementAt(column-1).setStonesInSpace(crowC.numberOfStones);
            break;
        }
        crow.addStones(crowC.numberOfStones);
        break;
      case CrowReplacements.card: 
        switch (crowC.replaceRowAt){
          case 1: row1[column-1] = drawGardenCard();
                  row1[column-1].setUpsideDown(true);
            break;
          case 2: row2[column-1] = drawGardenCard();
                  row2[column-1].setUpsideDown(true);
            break;
          case 3: row3[column-1] = drawDesireCard();
                  row3[column-1].setUpsideDown(true);
            break;
        }
        break;
    }
  }
  void crowActionAtEndOfDay(){
    print('Do you want to pay stones to crow? Y/N');
    String? response = stdin.readLineSync();
    response ??= 'N';
    response = response.toUpperCase();
    if (response == 'Y') getStonesToPayCrow();
    if (crow.crowHasEnoughStonesToTakeACard()) obtainCardToSteal();
  }
  void getStonesToPayCrow(){
    printMessage('How many stones shall thou pay?');
    List<String> validAnswers = fillListOfNumbers(0, _stones);
    int numericResponse = obtainSpecificNumericResponse(validAnswers);
    payToCrow(numericResponse);
  }
  void payToCrow(int stones){
    crow.subtractStones(stones);
    _stones -= stones;
  }
  void obtainCardToSteal(){ 
    List<GardenCard> tempList = [];
    for (var element in _deck) {
      if (element.typeOfCard != TypesOfCards.desire){
        tempList.add(element as GardenCard);
      }
    }
    if (tempList.isEmpty){
      printMessage('No GardenCards to give. Crow does not take nothing...');
      return;
    }
    printMessage('You have to pay to the crow a card from the following list:');
    Gameboard t = Gameboard(this);
    print(t.createRowToGiveToCrowACard(tempList));

    List<String> validAnswers = fillListOfNumbers(1, tempList.length);
    int numericResponse = obtainSpecificNumericResponse(validAnswers);

    crowTakesCard(tempList.elementAt(numericResponse-1));
    
    crow.resetStones();
  }
  void crowTakesCard(Card card){
    _deck.remove(card);
  }

  // SHOW GRAPHIC GAMEBOARD
  void printGameboard(){
    Gameboard t = Gameboard(this);
    t.printBoard();
  }

// END OF GAME
  void gameOver(){
    printGameboard();
    printMessage('**************** GAME OVER ****************');
    _isGameOver = true;
    obtainFinalScore();
    printMessage('--> FINAL SCORE: $finalScore');
    printMessage('--> Your Mood: "${obtainScoringMood()}"');
    print('');
    print('');
    printMessage('Press enter to exit...');
    obtainResponse();
  }

  // OBTAIN SCORE
  int obtainFinalScore(){
    _finalScore += obtainDeckScore();
    //print('Score of Arrangement & Desire: ${obtainDeckScore()}');
    _finalScore += obtainBountyCardsScore();
    print('Score of BountyCards: ${obtainBountyCardsScore()}');
    _finalScore += obtainCupOfTeaCardScore();
    print('Score of Cup Of Tea: ${obtainCupOfTeaCardScore()}');
    _finalScore += obtainStonesScore();
    print('Score of stones: ${obtainStonesScore()}');
    return _finalScore;
  }
  int obtainDeckScore(){
    int score = 0;
    int score2 = 0;
    for (var element in _deck) {
      if (element.typeOfCard == TypesOfCards.desire){
        element = element as DesireCard;
        score += element.obtainScore(_deck);
      }
      if (element.typeOfCard == TypesOfCards.arrangement){
        element = element as ArrangementCard;
        score2 += element.obtainScore(_deck);
      }
    }
    print('Score of Desire: $score');
    print('Score of Arrangement: $score2');
    return score + score2;
  }
  int obtainCupOfTeaCardScore(){
    if (!_usedCupOfTeaCard) return 2;
    return 0;
  }
  int obtainBountyCardsScore() {
    int score = 0;
    for (var element in _bountyCards) {
      int s = element.obtainScore();
      score += s;
    }
    return score;
  }
  int obtainStonesScore(){
    return (_stones/2).floor();
  }
  String obtainScoringMood(){
    if (_finalScore < 21) return 'Anxious';
    if (_finalScore >= 21 && _finalScore <= 26) return 'Chill';
    if (_finalScore >= 27 && _finalScore <= 32) return 'Cool as a Cucumber';
    if (_finalScore >= 33 && _finalScore <= 38) return 'Really Relaxed';
    if (_finalScore >= 39 && _finalScore <= 44) return 'Utter Zen';
    return 'Nirvana';
  }
 
  /* MISC FUNCTIONS */
  void printMessage(String message){
    print(message);
  }
  String obtainResponse(){
    String? response = stdin.readLineSync();
    response ??= 'N';
    return response;
  }
  List<String> fillListOfNumbers(int minNumber, int maxNumber){
    List<String> myList = [];
    for (var i = minNumber; i <= maxNumber; i++) {
      myList.add(i.toString());
    }
    return myList;
  }
  int obtainSpecificNumericResponse(List<String> validAnswers) {
    int numericResponse = 1;
    do{
      String response = obtainResponse();
      if (validAnswers.contains(response)) {
        numericResponse = int.parse(response);
        break;
      }
      printMessage("The answer must be in the range from ${validAnswers[0]}-${validAnswers[validAnswers.length-1]}!");
    } while(true);
    return numericResponse;
  }
  int obtainColumn(){
    List<int> vals = [5,4,3,2,1];
    int col = column;
    if (day % 2 == 0) col = vals[column-1];
    return col;
  }

  // ONLY FOR TESTS
  void setStones(int stones){
    // This is for tests only
    _stones = stones;
  }
  void setDeck(List<Card> cards){
    // This method is for test only
    _deck = cards.toList();
  }
  void crowTakesCardAtPosition(int positionOfCard){
    _deck.removeAt(positionOfCard-1);
  }
}


