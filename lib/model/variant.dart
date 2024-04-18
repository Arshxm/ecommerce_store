// ignore_for_file: public_member_api_docs, sort_constructors_first
class Variant {
  String? id;
  String? name;
  String? typeId;
  String? value;
  int? priceChange; 
  Variant({
    this.id,
    this.name,
    this.typeId,
    this.value,
    this.priceChange,
  });
  
  factory Variant.fromjson(Map<String,dynamic>jsonObject){
    return 
    Variant(
      id: jsonObject['id'],
      name: jsonObject['name'],
      typeId: jsonObject['type_id'],
      value: jsonObject['value'],
      priceChange: jsonObject['price_change'],
    );
  }
}
