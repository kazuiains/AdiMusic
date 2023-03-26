import 'dart:convert';

import 'package:musik/domain/entities/response/search_response.dart';

SearchResponseModel searchResponseModelFromJson(String str) =>
    SearchResponseModel.fromJson(json.decode(str));

String searchResponseModelToJson(SearchResponseModel data) =>
    json.encode(data.toJson());

class SearchResponseModel extends SearchResponse {
  SearchResponseModel({
    wrapperType,
    kind,
    artistId,
    collectionId,
    trackId,
    artistName,
    collectionName,
    trackName,
    collectionCensoredName,
    trackCensoredName,
    artistViewUrl,
    collectionViewUrl,
    trackViewUrl,
    previewUrl,
    artworkUrl30,
    artworkUrl60,
    artworkUrl100,
    collectionPrice,
    trackPrice,
    releaseDate,
    collectionExplicitness,
    trackExplicitness,
    discCount,
    discNumber,
    trackCount,
    trackNumber,
    trackTimeMillis,
    country,
    currency,
    primaryGenreName,
    isStreamable,
  }) : super(
          wrapperType: wrapperType,
          kind: kind,
          artistId: artistId,
          collectionId: collectionId,
          trackId: trackId,
          artistName: artistName,
          collectionName: collectionName,
          trackName: trackName,
          collectionCensoredName: collectionCensoredName,
          trackCensoredName: trackCensoredName,
          artistViewUrl: artistViewUrl,
          collectionViewUrl: collectionViewUrl,
          trackViewUrl: trackViewUrl,
          previewUrl: previewUrl,
          artworkUrl30: artworkUrl30,
          artworkUrl60: artworkUrl60,
          artworkUrl100: artworkUrl100,
          collectionPrice: collectionPrice,
          trackPrice: trackPrice,
          releaseDate: releaseDate,
          collectionExplicitness: collectionExplicitness,
          trackExplicitness: trackExplicitness,
          discCount: discCount,
          discNumber: discNumber,
          trackCount: trackCount,
          trackNumber: trackNumber,
          trackTimeMillis: trackTimeMillis,
          country: country,
          currency: currency,
          primaryGenreName: primaryGenreName,
          isStreamable: isStreamable,
        );

  SearchResponseModel.fromJson(dynamic json) {
    wrapperType = json['wrapperType'];
    kind = json['kind'];
    artistId = json['artistId'];
    collectionId = json['collectionId'];
    trackId = json['trackId'];
    artistName = json['artistName'];
    collectionName = json['collectionName'];
    trackName = json['trackName'];
    collectionCensoredName = json['collectionCensoredName'];
    trackCensoredName = json['trackCensoredName'];
    artistViewUrl = json['artistViewUrl'];
    collectionViewUrl = json['collectionViewUrl'];
    trackViewUrl = json['trackViewUrl'];
    previewUrl = json['previewUrl'];
    artworkUrl30 = json['artworkUrl30'];
    artworkUrl60 = json['artworkUrl60'];
    artworkUrl100 = json['artworkUrl100'];
    collectionPrice = json['collectionPrice'];
    trackPrice = json['trackPrice'];
    releaseDate = json['releaseDate'];
    collectionExplicitness = json['collectionExplicitness'];
    trackExplicitness = json['trackExplicitness'];
    discCount = json['discCount'];
    discNumber = json['discNumber'];
    trackCount = json['trackCount'];
    trackNumber = json['trackNumber'];
    trackTimeMillis = json['trackTimeMillis'];
    country = json['country'];
    currency = json['currency'];
    primaryGenreName = json['primaryGenreName'];
    isStreamable = json['isStreamable'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['wrapperType'] = wrapperType;
    map['kind'] = kind;
    map['artistId'] = artistId;
    map['collectionId'] = collectionId;
    map['trackId'] = trackId;
    map['artistName'] = artistName;
    map['collectionName'] = collectionName;
    map['trackName'] = trackName;
    map['collectionCensoredName'] = collectionCensoredName;
    map['trackCensoredName'] = trackCensoredName;
    map['artistViewUrl'] = artistViewUrl;
    map['collectionViewUrl'] = collectionViewUrl;
    map['trackViewUrl'] = trackViewUrl;
    map['previewUrl'] = previewUrl;
    map['artworkUrl30'] = artworkUrl30;
    map['artworkUrl60'] = artworkUrl60;
    map['artworkUrl100'] = artworkUrl100;
    map['collectionPrice'] = collectionPrice;
    map['trackPrice'] = trackPrice;
    map['releaseDate'] = releaseDate;
    map['collectionExplicitness'] = collectionExplicitness;
    map['trackExplicitness'] = trackExplicitness;
    map['discCount'] = discCount;
    map['discNumber'] = discNumber;
    map['trackCount'] = trackCount;
    map['trackNumber'] = trackNumber;
    map['trackTimeMillis'] = trackTimeMillis;
    map['country'] = country;
    map['currency'] = currency;
    map['primaryGenreName'] = primaryGenreName;
    map['isStreamable'] = isStreamable;
    return map;
  }

  _initFromEntity(SearchResponse entity) {
    wrapperType = entity.wrapperType;
    kind = entity.kind;
    artistId = entity.artistId;
    collectionId = entity.collectionId;
    trackId = entity.trackId;
    artistName = entity.artistName;
    collectionName = entity.collectionName;
    trackName = entity.trackName;
    collectionCensoredName = entity.collectionCensoredName;
    trackCensoredName = entity.trackCensoredName;
    artistViewUrl = entity.artistViewUrl;
    collectionViewUrl = entity.collectionViewUrl;
    trackViewUrl = entity.trackViewUrl;
    previewUrl = entity.previewUrl;
    artworkUrl30 = entity.artworkUrl30;
    artworkUrl60 = entity.artworkUrl60;
    artworkUrl100 = entity.artworkUrl100;
    collectionPrice = entity.collectionPrice;
    trackPrice = entity.trackPrice;
    releaseDate = entity.releaseDate;
    collectionExplicitness = entity.collectionExplicitness;
    trackExplicitness = entity.trackExplicitness;
    discCount = entity.discCount;
    discNumber = entity.discNumber;
    trackCount = entity.trackCount;
    trackNumber = entity.trackNumber;
    trackTimeMillis = entity.trackTimeMillis;
    country = entity.country;
    currency = entity.currency;
    primaryGenreName = entity.primaryGenreName;
    isStreamable = entity.isStreamable;
  }

  SearchResponseModel.fromDynamic(dynamic dynamicEntity) {
    var dataEntity = (dynamicEntity as SearchResponse);
    _initFromEntity(dataEntity);
  }

  SearchResponseModel.fromEntity(SearchResponse entity) {
    _initFromEntity(entity);
  }
}
