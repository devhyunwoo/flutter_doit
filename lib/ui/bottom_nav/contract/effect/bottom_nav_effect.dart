sealed class BottomNavEffect {}

class NavigateToPage extends BottomNavEffect {
  final int pageIndex;

  NavigateToPage(this.pageIndex);
}
