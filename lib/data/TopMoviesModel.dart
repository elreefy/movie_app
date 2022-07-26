

class TopMoviesModel {
  late String image;
  late String year;
  late String title;

  TopMoviesModel.fromJson(Map<String, dynamic> json) {
    image = json["image"];
    year = json["year"];
    title = json["title"];
  }
}

// class TopMoviesModel {
//   TopMoviesModel({
//     required this.items,
//     required this.errorMessage,
//   });
//   late final List<Items> items;
//   late final String errorMessage;
//
//   TopMoviesModel.fromJson(Map<String, dynamic> json){
//     items = List.from(json['items']).map((e)=>Items.fromJson(e)).toList();
//     errorMessage = json['errorMessage'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['items'] = items.map((e)=>e.toJson()).toList();
//     _data['errorMessage'] = errorMessage;
//     return _data;
//   }
// }
//
// class Items {
//   Items({
//     required this.id,
//     required this.rank,
//     required this.title,
//     required this.fullTitle,
//     required this.year,
//     required this.image,
//     required this.crew,
//     required this.imDbRating,
//     required this.imDbRatingCount,
//   });
//   late final String id;
//   late final String rank;
//   late final String title;
//   late final String fullTitle;
//   late final String year;
//   late final String image;
//   late final String crew;
//   late final String imDbRating;
//   late final String imDbRatingCount;
//
//   Items.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     rank = json['rank'];
//     title = json['title'];
//     fullTitle = json['fullTitle'];
//     year = json['year'];
//     image = json['image'];
//     crew = json['crew'];
//     imDbRating = json['imDbRating'];
//     imDbRatingCount = json['imDbRatingCount'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['rank'] = rank;
//     _data['title'] = title;
//     _data['fullTitle'] = fullTitle;
//     _data['year'] = year;
//     _data['image'] = image;
//     _data['crew'] = crew;
//     _data['imDbRating'] = imDbRating;
//     _data['imDbRatingCount'] = imDbRatingCount;
//     return _data;
//   }
// }