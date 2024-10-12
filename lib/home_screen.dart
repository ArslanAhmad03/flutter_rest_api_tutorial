import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic>? dataMap;
  List<dynamic>? doneListData = [];

  Future hitApi() async {
    http.Response response;

    response = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));

    if (response.statusCode == 200) {
      setState(() {
        dataMap = jsonDecode(response.body);
        doneListData = dataMap!['data'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    hitApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('GET API'),
      ),
      body: Center(
        child: doneListData == null
            ? CupertinoActivityIndicator()
            : ListView.builder(
                itemCount: doneListData!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: SizedBox(
                        height: 50,
                        width: 50,
                        child: ClipOval(
                          child: Image.network(doneListData![index]['avatar'],
                              fit: BoxFit.cover),
                        )),
                    title: Text(
                        "${doneListData![index]['first_name']}  ${doneListData![index]['last_name']}"),
                    subtitle: Text(doneListData![index]['email']),
                  );
                }),
      ),
    );
  }
}
