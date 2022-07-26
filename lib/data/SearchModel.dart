// import 'Results.dart';
//
// class SearchModel {
//   SearchModel({
//       this.searchType,
//       this.expression,
//       this.results,
//       this.errorMessage,});
//
//   SearchModel.fromJson(dynamic json) {
//     searchType = json['searchType'];
//     expression = json['expression'];
//     if (json['results'] != null) {
//       results = [];
//       json['results'].forEach((v) {
//         results?.add(Results.fromJson(v));
//       });
//     }
//     errorMessage = json['errorMessage'];
//   }
//   String? searchType;
//   String? expression;
//   List<Results>? results;
//   String? errorMessage;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['searchType'] = searchType;
//     map['expression'] = expression;
//     if (results != null) {
//       map['results'] = results?.map((v) => v.toJson()).toList();
//     }
//     map['errorMessage'] = errorMessage;
//     return map;
//   }
//
// }