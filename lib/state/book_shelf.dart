import 'package:flutter_bloc/flutter_bloc.dart';

class BookShelfState {
  List<String> booksId = [];
  String urlBase =
      "https://storage.googleapis.com/pixa-wall-6dae7.appspot.com/champions_body/";
  BookShelfState(this.booksId);
}

abstract class BookShelfEvent {
  const BookShelfEvent();
}

class AddBookShelfEvent extends BookShelfEvent {
  final String bookId;
  const AddBookShelfEvent(this.bookId);
}

class RemoveBookShelfEvent extends BookShelfEvent {
  final String bookId;
  const RemoveBookShelfEvent(this.bookId);
}

class BookShelfBloc extends Bloc<BookShelfEvent, BookShelfState> {
  BookShelfBloc(super.initialState) {
    on<AddBookShelfEvent>((event, emit) {
      state.booksId.add(event.bookId);
      emit(BookShelfState(state.booksId));
    });

    on<RemoveBookShelfEvent>((event, emit) {
      state.booksId.remove(event.bookId);
      emit(BookShelfState(state.booksId));
    });
  }
}
