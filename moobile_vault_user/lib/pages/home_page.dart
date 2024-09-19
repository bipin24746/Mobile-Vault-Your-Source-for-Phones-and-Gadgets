import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:moobile_vault_user/pages/widgets/drop_down_btn.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Mobile Vault",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                    padding: EdgeInsets.all(6),
                    child: Chip(
                      label: Text("Category"),
                    ));
              },
            ),
          ),
          DropDownBtn()
        ],
      ),
    );
  }
}
