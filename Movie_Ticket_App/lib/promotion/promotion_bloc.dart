// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_ticket_app/banner/banner_bloc.dart';
import 'package:movie_ticket_app/promotion/promotion_model.dart';

enum PromotionStateEnum { init, loading, loaded, error }

abstract class PromotionState {}

class PromotionStateInit extends PromotionState {}

class PromotionStateLoading extends PromotionState {}

class PromotionStateLoaded extends PromotionState {
  final List<PromotionModel> datas;
  PromotionStateLoaded({
    required this.datas,
  });
}

class PromotionStateError extends PromotionState {}

class PromotionBloc extends Cubit<PromotionState> {
  PromotionBloc(super.initialState);

  List<PromotionModel> listPromotion = [];

  void getListPromotion() async {
    emit(PromotionStateInit());
    emit(PromotionStateLoading());

    try {
// FirebaseFirestore là một lớp trong Firebase cung cấp các phương thức và tính năng để tương tác với Firestore,
// Firestore là dịch vụ cơ sở dữ liệu NoSQL của Firebase
// "instance" là một thuộc tính tĩnh (static property) của lớp FirebaseFirestore.
// Nó cung cấp một thực thể duy nhất của lớp FirebaseFirestore, cho phép chúng ta truy cập đến các phương thức
// và tính năng của Firestore trong Firebase

      FirebaseFirestore fireStore = FirebaseFirestore.instance;

// Tham chiếu đến collection "movie_promotion"
      final storagePromotion = fireStore.collection("movie_promotion");

// Lấy tất cả các documents trong collection "movie_promotion"
      QuerySnapshot<Map<String, dynamic>> result = await storagePromotion.get();

// trả về một danh sách các QueryDocumentSnapshot và thực hiện vòng lặp trên danh sách đó
      result.docs.forEach((element) {
//
// truy cập dữ liệu của một document cụ thể trong Firestore
        final json = element.data();

// thêm đối tượng "PromotionModel" vào List "listPromotion"
        listPromotion.add(PromotionModel.fromJson(json));
      });
      emit(PromotionStateLoaded(datas: listPromotion));
    } catch (e) {
      emit(PromotionStateError());
    }
  }
}
