// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:ecommerce_store/data/repository/comment_repository.dart';
import 'package:ecommerce_store/model/comment.dart';
part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  ICommentRepository repository;
  CommentBloc(
    this.repository,
  ) : super(CommentLoading()) {
    on<CommentInitializeEvent>((event, emit) async {
      final response = await repository.getComments(event.productId);

      emit(CommentResponse(response));
    });
  }
}
