

import 'package:catinfo/model/cat_factory_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../bloc/cat_factory_bloc.dart';
import '../net/cat_factory_server.dart';
import 'cat_history.dart';



class CatVew extends StatefulWidget {
  const CatVew({Key? key}) : super(key: key);


  @override
  State<CatVew> createState() => CatVewState();
}

class CatVewState extends State<CatVew> {
  late Future<CatFact>futureCat;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureCat = getRandomCatFact();
  }
  @override
  Widget build(BuildContext context) {
    var catsTime = Hive.box('catsTime');
    var catsText = Hive.box('catsText');
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const CatHistory(),
              ),
            );
          }, icon: Icon(Icons.history))
        ],
        title: const Center(child: Text('Cat image')),),
      body: BlocBuilder<CatFactoryBloc,CatFactoryState>(
        builder: (context,state){

          if( state is CatFactoryInitial){
            return const FlutterLogo();

          }

          else if(state is CatFactoryLoadingState){
            return const Center(child: CircularProgressIndicator());
          }
          else if (state is CatFactoryFail) {
            return const Center(child: Text("Xatolik"));
          }

          else if(state is  CatFactorySuccess){
            return 
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [

                    SizedBox(
                      height: 200,
                      width: 300,
                      child: Image.network(
                        "https://cataas.com/cat?unique=${DateTime.now().millisecondsSinceEpoch}",
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Text(state.cats.createdAt),
                    const SizedBox(height: 10,),
                    Text(state.cats.text),

                    TextButton(onPressed: (){
                      context.read<CatFactoryBloc>().add(NextFactoryEvent());
                      catsTime.add(state.cats.createdAt);

                    }, child: const Text("Next"))



                  ],
            ),
                ),
              );

          }
          throw Exception("$state is not fount");
        },
      ),
    );
  }

}