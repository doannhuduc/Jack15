import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_ticket_app/list_cinema_by_date_page/cinema_model.dart';

abstract class ListCinemaState {}

class ListCinemaStateInit extends ListCinemaState {}

class ListCinemaStateLoading extends ListCinemaState {}

class ListCinemaStateLoaded extends ListCinemaState {
  final List<CinemaModel> datas;

  ListCinemaStateLoaded({required this.datas});
}

class ListCinemaStateLoadError extends ListCinemaState {}

class ListCinemaBloc extends Cubit<ListCinemaState> {
  ListCinemaBloc(super.initialState);

  void getListCinema(List<dynamic> listIdCinemas) async {
    emit(ListCinemaStateInit());
    emit(ListCinemaStateLoading());

    try {
      FirebaseFirestore fireStore = FirebaseFirestore.instance;
      final storageListCinema = fireStore.collection("movie_theaters");

      QuerySnapshot<Map<String, dynamic>> result =
          await storageListCinema.get();

      List<CinemaModel> listCinemaModel = [];
      List<QueryDocumentSnapshot<Map<String, dynamic>>> listDocs = result.docs;
      for (var index = 0; index < listDocs.length; index++) {
        var element = listDocs[index];



        final json = element.data();

        String id = element.id; // Lấy giá trị 'id' của document

        // Thêm trường "id" vào Map json

        json["id"] = id;

        // và tạo đối tượng CinemaModel

        listCinemaModel.add(CinemaModel.fromJson(json));

        


      }

      var listResult = <CinemaModel>[];
      listIdCinemas.forEach((id) {
        CinemaModel item = listCinemaModel.firstWhere(
            (element) => (element.id ?? "") == id,
            orElse: () => CinemaModel());
        if (item.id != null) {
          listResult.add(item);
        }
      });

      emit(ListCinemaStateLoaded(datas: listResult));
    } catch (e) {
      emit(ListCinemaStateLoadError());
    }
  }
}
