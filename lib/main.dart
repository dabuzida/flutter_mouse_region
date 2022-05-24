import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MouseRegion',
      home: BBB(),
      // home: AAA(),
    );
  }
}

class AAA extends StatelessWidget {
  AAA({Key? key}) : super(key: key);

  void _hover() {
    print('d');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MouseRegion'),
        elevation: 0,
        foregroundColor: Colors.cyanAccent,
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      backgroundColor: Colors.greenAccent[100],
      body: Center(
        child: Container(
          width: 700,
          height: 700,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              MouseRegion(
                cursor: SystemMouseCursors.click,
                // onHover: () => _hover,
                child: GestureDetector(
                  onTap: () => print('clicked'),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 1),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '메뉴 소개',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BBB extends StatefulWidget {
  const BBB({Key? key}) : super(key: key);

  @override
  State<BBB> createState() => _BBBState();
}

class _BBBState extends State<BBB> {
// 클릭시 _id값이 3이되면 active색으로 변경
// _exit 시, _id가 3이아니면 적용하고 3이면 바뀐색 그대로 두게 변경없이
  late Color _ttColor;
  late Color _bgColor;
  late Color _bdColor;
  int _id = 1;
  @override
  void initState() {
    super.initState();
    _bgColor = _menuTap['normal']!['bgColor']!;
    _ttColor = _menuTap['normal']!['textColor']!;
    _bdColor = _menuTap['normal']!['borderColor']!;
  }

  void _enter(PointerEvent details) {
    setState(() {
      _bgColor = _menuTap['hover']!['bgColor']!;
      _ttColor = _menuTap['hover']!['textColor']!;
      _bdColor = _menuTap['hover']!['borderColor']!;
    });
  }

  void _exit(PointerEvent details) {
    setState(() {
      if (_id == 1) {
        _bgColor = _menuTap['normal']!['bgColor']!;
        _ttColor = _menuTap['normal']!['textColor']!;
        _bdColor = _menuTap['normal']!['borderColor']!;
      }
    });
  }

  void _clicked() {
    setState(() {
      _bgColor = _menuTap['active']!['bgColor']!;
      _ttColor = _menuTap['active']!['textColor']!;
      _bdColor = _menuTap['active']!['borderColor']!;
    });
  }

  void _hover(PointerEvent details) {
    setState(() {
      _bgColor = _menuTap['hover']!['bgColor']!;
      _ttColor = _menuTap['hover']!['textColor']!;
      _bdColor = _menuTap['hover']!['borderColor']!;
    });
  }

  final _menuTap = {
    'normal': {
      'textColor': Colors.amber,
      'bgColor': Colors.blue,
      'borderColor': Colors.purple,
    },
    'hover': {
      'textColor': Colors.teal,
      'bgColor': Colors.red,
      'borderColor': Colors.yellow,
    },
    'active': {
      'textColor': Colors.green,
      'bgColor': Colors.black,
      'borderColor': Colors.indigo,
    },
    'disabled': {
      'textColor': Colors.pink,
      'bgColor': Colors.grey,
      'borderColor': Colors.purpleAccent,
    },
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MouseRegion'),
        elevation: 0,
        foregroundColor: Colors.cyanAccent,
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      backgroundColor: Colors.greenAccent[100],
      body: Center(
        child: Container(
          width: 700,
          height: 700,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MouseRegion(
                cursor: SystemMouseCursors.click,
                onEnter: _enter,
                // onHover: _hover,
                onExit: _exit,
                child: GestureDetector(
                  onTap: _clicked,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: _bgColor,
                      // _bgColor
                      border: Border.all(color: _bdColor, width: 11),
                      // _borderColor
                      borderRadius: const BorderRadius.all(Radius.circular(100.0)),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '메뉴 소개',
                      style: TextStyle(
                        color: _ttColor,
                        fontSize: 50,
                      ),
                      // _textColor
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          _id = 1;
                        });
                      },
                      child: Text('1')),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          _id = 2;
                        });
                      },
                      child: Text('2')),
                ],
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 1),
                ),
                alignment: Alignment.center,
                child: Text(
                  '현재 id: ${_id.toString()}',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
