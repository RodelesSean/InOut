import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class TimeInAndTimeOutOfInternsFirebaseUser {
  TimeInAndTimeOutOfInternsFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

TimeInAndTimeOutOfInternsFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<TimeInAndTimeOutOfInternsFirebaseUser>
    timeInAndTimeOutOfInternsFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<TimeInAndTimeOutOfInternsFirebaseUser>((user) =>
            currentUser = TimeInAndTimeOutOfInternsFirebaseUser(user));
