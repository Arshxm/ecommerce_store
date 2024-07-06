class HomeBanner {
  String? id;
  String? collectionId;
  String? thumbnail;
  String? categoryId;
  HomeBanner(
    this.id,
    this.collectionId,
    this.thumbnail,
    this.categoryId,
  );

  factory HomeBanner.fromMapJson(Map<String, dynamic> jsonObject) {
    return HomeBanner(
      jsonObject['id'],
      jsonObject['collectionId'],
      "http://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['thumbnail']}",
      jsonObject['categoryId'],
    );
  }
}
