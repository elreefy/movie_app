class SearchModel {
  SearchModel({
      this.id, 
      this.resultType, 
      this.image, 
      this.title, 
      this.description,});

  SearchModel.fromJson(dynamic json) {
    id = json['id'];
    resultType = json['resultType'];
    image = json['image'];
    title = json['title'];
    description = json['description'];
  }
  String? id;
  String? resultType;
  String? image;
  String? title;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['resultType'] = resultType;
    map['image'] = image;
    map['title'] = title;
    map['description'] = description;
    return map;
  }

}