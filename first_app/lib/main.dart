import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.amber,
          accentColor: Colors.blue[200],
          textTheme: TextTheme(
            bodyText2: TextStyle(color: Colors.purple),
          ),
        ),
        initialRoute: '/5',
        routes: <String, WidgetBuilder>{
          '/1': (context) => FirstPage(),
          '/2': (context) => SecondPage(),
          '/3': (context) => ThirdPage(),
          '/4': (context) => FourthPage(),
          '/5': (context) => FifthPage(),
          '/6': (context) => SixthPage(),
        });
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

  Image cat = Image.asset(
    'assets/popcat2.png',
    width: 120,
  );

  Image cat1 = Image.asset(
    'assets/popcat1.png',
    width: 120,
  );

  Image cat2 = Image.asset(
    'assets/popcat2.png',
    width: 120,
  );

  void _incrementCounter() {
    setState(() {
      cat = cat2;
      _counter++;
    });
  }

  void _decreaseCounter() {
    setState(() {
      cat = cat1;
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 150.0,
              margin: EdgeInsets.only(left: 100, right: 100.0, bottom: 20.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.25),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: cat,
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  onPressed: _decreaseCounter,
                  child: Text('Decrease'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: _incrementCounter,
                  child: Text('Increase'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.fingerprint),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  final String buttonText;
  SubmitButton(this.buttonText);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(this.buttonText),
      onPressed: () {
        print('Pressing');
      },
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward)),
          IconButton(onPressed: () {}, icon: Icon(Icons.agriculture)),
          IconButton(onPressed: () {}, icon: Icon(Icons.bus_alert)),
          IconButton(onPressed: () {}, icon: Icon(Icons.medication)),
          IconButton(onPressed: () {}, icon: Icon(Icons.food_bank)),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.build_sharp),
        onPressed: () {},
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Here is the text formatted by theme data',
            ),
            Table(
              children: [
                TableRow(children: [
                  Container(
                    child: Center(child: Text('No.')),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  Container(
                    child: Center(child: Text('Name.')),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Text('1'),
                  Text('Kritapat'),
                ]),
                TableRow(children: [
                  Text('2'),
                  Text('Touch'),
                ])
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Third Page'),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.cloud)),
                Tab(
                  icon: Icon(Icons.beach_access_outlined),
                ),
                Tab(
                  icon: Icon(Icons.brightness_1_outlined),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(
                child: Text('Cloud'),
              ),
              Center(
                child: Text('Umbrella'),
              ),
              Center(
                child: Text('Sunny'),
              ),
            ],
          )),
    );
  }
}

class FourthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>[
      'A',
      'B',
      'C',
      'D',
      'E',
      'F',
      'G',
      'H',
      'I',
      'J',
      'K',
      'L',
      'M',
      'N',
      'O',
      'P'
    ];
    final List<int> colorCodes = <int>[600, 500, 100];
    return Scaffold(
      appBar: AppBar(
        title: Text('Listview Example'),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(8.0),
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            color: Colors.amber[colorCodes[index % 3]],
            child: Center(child: Text('Entry ${entries[index]}')),
          );
        },
        separatorBuilder: (context, index) => Divider(),
      ),
    );
  }
}

class FifthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid View'),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(6, (index) {
          return InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/${index + 1}');
                //ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //  content: Text('Tap at $index'),
                //));
              },
              child: Container(
                  margin: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Text(
                      'Page ${index + 1}',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  )));
        }),
      ),
    );
  }
}

class SixthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fisrt Form'),
      ),
      body: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your firstname',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter firstname.';
              }

              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your lastname',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter lastname.';
              }

              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your age',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter age.';
              }
              if (int.parse(value) < 1) {
                return 'Please enter valid age.';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Hooray'),
                ));
              }
            },
            child: Text('Validate'),
          ),
        ],
      ),
    );
  }
}
