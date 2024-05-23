import 'package:flutter/material.dart';

class UserWidget extends InheritedWidget {
  String name;
  int age;

  UserWidget({
    super.key,
    required this.name,
    required this.age,
    required Widget child,
  }): super(child: child);

  static UserWidget? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserWidget>();
  }

  static UserWidget of(BuildContext context) {
    final UserWidget? result = maybeOf(context);
    assert(result != null, 'No UserWidget found in context');
    return result!;
  }

  /*@override
  bool updateShouldNotify(UserWidget oldWidget) => name != oldWidget.name || age != oldWidget.age;*/
  @override
  bool updateShouldNotify(UserWidget oldWidget) => name != oldWidget.name;
}
