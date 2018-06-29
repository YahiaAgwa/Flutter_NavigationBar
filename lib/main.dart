import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo', 
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: Material(
              child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.purple,
          onTap: (i){
            setState(() {
            _currentIndex = i;
            });
            debugPrint("Hello");
          },
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("Home")),
            BottomNavigationBarItem(icon: Icon(Icons.category),title: Text("Categories")),
            BottomNavigationBarItem(icon: Icon(Icons.person),title: Text("Profile")),
            BottomNavigationBarItem(icon: Icon(Icons.settings),title: Text("Settings")),
          ],
        ),
      ),
      drawer: new Drawer(
        child: new ListView(
          padding: EdgeInsets.all(0.0),
          children: <Widget>[
            DrawerHeader(
              decoration: new BoxDecoration(
                color: Colors.purple
              ),
              child: new Column(
                children:<Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 50.0,
                  ),
                  Padding(padding: EdgeInsets.all(7.0),),
                  new Text("Yahia Agwa",style: new TextStyle(color: Colors.white))
                ],
              ),
            ),
            new ListTile(
              leading: new Icon(Icons.home),
              title: new Text("Home"),
              onTap: (){
                debugPrint("Home");
              },
            ),new ListTile(
              leading: new Icon(Icons.category),
              title: new Text("Categories"),
              onTap: (){
                debugPrint("Categories");
              },
            ),new ListTile(
              leading: new Icon(Icons.person),
              title: new Text("Profile"), 
              onTap: (){
                debugPrint("Profile");
              },
            ),new ListTile(
              leading: new Icon(Icons.settings),
              title: new Text("Settings"),
              onTap: (){
                debugPrint("Settings");
              },
            ),new ListTile(
              leading: new Icon(Icons.exit_to_app),
              title: new Text("Sign out"),
              onTap: (){
                debugPrint("Sign out");
              },
            )
          ],
        ),
      ),
      appBar: new AppBar(
        title: new Text("HomePage"),
        backgroundColor: Colors.purple,
        centerTitle: true,
        //leading: Icon(Icons.menu),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: Theme(
            data: Theme.of(context).copyWith(accentColor: Colors.pink),
            child: new Container(
              height: 48.0,
              alignment: Alignment.center,
              child: new Text("yahia agwa",style: TextStyle(color:Colors.white),),
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(icon:Icon(Icons.search),onPressed: (){},),
          IconButton(icon:Icon(Icons.settings),onPressed: (){},),
          PopupMenuButton(onSelected: (i){
            debugPrint(i);
          },
          itemBuilder: (BuildContext content){
            return ['help','contact us'].map((item){
              return PopupMenuItem(
                value: item,
                child: Row(
                  children: <Widget>[
                    Icon((item=='help')?Icons.help:Icons.mail),
                    Text(" "+item)
                  ],
                ),
              );
            }).toList();
          },
          )
        ],
      ),
      body: new Center(
        child: new Text("Hello")
      )
      );
  }
}
