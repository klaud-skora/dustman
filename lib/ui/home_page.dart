import 'package:dustman/dustman_bloc.dart';
import 'package:dustman/logic/dustman_calc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './dustman_wallet.dart';

class HomePage extends StatelessWidget {
  final String title;
  HomePage({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text( title )),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 10.0),
              Text(
                'Reach 50\$ account value \n and become a trash-magnate!',
                style: TextStyle(fontSize: 19.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              Container(
                child: Image.asset(
                  'assets/images/trash.jpg',
                  width: 200,
                  height: 170,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 30.0),
              DustmanWallet( money: 10 ),
              Text( 'Number of your trash: 0' ),
              SizedBox(height: 10.0),
              // RaisedButton(
              //   color: Colors.deepOrange,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(18.0),
              //     side: BorderSide(color: Colors.deepOrange.withBlue(3)),
              //   ),
              //   onPressed: () {},
              //   child: Text( 'Sell them !', style: TextStyle(color: Colors.white), ),
              // ),
              // Text(
              //   '(You will get 2\$ for each)',
              //   style: TextStyle(fontSize: 11),
              // ),
              SizedBox(height: 40.0),
              Text(
                'Choose amount of new items'
              ),
              Text('(cost is random: 1,5\$ - 2,5\$)'),
              SizedBox( height: 20.0 ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 30.0,
                    width: 30.0,
                    child: FloatingActionButton(
                      child: Icon(Icons.remove),
                      onPressed: () => BlocProvider.of<DustmanBloc>(context).add(DustmanEvent.DecreaseAmountEvent),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Container(
                    height: 50.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange.withOpacity(.1),
                      border: Border.all(
                        color: Colors.deepOrange,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    child: BlocBuilder<DustmanBloc, DustmanState>(
                      builder: (context, state) {
                        return  Center( child: Text('${state.props[1]}'));
                      },
                    ),
                  ),
                  SizedBox(width: 10.0),
                  SizedBox(
                    height: 30.0,
                    width: 30.0,
                    child: FloatingActionButton(
                      child: Icon(Icons.add),
                      onPressed: () => BlocProvider.of<DustmanBloc>(context).add(DustmanEvent.IncreaseAmountEvent),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              RaisedButton(
                color: Colors.deepOrange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.deepOrange.withBlue(3)),
                ),
                onPressed: () {
                  DustmanCalc calc = DustmanCalc();
                  calc.getCost();
                },
                child: Text( 'Get trash', style: TextStyle(color: Colors.white), ),
              ),
              Text(
                '(transation cost: 0,1\$)',
                style: TextStyle(fontSize: 11),
              ),
            ],
          ),
        ),
      ),
    );
  }
}