# state_management_geoapp

A sample Flutter app project for learning state management approaches purpose.

This app has several versions of implementations using state management approaches below.

- Standard ( `StatefulWidget` and `InheritedWidget` )
- Riverpod
- Provider
- BLoC
- GetX
- MobX
- Redux
- global variables ( _not recommended_ )

The goal of this project is to make it clear how different strategies each approach takes in terms of

- initialize state
- update state
- react to state's update
- dispose state
- integration to Flutter's widget tree system
- testing
- etc

# Feedback

Feel free to make Pull Requests or Issues to make better use of the approaches as the author ( @chooyan-eng ) don't know much about them except Provider and Riverpod.

# Features

The current functionality of this app is 

- showing a map
- saving a point
- showing icons of the saved points on the map
- list all the saved points with `ListView`

and below will be added in the future versions

- tracking user's location using `Stream`
- list nearby points
- remove all the points, `dispose` in other words

# Setup

Just `flutter run` after cloning this repository to run this app. No additional setup is required.