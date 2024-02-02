import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../model/cat_factory_model.dart';
import '../net/cat_factory_server.dart';

part 'cat_factory_event.dart';
part 'cat_factory_state.dart';

class CatFactoryBloc extends Bloc<CatFactoryEvent, CatFactoryState> {
  CatFactoryBloc() : super(CatFactoryInitial()) {
    on<CatFactoryEvent>((event, emit) async {
      if(event is FactoryLoadEvent || event is NextFactoryEvent ){
        try{

          emit(CatFactoryLoadingState());


          final cats= await getRandomCatFact();

          emit( CatFactorySuccess(cats: cats));
        }
        catch(e){
          emit( CatFactoryFail(error: e.toString()));
        }
      }
    });
  }
}
