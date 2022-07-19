// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, library_private_types_in_public_api, camel_case_types, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => CounterBloc(Count_State(0)),
        child: Counter(),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  _counter_page createState() {
    return _counter_page();
  }
}

class _counter_page extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, Count_State>(
      builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text("Counter"),
          ),
          body: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.read<CounterBloc>().state.count.toString(),
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: 70,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<CounterBloc>().increase();
                          },
                          child: Icon(Icons.add),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 40),
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<CounterBloc>().reset();
                          },
                          child: Text(
                            "Reset",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 40),
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<CounterBloc>().decrease();
                          },
                          child: Text(
                            "-",
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}

class Count_State {
  int count;
  Count_State(this.count);

  setCounter(count) => this.count = count;
  getCounter() => count;
}

class CounterBloc extends Cubit<Count_State> {
  CounterBloc(super.initialState);

  //stream => emite

  void increase(){
    emit(Count_State(++state.count));
  }

  void reset(){
    emit(Count_State(state.count = 0));
  }

  void decrease(){
    if(state.count>0){
      emit(Count_State(--state.count));
    } 
  }
}
