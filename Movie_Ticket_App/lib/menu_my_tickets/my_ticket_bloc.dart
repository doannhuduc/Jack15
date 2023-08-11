import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_ticket_app/menu_my_tickets/ticket_model.dart';

abstract class MyTicketState {}

class MyTicketStateInit extends MyTicketState {}

class MyTicketStateLoading extends MyTicketState {}

class MyTicketStateLoaded extends MyTicketState {
  List<TicketModel> data = [];

  MyTicketStateLoaded({required this.data});
}

class MyTicketStateError extends MyTicketState {}

class MyTicketBloc extends Cubit<MyTicketState> {
  MyTicketBloc(super.initialState);
  List<TicketModel> list = [];

  void getMyTicket() async {
    emit(MyTicketStateInit());
    emit(MyTicketStateLoading());

    try {
      FirebaseFirestore fireStore = FirebaseFirestore.instance;

      final storage = fireStore.collection("tickets");
      QuerySnapshot<Map<String, dynamic>> result = await storage.get();
      List<QueryDocumentSnapshot<Map<String, dynamic>>> listDocs = result.docs;

      listDocs.forEach((element) {
        final json = element.data();
        list.add(TicketModel.fromJson(json));
        emit(MyTicketStateLoaded(data: list));
      });
    } catch (e) {
      emit(MyTicketStateError());
    }
  }
}
