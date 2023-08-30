class FavModel {
  String? message;

  FavModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}

class AllFavModel {
  List<dynamic>? favorite;

  AllFavModel.fromJson(Map<String, dynamic> json) {
    favorite = json['favorite'];
  }
}
