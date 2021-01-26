import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // MaterialApp 타입의 데이터에서 앱이 시작됨
    return MaterialApp(
      title: 'Flutter Demo',
      // 앱 테마 적용
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // flutter 앱의 홈페이지를 MyHomePage로 만듦
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // 이 부분이 클래스 생성자라 함
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title; // 이 문법은 this.title이 title이란 이름의 상수로 전달되게 함

  @override
  _MyHomePageState createState() =>
      _MyHomePageState(); // stateful한 widget을 만들기 위해 state를 생성함
}

// 앞서 생성한 마이홈페이지 클래스의 스테이트를 나타냄
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    if (_counter < 30) {
      setState(() {
        _counter += 3;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // 모든 위젯은 build 메서드와 context를 가지고 있다. buildContext는 build() 메서드에 의해 리턴된 위젯의 부모다.
    // build() 메서드는 setState가 호출될 때마다 UI를 다시 그려주는 역할. react에서 render()와 비슷한가 싶음

    return Scaffold(
      // 머티리얼 디자인 기본 뼈대
      appBar: AppBar(
        // 상단 앱바
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // 이런 식으로 위젯 안에 위젯이 들어갈 수 있다.
        // flutter에서는 이러한 레이아웃 위젯도 사용할 수 있다.
        // 자주 쓰이는 위젯의 자세한 건 documentation과 책 보면서 확인하자!
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center, // 스타일같은 속성값
          children: <Widget>[
            Text(
              'Value increases when you press the button',
            ),
            Text(
              '$_counter', // _counter 변수에서 정의한 문자열을 포매팅
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter, // _incrementCounter 메서드를 실행
        tooltip: 'Increment', // 마우스오버시 뜨는 툴 팁
        child: Icon(Icons.add), // 아이콘을 child로 할당
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
