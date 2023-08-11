import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_ticket_app/homepage_banner_movie/banner_movie_model.dart';
import 'package:movie_ticket_app/promotion/promotion_bloc.dart';

enum BannerMovieStateEnum { init, loading, loaded, error }

abstract class BannerMovieState {}

class BannerMovieStateInit extends BannerMovieState {}

class BannerMovieStateLoading extends BannerMovieState {}

class BannerMovieStateLoaded extends BannerMovieState {
  final List<MovieModel> datas;
  BannerMovieStateLoaded({required this.datas});
}

class BannerMovieStateError extends BannerMovieState {}

class BannerMovieBloc extends Cubit<BannerMovieState> {
  BannerMovieBloc(super.initialState);

  List<MovieModel> listMovieModel = [];

  void getListMovieModel() async {
    emit(BannerMovieStateLoading());

    try {
      FirebaseFirestore fireStore = FirebaseFirestore.instance;
      final storageBannerMovie = fireStore.collection("movies");
      

      QuerySnapshot<Map<String, dynamic>> result =
          await storageBannerMovie.get();

      // var result1 = storageBannerMovie
      //     .where("day_start", isEqualTo: "02/08/2023")
      //     .snapshots()
      //     .listen((event) {
      //   event.docs.forEach((element) {
      //     print(element.id);
      //   });
      // });
      List<QueryDocumentSnapshot<Map<String, dynamic>>> listDocs = result.docs;

      listDocs.forEach((element) {
        
        final json = element.data();
        
        String id = element.id;
        json["id"] = id;

        listMovieModel.add(MovieModel.fromJson(json));

        emit(BannerMovieStateLoaded(datas: listMovieModel));
      });
    } catch (e) {
      emit(BannerMovieStateError());
    }
  }
}
