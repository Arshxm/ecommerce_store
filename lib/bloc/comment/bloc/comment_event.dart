// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'comment_bloc.dart';

@immutable
sealed class CommentEvent {}

class CommentInitializeEvent extends CommentEvent {
  final String productId;
  CommentInitializeEvent({
    required this.productId,
  });
  
}
