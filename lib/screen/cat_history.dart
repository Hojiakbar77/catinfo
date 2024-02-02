import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
class CatHistory extends StatefulWidget {
  const CatHistory({Key? key}) : super(key: key);

  @override
  State<CatHistory> createState() => _CatHistoryState();
}

class _CatHistoryState extends State<CatHistory> {
  @override
  var box = Hive.box('catsTime');
  var box1 = Hive.box('catsText');
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Fact History"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: box.values.length,
            itemBuilder: (context,index)=>Column(
              children: [
                Card(
                  child: ListTile(
                    title: Text(box.values.toList()[index]),
                    subtitle: Text(
                      box1.values.toList()[index]

                    ),



                  ),
                )


              ],
            )),
      )
    );
  }
}
