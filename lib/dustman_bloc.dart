import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import './logic/dustman_calc.dart';
import './logic/cost.dart';

enum DustmanEvent { GetTrashEvent, SellTrashEvent, IncreaseAmountEvent, DecreaseAmountEvent, NewGameEvent }

abstract class DustmanState extends Equatable {
  @override
  List<Object> get props => [];
}

class GameRunningState extends DustmanState {

  final double money;
  final int amount;
  final int trash;
  
  GameRunningState(this.money, this.amount, this.trash);

  @override
  List<Object> get props => [money, amount, trash];
}
class LoseState extends DustmanState {}
class WinState extends DustmanState {}

class DustmanBloc extends Bloc<DustmanEvent, DustmanState> {

  @override
  DustmanState get initialState => GameRunningState(dustmanCalc.money, dustmanCalc.amount, dustmanCalc.trash);

  static RandomCost cost = RandomCost();
  DustmanCalc dustmanCalc = DustmanCalc(cost);

  @override
  Stream<DustmanState> mapEventToState(DustmanEvent event) async* {
    switch(event) {
      case DustmanEvent.GetTrashEvent:
        dustmanCalc.paymentAttempt();
        if(dustmanCalc.state is GameOver) yield LoseState();
        else yield GameRunningState(dustmanCalc.money, dustmanCalc.amount, dustmanCalc.trash);
        break;
      case DustmanEvent.SellTrashEvent:
        dustmanCalc.sellTrash();
        if(dustmanCalc.state is GameWin) yield WinState();
        else if(dustmanCalc.state is GameOver) yield LoseState();
        else yield GameRunningState(dustmanCalc.money, dustmanCalc.amount, dustmanCalc.trash);
        break;
      case DustmanEvent.IncreaseAmountEvent:
        dustmanCalc.increaseAmount();
        yield GameRunningState(dustmanCalc.money, dustmanCalc.amount, dustmanCalc.trash);
        break;
      case DustmanEvent.DecreaseAmountEvent:
        dustmanCalc.decreaseAmount();
        yield GameRunningState(dustmanCalc.money, dustmanCalc.amount, dustmanCalc.trash);
        break;
      case DustmanEvent.NewGameEvent:
        dustmanCalc.reset();
        yield GameRunningState(dustmanCalc.money, dustmanCalc.amount, dustmanCalc.trash);
    }
  }
}