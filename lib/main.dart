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
    ListItem(id: "T1", naslov: "Algoritmi i podatocni strukturi"),
    ListItem(id: "T2", naslov: "Verojatnost i statistika"),
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
          ? Text("No elements")
          : ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 10,
            ),
            child: ListTile(
              title: Text(_userItems[index].naslov, style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text(DateTime.now().toString().substring(0, 16), style: TextStyle(color: Colors.grey),),
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

        title: Text("Datamu za kolokviumi i ispiti"),
        
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: _createAppBar()
      ),
      body: _createBody(),
    );
  }

}

