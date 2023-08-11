import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_ticket_app/homepage_many_choice_for_user/choice_model.dart';

abstract class HomepageChoiceState {}

class HomepageChoiceStateInit extends HomepageChoiceState {}

class HomepageChoiceStateLoading extends HomepageChoiceState {}

class HomepageChoiceStateLoaded extends HomepageChoiceState {
  List<ChoiceModel> datas;
  HomepageChoiceStateLoaded({required this.datas});
}

class HomepageChoiceLoadError extends HomepageChoiceState {}

class HomepageChoiceBloc extends Cubit<HomepageChoiceState> {
  HomepageChoiceBloc(super.initialState);

  List<ChoiceModel> listChoiceModel = [];

  void getChoiceHomepage() async {
    emit(HomepageChoiceStateInit());
    emit(HomepageChoiceStateLoading());

    try {
      FirebaseFirestore fireStore = FirebaseFirestore.instance;
      CollectionReference<Map<String, dynamic>> storage =
          fireStore.collection("choice_homepage");

      QuerySnapshot<Map<String, dynamic>> result = await storage.get();

      List<QueryDocumentSnapshot<Map<String, dynamic>>> listDocs = result.docs;

      listDocs.forEach((element) {
        final json = element.data();

        listChoiceModel.add(ChoiceModel.fromJson(json));
      });

      emit(HomepageChoiceStateLoaded(datas: listChoiceModel));
    } catch (e) {
      emit(HomepageChoiceLoadError());
    }
  }
}
