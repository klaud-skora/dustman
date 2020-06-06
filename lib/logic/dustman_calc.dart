import 'dart:math';

abstract class DustmanStatus {}

class GameRunning extends DustmanStatus {}
class GameWin extends DustmanStatus {}
class GameOver extends DustmanStatus {}


class DustmanCalc {
  int trash = 0;
  double sellPrice = 2;
  double _money = 10;
  int _amount = 1;

  double get money => _money;
  int get amount => _amount;

  void increaseAmount() => _amount++;
  void decreaseAmount() => amount > 1 ? _amount-- : null;
  void payForAttempt() => _money -= 0.1;

  DustmanStatus get state {
    if( money <= 1.5 && trash == 0) return GameOver();
    else if ( money >= 50 ) return GameWin();
    else return GameRunning();
  }

  double getCost() {
    var random = new Random();
    double cost = ((random.nextDouble() + 1.5) * 10).round() / 10;
    return cost;
  }

  buyTrash(cost, number) {
    trash += number;
    _money = ((money - cost * number) * 10).round() / 10;
    _amount = 1; // reset number of trash
  }

  sellTrash() {
    _money += trash * sellPrice;
    trash = 0; // reset trash
  }

  paymentAttempt() {
    payForAttempt();
    var cost = getCost(); 
    if( cost * amount <= money ) buyTrash(cost, amount);
  }

}