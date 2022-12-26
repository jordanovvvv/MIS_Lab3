import 'package:flutter/material.dart';
import 'model/list_item.dart';
import 'widgets/nov_element.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laboratory Exercise 3 - 192015',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.red,
          textTheme: ThemeData.light().textTheme.copyWith(
              headline1: TextStyle(fontSize:26)
          )
      ),

      home:  MyHomePage(
        
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<ListItem> _userItems = [
    ListItem(id: "T1", naslov: "Algoritmi i podatocni strukturi", datum: "2022-12-25", vreme: "14:15"),
    ListItem(id: "T2", naslov: "Verojatnost i statistika", datum: "2022-12-27", vreme: "16:00"),
    ListItem(id: "T3", naslov: "Kalkulus 1", datum: "2022-12-27", vreme: "15:30")
  ];

  void _addItemFunction(BuildContext ct) {

    showModalBottomSheet(
        context: ct,
        builder: (_) {
          return GestureDetector(onTap: () {},
              child: NovElement(_addNewItemToList),
              behavior: HitTestBehavior.opaque);
        });
  }

  void _addNewItemToList(ListItem item) {
    setState(() {
      _userItems.add(item);
    });
  }

  void _deleteItem(String id) {
    setState(() {
      _userItems.removeWhere((elem) => elem.id == id);
    });
  }
  Widget _createBody() {
    return Center(
      child: _userItems.isEmpty
          ? Text("Nema elementi")
          : ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            child: ListTile(
              title: Text(_userItems[index].naslov),
              subtitle: Text(_userItems[index].datum + " " + _userItems[index].vreme),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => _deleteItem(_userItems[index].id),
              ),
            ),
          );
        },
        itemCount: _userItems.length,
      ),
    );
  }

  Widget _createAppBar() {
    return AppBar(
      // The title text which will be shown on the action bar

        title: Text("Datumi za kolokviumi i ispiti"),

        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _addItemFunction(context),
          )
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: _createAppBar()
      ),
      body: _createBody(),
    );
  }

}

