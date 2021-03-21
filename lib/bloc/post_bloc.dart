import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_bloc/model/model_post_data.dart';
import 'package:test_bloc/repository/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostRepository repo;
  // ignore: non_constant_identifier_names
  PostBloc(PostState PostInitial, this.repo) : super(PostInitial);

  @override
  // ignore: missing_return
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is DoFetchEvent) {
      yield LoadingState();
      try {
        var posts = await repo.fetchPosts();
        yield FetchSuccess(posts: posts);
      } catch (e) {
        yield ErrorState(message: e.toString());
      }
    }
  }
}
