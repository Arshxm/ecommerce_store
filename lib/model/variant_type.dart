// ignore_for_file: public_member_api_docs, sort_constructors_first
class VariantType {
  String? id;
  String? name;
  String? title;
  VariantTypeEnum? type;
  VariantType({
    this.id,
    this.name,
    this.title,
    this.type,
  });

  factory VariantType.fromjson(Map<String, dynamic> jsonObject) {
    return VariantType(
      id: jsonObject['id'],
      name: jsonObject['name'],
      title: jsonObject['title'],
      type: _getTypeEnum(jsonObject['type']),
    );
  }


}
  VariantTypeEnum _getTypeEnum(String type) {
    switch (type) {
      case 'Color':
        return VariantTypeEnum.COLOR;

      case 'Storage':
        return VariantTypeEnum.STORAGE;

      case 'Voltage':
        return VariantTypeEnum.VOLTAGE;

      default:
      return VariantTypeEnum.COLOR;
    }
  }

enum VariantTypeEnum { COLOR, STORAGE, VOLTAGE }
