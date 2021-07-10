import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final _controller = ScrollController();
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
           _controller.animateTo(
             -20.0,
             duration: Duration(seconds: 1),
             curve: Curves.linear,
           );
          },
         child: Text("ListView Demo")
          ),
      ),
      body: false ?
      Center(child: Text("Hooray, no spam here !!")) :
      Scrollbar(
        child: ListView.builder(
         // physics: BouncingScrollPhysics(), // lik ios style
          physics: ClampingScrollPhysics(), // like android style
          controller: _controller,
          itemCount: 2000,
          padding: const EdgeInsets.only(
            bottom: 100,
          ),
          itemExtent: 60,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.person),
              title: Text("Name ${index + 1}"),
              subtitle: Text("Subtitle"),
              trailing: IconButton(
                icon: Icon(Icons.delete_outline),
                onPressed: () {},
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(_controller.offset);
          _controller.jumpTo(_controller.offset + 200.00);
        },
        tooltip: 'Increment',
        child: Icon(Icons.arrow_downward),
      ),
    );
  }
}
