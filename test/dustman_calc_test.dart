import 'package:flutter_test/flutter_test.dart';
import 'package:dustman/logic/dustman_calc.dart';
import 'package:dustman/logic/cost.dart';

void main() {
  test('default state', () {
    RandomCost cost = RandomCost();
    DustmanCalc dustmanCalcTest = DustmanCalc(cost);
    expect(dustmanCalcTest.state is GameRunning, true);
  });

  test('state GameRunning if money is 49.99', () {
    TestCost cost = TestCost();
    DustmanCalc dustmanCalcTest = DustmanCalc(cost);
    dustmanCalcTest.sellPrice = 40.99;
    dustmanCalcTest.paymentAttempt();
    dustmanCalcTest.sellTrash();
    expect(dustmanCalcTest.money == 49.99, true);
    expect(dustmanCalcTest.state is GameRunning, true);
  });

  test('state GameRunning if money is 1.5', () {
    TestCost cost = TestCost();
    DustmanCalc dustmanCalcTest = DustmanCalc(cost);
    dustmanCalcTest.sellPrice = 0;

    dustmanCalcTest.increaseAmount();
    dustmanCalcTest.increaseAmount();
    dustmanCalcTest.paymentAttempt();

    dustmanCalcTest.increaseAmount();
    dustmanCalcTest.increaseAmount();
    dustmanCalcTest.paymentAttempt();
    
    dustmanCalcTest.paymentAttempt();

    dustmanCalcTest.increaseAmount();
    dustmanCalcTest.paymentAttempt();

    dustmanCalcTest.sellTrash();
    expect(dustmanCalcTest.money == 1.5, true);
    expect(dustmanCalcTest.state is GameRunning, true);
  });

  test('state GameRunning if money < 1.5 but trash > 0', () {
    TestCost cost = TestCost();
    DustmanCalc dustmanCalcTest = DustmanCalc(cost);
    dustmanCalcTest.sellPrice = 0;

    dustmanCalcTest.increaseAmount();
    dustmanCalcTest.increaseAmount();
    dustmanCalcTest.increaseAmount();
    dustmanCalcTest.increaseAmount();
    dustmanCalcTest.increaseAmount();
    dustmanCalcTest.increaseAmount();
    dustmanCalcTest.increaseAmount();
    dustmanCalcTest.increaseAmount();
    dustmanCalcTest.increaseAmount();
    dustmanCalcTest.paymentAttempt();

    expect(dustmanCalcTest.money < 1.5, true);
    expect(dustmanCalcTest.trash > 0, true);
    expect(dustmanCalcTest.state is GameRunning, true);
  });
  

  test('state player should win if money > 50', () {
    RandomCost cost = RandomCost();
    DustmanCalc dustmanCalcTest = DustmanCalc(cost);
    dustmanCalcTest.sellPrice = 50;
    dustmanCalcTest.paymentAttempt();
    dustmanCalcTest.sellTrash();

    expect(dustmanCalcTest.money > 50, true);    
    expect(dustmanCalcTest.state is GameWin, true);
  });

  test('state player should win if money == 50', () {
    TestCost cost = TestCost();
    DustmanCalc dustmanCalcTest = DustmanCalc(cost);
    dustmanCalcTest.sellPrice = 41;
    dustmanCalcTest.paymentAttempt();
    dustmanCalcTest.sellTrash();

    expect(dustmanCalcTest.money == 50, true);
    expect(dustmanCalcTest.state is GameWin, true);
  });

  test('state player should win if selling more trash', () {
    TestCost cost = TestCost();
    DustmanCalc dustmanCalcTest = DustmanCalc(cost);
    dustmanCalcTest.sellPrice = 15;

    dustmanCalcTest.increaseAmount();
    dustmanCalcTest.increaseAmount();
    
    dustmanCalcTest.paymentAttempt();
    dustmanCalcTest.sellTrash();

    expect(dustmanCalcTest.money > 50, true);
    expect(dustmanCalcTest.state is GameWin, true);
  });

  test('state GameOver if money < 1.5 and trash == 0', () {
    TestCost cost = TestCost();
    DustmanCalc dustmanCalcTest = DustmanCalc(cost);
    dustmanCalcTest.sellPrice = 0;

    dustmanCalcTest.increaseAmount();
    dustmanCalcTest.increaseAmount();
    dustmanCalcTest.increaseAmount();
    dustmanCalcTest.increaseAmount();
    dustmanCalcTest.increaseAmount();
    dustmanCalcTest.increaseAmount();
    dustmanCalcTest.increaseAmount();
    dustmanCalcTest.increaseAmount();
    dustmanCalcTest.increaseAmount();
    dustmanCalcTest.paymentAttempt();

    dustmanCalcTest.sellTrash();
    expect(dustmanCalcTest.money < 1.5, true);
    expect(dustmanCalcTest.state is GameOver, true);
  });
 
}
