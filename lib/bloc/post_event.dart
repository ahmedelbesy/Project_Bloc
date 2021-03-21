part of 'post_bloc.dart';

@immutable
abstract class PostEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class DoFetchEvent extends PostEvent {}
