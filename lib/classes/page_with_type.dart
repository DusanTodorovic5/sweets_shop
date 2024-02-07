enum PageType {
  full,
  onlyRight,
  nothing,
}

abstract class PageWithType {
  PageType get pageType;
}
