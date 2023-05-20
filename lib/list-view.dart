import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:jobtest/model/person-model.dart';

class ListPersonWidget extends StatefulWidget {
  const ListPersonWidget({super.key});

  @override
  State<ListPersonWidget> createState() => _ListPersonWidgetState();
}

class _ListPersonWidgetState extends State<ListPersonWidget> {
  List<Person> _persons = [];
  bool _isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    loadData();
    super.initState();
  }

  Future<void> loadData() async {
    var response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=1'));

    var body = jsonDecode(response.body);

    for (int i = 0; i < body['data'].length; i++) {
      var data = body['data'][i];
      _persons.add(Person.fromJson(data));
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List Person'),
        ),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : (_persons.isEmpty)
                ? Center(
                    child: Text("No data found"),
                  )
                : ListView.builder(
                    itemCount: _persons.length,
                    itemBuilder: (context, index) {
                      var data = _persons[index];
                      return ListTile(
                        title: Text(data.f_name + " " + data.l_name),
                        subtitle: Text(_persons[index].email),
                        leading: CircleAvatar(
                          child: Image.network(data.image_url),
                        ),
                      );
                    }));
  }
}
