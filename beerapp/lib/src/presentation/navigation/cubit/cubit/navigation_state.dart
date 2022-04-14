part of 'navigation_cubit.dart';

class NavigationState extends Equatable {
  final NavBarItem navBarItem;
  final int index;

  const NavigationState(
    this.navBarItem,
    this.index,
  );

  @override
  List<Object> get props => [navBarItem, index];
}
