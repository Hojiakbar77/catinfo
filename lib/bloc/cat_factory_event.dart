part of 'cat_factory_bloc.dart';

@immutable
abstract class CatFactoryEvent {}
class FactoryLoadEvent extends CatFactoryEvent{}
class NextFactoryEvent extends CatFactoryEvent{}
