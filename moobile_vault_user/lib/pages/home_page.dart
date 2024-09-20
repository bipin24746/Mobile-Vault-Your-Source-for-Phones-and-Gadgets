import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

import '../widgets/drop_down.dart';
import '../widgets/multi_select_drop_down.dart';
import '../widgets/product_card.dart';
import '../product_description_page.dart';

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
          Row(
            children: [
              Expanded(
                child: DropDownBtn(
                  items: ['Rs: Low to High', 'Rs: High to Low'],
                  selectedItemText: 'Sort',
                  onSelected: (selected) {},
                ),
              ),
              Expanded(
                child: MultiSelectDropDown(
                    items: ['item1', 'item2', 'item3'],
                    onSelectionChanged: (selectedItems) {}),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8),
                itemBuilder: (context, index) {
                  return ProductCard(
                      name: 'Samsung Galaxy J7',
                      imageUrl:
                          'https://th.bing.com/th/id/OIP.096zwC7tmk5AL7O2v90rXwHaIq?w=130&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
                      price: 200,
                      offerTag: '20% off',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ProductDescriptionPage()),
                        );
                      });
                }),
          )
        ],
      ),
    );
  }
}
