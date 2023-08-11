import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_ticket_app/videos_homepage/videos_model.dart';

abstract class VideoState {}

class VideoStateInit extends VideoState {}

class VideoStateLoading extends VideoState {}

class VideoStateLoaded extends VideoState {
  List<VideosModel> datas;
  VideoStateLoaded({required this.datas});
}

class VideoStateLoadError extends VideoState {}

class VideoBloc extends Cubit<VideoState> {
  VideoBloc(super.initialState);
  List<VideosModel> listVideosModel = [];

  void getListVideos() async {
    emit(VideoStateInit());
    emit(VideoStateLoading());

    try {
      FirebaseFirestore fireStore = FirebaseFirestore.instance;

      final storageVideos = fireStore.collection("videos_homepage");
      QuerySnapshot<Map<String, dynamic>> documents = await storageVideos.get();
      documents.docs.forEach((element) {
        final json = element.data();
        listVideosModel.add(VideosModel.fromJson(json));
      });
      emit(VideoStateLoaded(datas: listVideosModel));
    } catch (e) {
      emit(VideoStateLoadError());
    }
  }
}
