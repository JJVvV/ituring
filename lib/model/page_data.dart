class PageData<T> {
  final List<T>? data;
  final bool hasNextPage;
  const PageData({
    required this.data,
    required this.hasNextPage,
  });
}
