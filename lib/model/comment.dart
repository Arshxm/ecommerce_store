// ignore_for_file: public_member_api_docs, sort_constructors_first
class Comment {
  String id;
  String text;
  String productId;
  String userId;
  Comment({
    required this.id,
    required this.text,
    required this.productId,
    required this.userId,
  });

  factory Comment.fromMapJson(Map<String, dynamic> jsonObject) {
    return Comment(
      id: jsonObject['id'],
      text: jsonObject['text'],
      productId: jsonObject['product_id'],
      userId: jsonObject['user_id'],
    );
  }
}
