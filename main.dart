import 'package:flutter/material.dart';

import 'app_screenns/Home.dart';

void main() {
  runApp(MaterialApp(
    title: 'Exploring UI Widgets',
    debugShowCheckedModeBanner: false,
    color: Colors.yellow,
    home: Scaffold(
      //appBar: AppBar(title: Text("Explore list view"),),
      appBar: AppBar(
        title: Text("Long list "),
      ),
      body: getListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("FAB clicked");
        },
        child: Icon(Icons.add),
        tooltip: "Add one more item",
      ),
    ),

    //body: Home()    //for running home.dart
    //body: getlistview(), //for running getlistview(basic functions of list)
  ));
}

void showSnackbar(BuildContext context, String item) {
  var snackbar = SnackBar(
    content: Text("${item} is tapped"),
    action: SnackBarAction(
        label: "undo",
        onPressed:()
        {
          debugPrint("performing dummy undo operation");
        }
    )
  );
  Scaffold.of(context).showSnackBar(snackbar);
}

//Widget getlistview()
//  {
//    var listview= ListView(
//      children: <Widget>[
//        ListTile(
//          leading: Icon(Icons.landscape),
//          title: Text("Landscape"),
//          subtitle: Text("check out subtitles"),
//          trailing: Icon(Icons.pageview),
//          onTap: ()=>  debugPrint("Landscape tapped")
//
//        ),
//        ListTile(
//          leading: Icon(Icons.laptop_windows),
//          title:Text("windows")
//        ),
//        ListTile(
//            leading: Icon(Icons.phone),
//            title:Text("phone")
//        ),
//        ListTile(
//            leading: Icon(Icons.access_alarm),
//            title:Text("access_alarm")
//        ),
//        Text("Enjoy learning flutter"),
//        Container(
//          color: Colors.red,
//          height: 50.0,
//          //width: 500.0,
//          //child: Home(),
//        )
//      ],
//    );
//    return listview;
//  }
List<String> getlistelements() {
  var items = List<String>.generate(99, (counter) => "Item $counter");
  return items;
}

Widget getListView() {
  var listitems = getlistelements();
  var listview = ListView.builder(itemBuilder: (context, index) {
    return ListTile(
      leading: Icon(Icons.accessibility),
      title: Text(listitems[index]),
      onTap: () {
        //debugPrint('${listitems[index]} was tapped');
        showSnackbar(context, listitems[index]);
      },
    );
  });
  return listview;
}
