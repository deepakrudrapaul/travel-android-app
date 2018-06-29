import 'package:meta/meta.dart';
import 'package:wanderwagon/redux/feed/feed_state.dart';


@immutable
class AppState {

  final FeedState feedState;

  AppState({
    @required this.feedState
  });



  factory AppState.initial() {
    return AppState(
      feedState: FeedState.initial()
    );
  }


  AppState copyWith({
    FeedState feedState
  }){
    return AppState(
      feedState: feedState ?? this.feedState
    );
  }
}