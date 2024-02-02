import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class CatHistory extends StatefulWidget {
  const CatHistory({Key? key}) : super(key: key);

  @override
  _CatHistoryState createState() => _CatHistoryState();
}

class _CatHistoryState extends State<CatHistory> {
  late Box catsTime;

  @override
  void initState() {
    super.initState();
    // Open the box
    catsTime = Hive.box('catsTime');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Fact History"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ValueListenableBuilder(
            valueListenable: catsTime.listenable(),
            builder: (context, Box box, _) {
              var keys = box.keys.toList();
              return ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    final key = keys[index];
                    final value = box.get(key);

                    return Card(
                      child: ListTile(
                        title: Text(value.toString()),
                        trailing: IconButton(
                          onPressed: () {
                            box.delete(key);
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ),
                    );
                  });
            },
          ),
        ));
  }
}
