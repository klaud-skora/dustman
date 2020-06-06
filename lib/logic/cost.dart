import 'dart:math';

abstract class Cost {
  double cost;
  double newCost();

}
class RandomCost extends Cost {
  
  double cost;
  
  @override
  double newCost() {
    var random = new Random();
    double cost = ((random.nextDouble() + 1.5) * 10).round() / 10;
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