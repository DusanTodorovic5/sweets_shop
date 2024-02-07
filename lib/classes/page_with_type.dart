enum PageType {
  full,
  onlyLeft,
  nothing,
}

abstract class PageWithType {
  PageType get pageType;
}
