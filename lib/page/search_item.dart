import 'package:flutter/material.dart';

class SearchItem extends StatefulWidget {
  static String? routeName = "/search_item";

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  List<String> bahasaPemrograman = ["Java", "Kotlin", "Flutter", "Google"];

  List<String> listDicari = [];
  List<String> animatedList = [];
  TextEditingController textEditingController = TextEditingController();
  Widget itemCard(String nama) {
    return Card(
      key: ValueKey(nama),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          nama,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    listDicari = bahasaPemrograman;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () => {
                listKey.currentState
                    ?.insertItem(0, duration: Duration(milliseconds: 500)),
                listDicari.add(textEditingController.text)
              }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: textEditingController,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    listDicari = bahasaPemrograman
                        .where((element) => element.contains(value))
                        .toList();
                  } else if (value.isEmpty) {
                    listDicari = bahasaPemrograman;
                  }
                  setState(() {
                    listDicari;
                  });
                },
              ),
            ),
            ListView.builder(
              key: listKey,
              shrinkWrap: true,
              itemCount: listDicari.length,
              itemBuilder: (context, index) {
                return itemCard(listDicari[index]);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        listDicari = ["Soto", "Ayam", "Kemren", "Amjad"];
                      });
                    },
                    icon: Icon(Icons.arrow_left)),
                IconButton(
                    onPressed: () {
                      setState(() {
                        listDicari = ["Indonesia", "Alaska", "Florida"];
                      });
                    },
                    icon: Icon(Icons.arrow_left))
              ],
            )
          ],
        ),
      ),
    );
  }
}
