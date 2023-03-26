class BaseListResponseApi<T> {
  bool? isError;
  int? totalResult;
  List<T>? data;

  BaseListResponseApi({
    this.isError,
    this.totalResult,
    this.data,
  });
}
