import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_ticket_app/banner/banner_model.dart';

enum BannerStateEnum { init, loading, loaded, error }

abstract class BannerState {}

class BannerStateInit extends BannerState {}

class BannerStateLoading extends BannerState {}

class BannerStateLoaded extends BannerState {
  final List<BannerModel> datas;
  BannerStateLoaded({required this.datas});
}

class BannerStateError extends BannerState {}

class BannerBloc extends Cubit<BannerState> {
  BannerBloc(super.initialState);

  // var listBanner = <BannerModel>[];
  List<BannerModel> listBanner = [];

  void getListBanner() async {
    emit(BannerStateLoading());
    try {
      FirebaseFirestore fireStore = FirebaseFirestore.instance;
      final storageBanner = fireStore.collection('movie_banner');
      QuerySnapshot<Map<String, dynamic>> result = await storageBanner.get();
      result.docs.forEach(
        (element) {
          final json = element.data();
          listBanner.add(BannerModel.fromJson(json));
        },
      );

      emit(BannerStateLoaded(datas: listBanner));
    } catch (e) {
      emit(BannerStateError());
    }
  }
}

// class A {
//   String? a;
//   String? b;
//   A({this.a, this.b});

//   static A get instance => A();

//   static A intance() {
//     return A(a: "", b: "");
//   }
// }

// void main() {
//   A firestore = A.intance();
// }
