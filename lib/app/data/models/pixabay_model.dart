// To parse this JSON data, do
//
//     final pixaBayModel = pixaBayModelFromJson(jsonString);

import 'dart:convert';

PixaBayModel PixaBayModelFromJson(String str) => PixaBayModel.fromJson(json.decode(str));

String PixaBayModelToJson(PixaBayModel data) => json.encode(data.toJson());

class PixaBayModel {
  PixaBayModel({
    this.total,
    this.totalHits,
    this.hits,
  });
  @override
  String toString() {
    return 'PixaBayModel(total: $total, totalHits: $totalHits, hits: $hits)';
  }

  int? total;
  int? totalHits;
  List<Hit>? hits;

  factory PixaBayModel.fromJson(Map<String, dynamic> json) => PixaBayModel(
        total: json["total"],
        totalHits: json["totalHits"],
        hits: json["hits"] == null
            ? null
            : List<Hit>.from(json["hits"].map((x) => Hit.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "totalHits": totalHits,
        "hits": hits == null
            ? null
            : List<dynamic>.from(hits!.map((x) => x.toJson())),
      };
}

class Hit {
  Hit({
    this.id,
    this.pageUrl,
    this.type,
    this.tags,
    this.previewUrl,
    this.previewWidth,
    this.previewHeight,
    this.webformatUrl,
    this.webformatWidth,
    this.webformatHeight,
    this.largeImageUrl,
    this.imageWidth,
    this.imageHeight,
    this.imageSize,
    this.views,
    this.downloads,
    this.collections,
    this.likes,
    this.comments,
    this.userId,
    this.user,
    this.userImageUrl,
  });

  int? id;
  String? pageUrl;
  Type? type;
  String? tags;
  String? previewUrl;
  int? previewWidth;
  int? previewHeight;
  String? webformatUrl;
  int? webformatWidth;
  int? webformatHeight;
  String? largeImageUrl;
  int? imageWidth;
  int? imageHeight;
  int? imageSize;
  int? views;
  int? downloads;
  int? collections;
  int? likes;
  int? comments;
  int? userId;
  String? user;
  String? userImageUrl;

  @override
  String toString() {
    return 'PixaBayModel(id: $id, pageUrl: $pageUrl, type: $type,tags:$tags,previewUrl: $previewUrl, previewWidth: $previewWidth, type: $type,tags:$tags,previewHeight,webformatUrl:$webformatUrl,webformatWidth:$webformatWidth,webformatHeight:$webformatHeight,largeImageUrl:$largeImageUrl,imageWidth:$imageWidth,imageHeight:$imageHeight,imageSize:$imageSize,views:$views,downloads:$downloads,collections:$collections,likes:$likes,comments:$comments,userId:$userId,user:$user,userImageUrl:$userImageUrl,)';
  }

  factory Hit.fromJson(Map<String, dynamic> json) => Hit(
        id: json["id"],
        pageUrl: json["pageURL"],
        type: json["type"] == null ? null : typeValues.map![json["type"]],
        tags: json["tags"],
        previewUrl: json["previewURL"],
        previewWidth: json["previewWidth"],
        previewHeight: json["previewHeight"],
        webformatUrl: json["webformatURL"],
        webformatWidth: json["webformatWidth"],
        webformatHeight: json["webformatHeight"],
        largeImageUrl: json["largeImageURL"],
        imageWidth: json["imageWidth"],
        imageHeight: json["imageHeight"],
        imageSize: json["imageSize"],
        views: json["views"],
        downloads: json["downloads"],
        collections: json["collections"],
        likes: json["likes"],
        comments: json["comments"],
        userId: json["user_id"],
        user: json["user"],
        userImageUrl: json["userImageURL"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pageURL": pageUrl,
        "type": type == null ? null : typeValues.reverse![type],
        "tags": tags,
        "previewURL": previewUrl,
        "previewWidth": previewWidth,
        "previewHeight": previewHeight,
        "webformatURL": webformatUrl,
        "webformatWidth": webformatWidth,
        "webformatHeight": webformatHeight,
        "largeImageURL": largeImageUrl,
        "imageWidth": imageWidth,
        "imageHeight": imageHeight,
        "imageSize": imageSize,
        "views": views,
        "downloads": downloads,
        "collections": collections,
        "likes": likes,
        "comments": comments,
        "user_id": userId,
        "user": user,
        "userImageURL": userImageUrl,
      };
}

enum Type { PHOTO }

final typeValues = EnumValues({"photo": Type.PHOTO});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
