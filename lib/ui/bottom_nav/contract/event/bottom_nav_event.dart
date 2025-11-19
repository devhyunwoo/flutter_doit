sealed class BottomNavEvent {}

class OnTabItem extends BottomNavEvent {
  final int index;

  OnTabItem(this.index);
}
