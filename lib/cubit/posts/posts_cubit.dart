import 'package:bloc/bloc.dart';
import 'package:codigo6_states/cubit/posts/posts_state.dart';
import 'package:codigo6_states/services/remote/api_service.dart';


class PostCubit extends Cubit<PostState>{
  PostCubit() : super(PostInitState());

  ApiService apiService = ApiService();

  Future<void> getPostData() async{
    emit(PostLoadingState());
    List posts = await apiService.getPosts();
    emit(PostSuccedState(posts: posts));

  }

}