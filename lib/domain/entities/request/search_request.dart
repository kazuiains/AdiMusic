class SearchRequest {
  String? term;
  String? country;
  String? media;
  bool? isOnlineData;

  SearchRequest({
    this.term,
    this.country,
    this.media,
    this.isOnlineData,
  });

  SearchRequest copyWith({
    String? term,
    String? country,
    String? media,
    bool? isOnlineData,
  }) =>
      SearchRequest(
        term: term ?? this.term,
        country: country ?? this.country,
        media: media ?? this.media,
        isOnlineData: isOnlineData ?? this.isOnlineData,
      );
}
