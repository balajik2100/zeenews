import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zeenews/utils/ZeeNewsStyles.dart';

class CardsListView extends StatefulWidget {
 CardsListView(this.title, this.appBarVisible, this.selectedUrl) : super();
  final String title;
  final String selectedUrl;
  final bool appBarVisible;

  _CardsListView createState() => _CardsListView();
}

class _CardsListView extends State<CardsListView> {
  String uri = 'https://jsonplaceholder.typicode.com/users';

  Future<List<Users>> _fetchUsers() async {
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      final items = json.decode(response.body).cast<Map<String, dynamic>>();
      List<Users> listOfUsers = items.map<Users>((json) {
        return Users.fromJson(json);
      }).toList();

      return listOfUsers;
    } else {
      throw Exception('Failed to load internet');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBarVisible
          ? AppBar(
              title: Text(widget.title),
            )
          : null,
      body: FutureBuilder<List<Users>>(
        future: _fetchUsers(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, pos) {
              return new GestureDetector(
                //onTap: ()=>Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("Item Clicked: "+snapshot.data[pos].name))),
                  onTap: () {

                  },
                  child: Container(
                      height: 200.0,
                      padding: new EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 4.0, bottom: 4.0),
                      child: Card(
                        elevation: 2.0,
                        child: new Container(
                          width: MediaQuery.of(context).size.width,
                          child: bannerWidgetColumn(snapshot.data[pos]),
                        ),
                      )));
            },
          );

        },
      ),
    );
  }

  bannerWidget(Users user) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 5.0, top: 5.0),
          child: CircleAvatar(
            backgroundColor: Colors.red,
            child: Text(user.name[0],
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                )),
          ),
        ),
        bannerWidgetRow(user)
      ],
    );
  }

  bannerWidgetColumn(Users user) {
    return Padding(
      padding: EdgeInsets.only(left: 1.0, top: 4.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
              Configuration.SAMPLE_IMAGE_URL,
              height: 120.0,
              fit: BoxFit.fill),
          bannerWidget(user),
        ],
      ),
    );
  }

  bannerWidgetRow(Users user) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, top: 5.0),
        child: Column(
          children: <Widget>[
            Text(user.name),
            Text(user.email),
          ],
        ));
  }
}

class Users {
  int id;
  String name;
  String username;
  String email;

  Users({
    this.id,
    this.name,
    this.username,
    this.email,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      username: json['username'],
    );
  }
}
