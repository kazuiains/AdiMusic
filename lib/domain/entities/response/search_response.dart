class SearchResponse {
  String? wrapperType;
  String? kind;
  num? artistId;
  num? collectionId;
  num? trackId;
  String? artistName;
  String? collectionName;
  String? trackName;
  String? collectionCensoredName;
  String? trackCensoredName;
  String? artistViewUrl;
  String? collectionViewUrl;
  String? trackViewUrl;
  String? previewUrl;
  String? artworkUrl30;
  String? artworkUrl60;
  String? artworkUrl100;
  num? collectionPrice;
  num? trackPrice;
  String? releaseDate;
  String? collectionExplicitness;
  String? trackExplicitness;
  num? discCount;
  num? discNumber;
  num? trackCount;
  num? trackNumber;
  num? trackTimeMillis;
  String? country;
  String? currency;
  String? primaryGenreName;
  bool? isStreamable;

  SearchResponse({
    this.wrapperType,
    this.kind,
    this.artistId,
    this.collectionId,
    this.trackId,
    this.artistName,
    this.collectionName,
    this.trackName,
    this.collectionCensoredName,
    this.trackCensoredName,
    this.artistViewUrl,
    this.collectionViewUrl,
    this.trackViewUrl,
    this.previewUrl,
    this.artworkUrl30,
    this.artworkUrl60,
    this.artworkUrl100,
    this.collectionPrice,
    this.trackPrice,
    this.releaseDate,
    this.collectionExplicitness,
    this.trackExplicitness,
    this.discCount,
    this.discNumber,
    this.trackCount,
    this.trackNumber,
    this.trackTimeMillis,
    this.country,
    this.currency,
    this.primaryGenreName,
    this.isStreamable,
  });

  SearchResponse copyWith({
    String? wrapperType,
    String? kind,
    num? artistId,
    num? collectionId,
    num? trackId,
    String? artistName,
    String? collectionName,
    String? trackName,
    String? collectionCensoredName,
    String? trackCensoredName,
    String? artistViewUrl,
    String? collectionViewUrl,
    String? trackViewUrl,
    String? previewUrl,
    String? artworkUrl30,
    String? artworkUrl60,
    String? artworkUrl100,
    num? collectionPrice,
    num? trackPrice,
    String? releaseDate,
    String? collectionExplicitness,
    String? trackExplicitness,
    num? discCount,
    num? discNumber,
    num? trackCount,
    num? trackNumber,
    num? trackTimeMillis,
    String? country,
    String? currency,
    String? primaryGenreName,
    bool? isStreamable,
  }) =>
      SearchResponse(
        wrapperType: wrapperType ?? this.wrapperType,
        kind: kind ?? this.kind,
        artistId: artistId ?? this.artistId,
        collectionId: collectionId ?? this.collectionId,
        trackId: trackId ?? this.trackId,
        artistName: artistName ?? this.artistName,
        collectionName: collectionName ?? this.collectionName,
        trackName: trackName ?? this.trackName,
        collectionCensoredName:
            collectionCensoredName ?? this.collectionCensoredName,
        trackCensoredName: trackCensoredName ?? this.trackCensoredName,
        artistViewUrl: artistViewUrl ?? this.artistViewUrl,
        collectionViewUrl: collectionViewUrl ?? this.collectionViewUrl,
        trackViewUrl: trackViewUrl ?? this.trackViewUrl,
        previewUrl: previewUrl ?? this.previewUrl,
        artworkUrl30: artworkUrl30 ?? this.artworkUrl30,
        artworkUrl60: artworkUrl60 ?? this.artworkUrl60,
        artworkUrl100: artworkUrl100 ?? this.artworkUrl100,
        collectionPrice: collectionPrice ?? this.collectionPrice,
        trackPrice: trackPrice ?? this.trackPrice,
        releaseDate: releaseDate ?? this.releaseDate,
        collectionExplicitness:
            collectionExplicitness ?? this.collectionExplicitness,
        trackExplicitness: trackExplicitness ?? this.trackExplicitness,
        discCount: discCount ?? this.discCount,
        discNumber: discNumber ?? this.discNumber,
        trackCount: trackCount ?? this.trackCount,
        trackNumber: trackNumber ?? this.trackNumber,
        trackTimeMillis: trackTimeMillis ?? this.trackTimeMillis,
        country: country ?? this.country,
        currency: currency ?? this.currency,
        primaryGenreName: primaryGenreName ?? this.primaryGenreName,
        isStreamable: isStreamable ?? this.isStreamable,
      );
}
