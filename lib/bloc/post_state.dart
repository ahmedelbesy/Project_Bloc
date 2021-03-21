part of 'post_bloc.dart';


abstract class PostState extends Equatable{
  @override

  List<Object> get props => [];
}


class PostInitial extends PostState {
}

class LoadingState extends PostState {

}


class FetchSuccess extends PostState {
  List<Post_data> posts;
  FetchSuccess({this.posts});

}

class ErrorState extends PostState{
  String message;
  ErrorState({this.message});

}


