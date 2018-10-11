import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'widget_drawercustom.dart';

class HelloWorld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
          drawer: new DrawercustomWidget(),
          appBar: new AppBar(
            title: new Text("Hello World"),
          ),
          body: MenuutamaWidget(),
          backgroundColor: Colors.grey[400],
      );
    }
}

class MenuutamaWidget extends StatefulWidget {
  @override
  MenuutamaWidgetState createState()=> new MenuutamaWidgetState();
}

class MenuutamaWidgetState extends State<MenuutamaWidget> {

  int _visitingCounter = 0;

  @override
  void initState() {
    super.initState();
    loadVisitingcounter();
  }

  void loadVisitingcounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _visitingCounter = (prefs.getInt('visitingCounter') ?? 0);
    });
  }

  void pagelistVisited() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _visitingCounter = _visitingCounter + 1;
      prefs.setInt('visitingCounter', _visitingCounter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[500]),
            color: Colors.white,
          ),
          height: 110.0,
          margin: EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right:2.0),
                child: Image.asset('images/sample1.jpg'),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("List User", style: TextStyle(
                        fontSize:18.0,
                        color: Colors.grey[700],
                      )),
                      Text("Menampilkan data user.", style: TextStyle(
                        color: Colors.grey[500],
                      )),
                      Spacer(),
                      Row(children: <Widget>[
                        Spacer(),
                        Icon(Icons.remove_red_eye),
                        Text(_visitingCounter.toString()),
                        Spacer(),
                        Icon(Icons.share),
                        Spacer(),
                        RaisedButton(
                          child: Text("Detail"),
                          onPressed: () {
                            Navigator.pushNamed(context, '/pagelist');
                            pagelistVisited();
                          },
                        ),
                        Spacer(),
                      ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[500]),
            color: Colors.white,
          ),
          height: 110.0,
          margin: EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right:2.0),
                child: Image.asset('images/sample2.jpg'),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("List Admin", style: TextStyle(
                        fontSize:18.0,
                        color: Colors.grey[700],
                      )),
                      Text("Menampilkan administrator.", style: TextStyle(
                        color: Colors.grey[500],
                      )),
                      Spacer(),
                      Row(children: <Widget>[
                        Spacer(),
                        Icon(Icons.remove_red_eye),
                        Text("12"),
                        Spacer(),
                        Icon(Icons.share),
                        Spacer(),
                        RaisedButton(
                          child: Text("Detail"),
                          onPressed: () {},
                        ),
                        Spacer(),
                      ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
