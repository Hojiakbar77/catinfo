part of 'cat_factory_bloc.dart';

@immutable
abstract class CatFactoryState {}

class CatFactoryInitial extends CatFactoryState {}
class CatFactoryLoadingState extends CatFactoryState {}
class CatFactorySuccess extends CatFactoryState {
  final CatFact cats;

  CatFactorySuccess({required this.cats});
}
class CatFactoryFail extends CatFactoryState{
  final String error ;
  CatFactoryFail({required this.error});
}