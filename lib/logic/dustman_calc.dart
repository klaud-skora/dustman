abstract class DustmanStatus {}
class GameRunning extends DustmanStatus {}
class GameWin extends DustmanStatus {}
class GameOver extends DustmanStatus {}

class DustmanCalc {
  
  final cost;
  DustmanCalc(this.cost);

  double sellPrice = 2;
  double _money = 10;
  int _amount = 1;
  int _trash = 0;

  double get money => _money;
  int get amount => _amount;
  int get trash => _trash;

  void increaseAmount() => _amount++;
  void decreaseAmount() => amount > 1 ? _amount-- : null;
  void payForAttempt() => _money = ((money - 0.1) * 10 ).round() / 10; 

  DustmanStatus get state {
    if( money < 1.5 && trash == 0) return GameOver();
    else if ( money >= 50 ) return GameWin();
    else return GameRunning();
  }

  double getCost() {
    return cost.newCost();
  }

  buyTrash(cost, number) {
    _trash += number;
    _money = ((money - cost * number) * 10).round() / 10;
    _amount = 1; // reset number of trash
  }

  sellTrash() {
    _money += trash * sellPrice;
    _trash = 0; // reset trash
  }

  paymentAttempt() {
    var cost = getCost(); 
    if( money > 0 ){ 
      payForAttempt();
      if( cost * amount <= money ) buyTrash(cost, amount);
    }
  }

  reset() {
    _money = 10;
    _amount = 1;
    _trash = 0;
  }

}