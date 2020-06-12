import 'dart:math';

abstract class Cost {
  double cost;
  double newCost();

}
class RandomCost extends Cost {
  
  double cost;
  
  @override
  double newCost() {
    var probability = 0.95;
    var random = new Random();
    if(random.nextDouble() > probability) cost = ((random.nextDouble() * .5 + 2.0) * 10).round() / 10; // 2 < price < 2.5 
    else cost = ((random.nextDouble() * .5 + 1.5) * 10).round() / 10; // 1.5 < price < 2.0
    return cost;
  }
}

class TestCost extends Cost {
  
  double cost;

  @override
  double newCost() {
    return .9;
  }
}