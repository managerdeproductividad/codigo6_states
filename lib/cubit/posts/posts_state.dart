

abstract class PostState{}

  class PostInitState extends PostState{}

  class PostLoadingState extends PostState{}

  class PostErrorState extends PostState{}

  class PostSuccedState extends PostState{
    List posts;
    PostSuccedState({required this.posts});
  }